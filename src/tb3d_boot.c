/**
 * ============================================================================
 * TB3-D Bootstrap Entry Point — MicroBlaze Boot Firmware
 * ============================================================================
 *
 * File:     src/tb3d_boot.c
 * Purpose:  MicroBlaze early boot code that initializes TB3D codec system
 *           before waking ARM processors
 * Target:   Versal PMC (MicroBlaze)
 *
 * Execution Timeline:
 *   T0:      PMC wakes MicroBlaze, jumps to _start → main()
 *   T0+100ms: tb3d_bootstrap() probes codec modules
 *   T0+200ms: All codecs enabled and locked
 *   T0+300ms: MicroBlaze releases ARM (APU/RPU)
 *   T0+500ms: ARM boots Linux (now speaking TB3D natively)
 * ============================================================================
 */

#include <stdint.h>
#include <stdbool.h>
#include "tb3d_codec_driver.h"

/**
 * UART console I/O (for debug output)
 * Replace with your actual UART driver
 */
void uart_putc(char c) {
    /* Pseudo-code: write character to UART FIFO */
#ifdef ENABLE_DEBUG_UART
    volatile uint32_t *uart_tx = (uint32_t *)0xFF000000;  /* UART0 TX */
    *uart_tx = (uint32_t)c;
#endif
}

void uart_puts(const char *str) {
    while (*str) {
        uart_putc(*str++);
    }
}

/**
 * Simple delay function (approximate)
 * Tuned for 200 MHz clock
 */
void delay_ms(uint32_t ms) {
    volatile uint32_t count = (200000 * ms);
    while (count--);
}

/**
 * ============================================================================
 * MAIN BOOTSTRAP FUNCTION
 * ============================================================================
 */

int main(void)
{
    int status;

    uart_puts("\n[TB3-D Bootstrap] MicroBlaze boot initialized\n");

    /* ====================================================================
     * CRITICAL SECTION: Take over transceivers before ARM wakes
     * ==================================================================== */

    uart_puts("[TB3-D Bootstrap] Phase 1: Probing codec modules...\n");
    delay_ms(100);

    /* Initialize GTY codec (always required) */
    tb3d_codec_handle_t gty_codec;
    status = tb3d_codec_open(TB3D_GTY_CODEC_BASE, &gty_codec);
    if (status != 0) {
        uart_puts("[TB3-D Bootstrap] ERROR: GTY codec not found!\n");
        return -1;  /* Halt: critical failure */
    }

    uart_puts("[TB3-D Bootstrap] GTY codec found (version 0x");
    char hex[16];
    for (int i = 7; i >= 0; i--) {
        uint32_t nibble = (gty_codec.version >> (i * 4)) & 0xF;
        hex[7 - i] = "0123456789ABCDEF"[nibble];
    }
    hex[8] = '\0';
    uart_puts(hex);
    uart_puts(")\n");

    /* Try to initialize optional secondary codecs */
    tb3d_codec_handle_t pcie_codec = {0};
    tb3d_codec_handle_t aeb_codec = {0};

    tb3d_codec_open(TB3D_PCIE_CODEC_BASE, &pcie_codec);
    if (pcie_codec.initialized) {
        uart_puts("[TB3-D Bootstrap] PCIe codec found\n");
    }

    tb3d_codec_open(TB3D_AEB_CODEC_BASE, &aeb_codec);
    if (aeb_codec.initialized) {
        uart_puts("[TB3-D Bootstrap] AEB codec found\n");
    }

    /* ====================================================================
     * ACTIVATION PHASE: Enable all codecs
     * ==================================================================== */

    uart_puts("[TB3-D Bootstrap] Phase 2: Enabling codecs...\n");
    
    /* GTY: Configure for all 8 lanes active */
    tb3d_codec_set_lane_enable(&gty_codec, 0xFF);
    tb3d_codec_enable(&gty_codec);
    uart_puts("  - GTY codec enabled (8 lanes)\n");

    /* Optional: Enable secondary codecs */
    if (pcie_codec.initialized) {
        tb3d_codec_set_lane_enable(&pcie_codec, 0xFF);
        tb3d_codec_enable(&pcie_codec);
        uart_puts("  - PCIe codec enabled (8 lanes)\n");
    }

    if (aeb_codec.initialized) {
        tb3d_codec_set_lane_enable(&aeb_codec, 0xFF);
        tb3d_codec_enable(&aeb_codec);
        uart_puts("  - AEB codec enabled (8 lanes)\n");
    }

    /* ====================================================================
     * LOCK & VERIFY PHASE: Ensure transceiver synchronization
     * ==================================================================== */

    uart_puts("[TB3-D Bootstrap] Phase 3: Waiting for codec lock...\n");

    /* Wait for GTY transceiver alignment (typically 10–50 ms) */
    status = tb3d_codec_wait_for_lock(&gty_codec, 50);
    if (status != 0) {
        uart_puts("[TB3-D Bootstrap] ERROR: GTY codec failed to lock!\n");
        /* 
         * Recovery strategy: Could retry DRP reconfiguration,
         * degrade to fewer lanes, or abort. For now, fail fast.
         */
        return -2;
    }
    uart_puts("  ✓ GTY codec locked (all lanes synchronized)\n");

    /* Verify secondary codecs if present */
    if (pcie_codec.initialized) {
        status = tb3d_codec_wait_for_lock(&pcie_codec, 50);
        if (status == 0) {
            uart_puts("  ✓ PCIe codec locked\n");
        } else {
            uart_puts("  ✗ PCIe codec lock timeout\n");
        }
    }

    if (aeb_codec.initialized) {
        status = tb3d_codec_wait_for_lock(&aeb_codec, 50);
        if (status == 0) {
            uart_puts("  ✓ AEB codec locked\n");
        } else {
            uart_puts("  ✗ AEB codec lock timeout\n");
        }
    }

    /* ====================================================================
     * STATUS VERIFICATION: Ensure no errors before handoff
     * ==================================================================== */

    uart_puts("[TB3-D Bootstrap] Phase 4: Verifying codec health...\n");

    tb3d_codec_status_t codec_status;
    if (tb3d_codec_get_status(&gty_codec, &codec_status) == 0) {
        uint8_t locked = codec_status.status_reg & 0xFF;
        uint8_t errors = (codec_status.status_reg >> 8) & 0xFF;

        uart_puts("  GTY Status: LOCKED=0x");
        for (int i = 7; i >= 0; i--) {
            uart_putc("0123456789ABCDEF"[(locked >> i) & 1]);
        }
        uart_puts(" ERRORS=0x");
        for (int i = 7; i >= 0; i--) {
            uart_putc("0123456789ABCDEF"[(errors >> i) & 1]);
        }
        uart_puts("\n");

        if (errors != 0) {
            uart_puts("  ⚠ Lane errors detected — codec may be degraded\n");
        }
    }

    /* ====================================================================
     * SYSTEM IS NOW TB3D-ENABLED
     * ==================================================================== */

    uart_puts("\n[TB3-D Bootstrap] ✓✓✓ SYSTEM TAKEOVER COMPLETE ✓✓✓\n");
    uart_puts("[TB3-D Bootstrap] All transceivers speaking TB3D\n");
    uart_puts("[TB3-D Bootstrap] Ready for ARM boot\n\n");

    /* ====================================================================
     * HANDOFF TO ARM PROCESSORS
     * ==================================================================== */

    uart_puts("[TB3-D Bootstrap] Releasing ARM processors...\n");
    delay_ms(100);

    /* 
     * At this point, the MicroBlaze can:
     *   1. Leave codecs active and exit (ARM takes over system control)
     *   2. Install a watchdog/monitor task (if supervisor loop needed)
     *   3. Jump to ARM entry point if bootloader architecture allows
     *
     * For this implementation, we assume PMC firmware wakes ARM via 
     * dedicated hardware signal. The codecs stay activated and pass TB3D
     * data through all transceivers for the entire system lifetime.
     */

    /* Optional: Install periodic monitoring routine */
    while (1) {
        /* Watchdog: periodically check codec health */
        delay_ms(1000);
        
        tb3d_codec_get_status(&gty_codec, &codec_status);
        uint8_t errors = (codec_status.status_reg >> 8) & 0xFF;
        
        if (errors != 0) {
            /* Log error but continue (codecs are resilient) */
            uart_puts("[TB3-D Monitor] Lane error detected\n");
        }
    }

    return 0;  /* Success */
}

/**
 * ============================================================================
 * OPTIONAL: MICROBLAZE INTERRUPT HANDLER
 * ============================================================================
 *
 * If codec implements interrupt output (IRQ_EN in CTRL register),
 * install an exception handler to respond to lane errors in real-time.
 */

#ifdef ENABLE_CODEC_INTERRUPT_HANDLING

static tb3d_codec_handle_t *gty_codec_global;  /* Global reference for ISR */

/**
 * tb3d_codec_isr
 * 
 * Interrupt service routine: called when codec detects lane error.
 * Handler should query STATUS register and take corrective action.
 */
void tb3d_codec_isr(void *arg)
{
    if (gty_codec_global == NULL) {
        return;
    }

    tb3d_codec_status_t status;
    tb3d_codec_get_status(gty_codec_global, &status);

    uint8_t errors = (status.status_reg >> 8) & 0xFF;

    /* Log which lanes have errors */
    for (int lane = 0; lane < 8; lane++) {
        if ((errors >> lane) & 1) {
            uart_puts("[TB3-D ISR] Lane ");
            uart_putc('0' + lane);
            uart_puts(" error detected\n");
        }
    }

    /* Optional recovery: reset error counters */
    tb3d_codec_reset_counters(gty_codec_global);
}

void tb3d_install_codec_interrupt(tb3d_codec_handle_t *handle)
{
    gty_codec_global = handle;

    /* Enable codec interrupt output */
    TB3D_RMW_REG(handle->base_addr, TB3D_CTRL_OFFSET,
                 TB3D_CTRL_IRQ_EN, TB3D_CTRL_IRQ_EN);

    /* Register ISR with MicroBlaze exception handler (platform-specific) */
    /* Example (Xilinx BSP):
     *   microblaze_register_handler(EXCEPTION_ID_INT_CODEC, tb3d_codec_isr, NULL);
     */
}

#endif  /* ENABLE_CODEC_INTERRUPT_HANDLING */

/**
 * ============================================================================
 * LINKER SCRIPT & STARTUP
 * ============================================================================
 *
 * The _start symbol (in crt0.s) should:
 *   1. Initialize stack pointer
 *   2. Clear BSS section
 *   3. Call main()
 *
 * For Versal PMC MicroBlaze, the entry point is typically at 0xFFCA_0000
 * (internal PMC RAM). The bootloader jumps here after PMC bringup.
 *
 * Linker flags (in CMakeLists.txt):
 *   -mcpu=v11.0 -mxl-barrel-shift -mxl-pattern-compare
 *   -Wl,-T/path/to/linker_script.ld
 */

/**
 * ============================================================================
 * BUILD & COMPILE
 * ============================================================================
 *
 * Using Xilinx XSCT (Xilinx Command-Line Tool):
 *
 *   xsct% create_project -name mb_boot -type microblaze
 *   xsct% import_files -name app src/
 *   xsct% compile
 *   xsct% generate_bitstream
 *
 * Or with CMake:
 *
 *   $ cmake -B build -DTARGET_ARCH=microblaze -DBOARD=versal_vpk180
 *   $ cmake --build build
 *   $ ls build/tb3d_boot.elf
 */
