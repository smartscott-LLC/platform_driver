/**
 * ============================================================================
 * Bare Metal Codec Driver — TB3-D GTY Transceiver Codec Controller
 * ============================================================================
 *
 * Project:    TB3-D Platform Driver — Versal VPK180
 * Target:     MicroBlaze (running on PMC)
 * Language:   C11 (bare metal, no OS)
 * Purpose:    Initialize and monitor GTY codec at boot time
 * 
 * Key responsibilities:
 *   1. Early boot initialization (before ARM processors wake)
 *   2. Per-lane enable/disable and monitoring
 *   3. Transceiver DRP access for runtime reconfiguration
 *   4. Error detection and reporting
 *
 * ============================================================================
 */

#ifndef __TB3D_CODEC_DRIVER_H__
#define __TB3D_CODEC_DRIVER_H__

#include <stdint.h>
#include <stdbool.h>
#include <string.h>

/**
 * ============================================================================
 * CONFIGURATION & ADDRESS SPACE
 * ============================================================================
 */

/* Codec module base addresses (from Vivado address mapping) */
#define TB3D_GTY_CODEC_BASE     0x00000000  /* GTY codec main instance */
#define TB3D_PCIE_CODEC_BASE    0x00010000  /* PCIe codec (optional) */
#define TB3D_AEB_CODEC_BASE     0x00020000  /* AEB codec (optional) */

/* CSR Register offsets (from ORCHESTRATOR_INTERFACE_SPEC.md) */
#define TB3D_CTRL_OFFSET        0x00
#define TB3D_STATUS_OFFSET      0x04
#define TB3D_LANE_EN_OFFSET     0x08
#define TB3D_DRP_ADDR_OFFSET    0x0C
#define TB3D_DRP_RDATA_OFFSET   0x10
#define TB3D_STAT_LOCK_OFFSET   0x14
#define TB3D_STAT_ERROR_OFFSET  0x18
#define TB3D_VERSION_OFFSET     0x1C

/* Codec parameters */
#define TB3D_NUM_LANES          8
#define TB3D_LANES_MASK         0xFF        /* All 8 lanes */

/* Timeouts (in loop iterations — tune for 200 MHz axi_clk) */
#define TB3D_LOCK_TIMEOUT_MS    50
#define TB3D_LOCK_ITERATIONS    (200000 * TB3D_LOCK_TIMEOUT_MS / 1000)  /* ~10M iterations for 50ms */

/**
 * ============================================================================
 * UTILITY MACROS FOR REGISTER I/O
 * ============================================================================
 */

/* Safe register read: offset from base address */
#define TB3D_READ_REG(base, offset) \
    (*(volatile uint32_t *)(base + offset))

/* Safe register write: offset from base address */
#define TB3D_WRITE_REG(base, offset, value) \
    do { *(volatile uint32_t *)(base + offset) = (value); } while(0)

/* Read-modify-write: set specific bits */
#define TB3D_RMW_REG(base, offset, mask, value) \
    do { \
        uint32_t __tmp = TB3D_READ_REG(base, offset); \
        __tmp = (__tmp & ~(mask)) | ((value) & (mask)); \
        TB3D_WRITE_REG(base, offset, __tmp); \
    } while(0)

/**
 * ============================================================================
 * CTRL REGISTER BIT DEFINITIONS
 * ============================================================================
 */

#define TB3D_CTRL_CODEC_EN      (1 << 0)   /* [0]: Master codec enable */
#define TB3D_CTRL_DRP_EN        (1 << 1)   /* [1]: DRP controller enable */
#define TB3D_CTRL_STAT_RST      (1 << 2)   /* [2]: Reset error/lock counters */
#define TB3D_CTRL_BYPASS_MODE   (1 << 3)   /* [3]: Debug bypass (pass-through) */
#define TB3D_CTRL_IRQ_EN        (1 << 4)   /* [4]: Interrupt on lane error */
#define TB3D_CTRL_LP_MODE       (1 << 5)   /* [5]: Low-power mode */

/**
 * ============================================================================
 * STATUS REGISTER BIT DEFINITIONS
 * ============================================================================
 */

#define TB3D_STATUS_LANE_LOCKED(lane)   ((1 << (lane)) & 0xFF)
#define TB3D_STATUS_LANE_ERROR(lane)    ((1 << ((lane) + 8)) & 0xFF00)
#define TB3D_STATUS_ALL_LOCKED          0x000000FF
#define TB3D_STATUS_ALL_ERRORS          0x0000FF00

/**
 * ============================================================================
 * DATA STRUCTURES
 * ============================================================================
 */

/**
 * tb3d_codec_handle_t
 * 
 * Opaque handle for a codec instance. Contains base address and state.
 * Multiple codecs (GTY, PCIe, AEB) can be controlled independently.
 */
typedef struct {
    uint32_t base_addr;           /* Base address in address space */
    uint32_t version;             /* Codec firmware version (cached) */
    uint8_t  num_lanes;           /* Number of active lanes */
    bool     initialized;         /* Initialization complete */
    uint32_t error_count;         /* Cumulative error count */
    uint32_t lock_count;          /* Successful lock events */
} tb3d_codec_handle_t;

/**
 * tb3d_codec_status_t
 * 
 * Per-lane status snapshot. Used for monitoring and debug.
 */
typedef struct {
    uint8_t lane_locked[TB3D_NUM_LANES];  /* Bit 0 = locked, bit 1 = error */
    uint32_t ctrl_reg;                    /* Shadow of CTRL register */
    uint32_t status_reg;                  /* Raw STATUS register value */
} tb3d_codec_status_t;

/**
 * ============================================================================
 * PUBLIC API
 * ============================================================================
 */

/**
 * tb3d_codec_open
 * 
 * Initialize a codec instance and return a handle.
 * Does NOT enable the codec yet (requires explicit enable call).
 *
 * @param base_addr  Base address of codec CSR space (from Vivado)
 * @param handle     Pointer to handle struct (filled on return)
 * @return           0 on success, negative error code on failure
 */
int tb3d_codec_open(uint32_t base_addr, tb3d_codec_handle_t *handle);

/**
 * tb3d_codec_enable
 * 
 * Enable codec in normal operation mode.
 * Codecs power up disabled; this activates encoding/decoding.
 *
 * @param handle     Codec handle
 * @return           0 on success
 */
int tb3d_codec_enable(tb3d_codec_handle_t *handle);

/**
 * tb3d_codec_disable
 * 
 * Disable codec (pass-through mode).
 * Useful for debug or safe shutdown.
 *
 * @param handle     Codec handle
 * @return           0 on success
 */
int tb3d_codec_disable(tb3d_codec_handle_t *handle);

/**
 * tb3d_codec_wait_for_lock
 * 
 * Poll lane_locked bits until all lanes are locked or timeout.
 * Blocking call — suitable for boot-time initialization.
 *
 * @param handle     Codec handle
 * @param timeout_ms Timeout in milliseconds
 * @return           0 if all lanes locked, <0 on timeout
 */
int tb3d_codec_wait_for_lock(tb3d_codec_handle_t *handle, uint32_t timeout_ms);

/**
 * tb3d_codec_get_status
 * 
 * Read current codec status (lock, error bits).
 * Non-blocking — returns snapshot of STATUS register.
 *
 * @param handle     Codec handle
 * @param status     Pointer to status struct (filled on return)
 * @return           0 on success
 */
int tb3d_codec_get_status(tb3d_codec_handle_t *handle, tb3d_codec_status_t *status);

/**
 * tb3d_codec_reset_counters
 * 
 * Clear error and lock counters.
 * Useful for periodic monitoring or after error recovery.
 *
 * @param handle     Codec handle
 * @return           0 on success
 */
int tb3d_codec_reset_counters(tb3d_codec_handle_t *handle);

/**
 * tb3d_codec_set_lane_enable
 * 
 * Selectively enable/disable individual lanes.
 * Allows graceful degradation if some lanes fail.
 *
 * @param handle     Codec handle
 * @param lane_mask  Bitmask of active lanes (bit i = lane i enable)
 * @return           0 on success
 */
int tb3d_codec_set_lane_enable(tb3d_codec_handle_t *handle, uint8_t lane_mask);

/**
 * tb3d_codec_drp_config
 * 
 * Configure transceiver DRP for runtime reconfiguration.
 * Advanced feature: change line rate, PLL, or encoding mode without reset.
 *
 * @param handle     Codec handle
 * @param drp_addr   GTYP DRP address (10-bit)
 * @param drp_data   DRP write data (16-bit)
 * @return           0 on success, <0 on timeout
 */
int tb3d_codec_drp_config(tb3d_codec_handle_t *handle, uint16_t drp_addr, uint16_t drp_data);

#endif /* __TB3D_CODEC_DRIVER_H__ */

/**
 * ============================================================================
 * IMPLEMENTATION
 * ============================================================================
 */

/**
 * tb3d_codec_open
 * 
 * Reads VERSION register to confirm module presence and version.
 * Initializes handle struct.
 */
int tb3d_codec_open(uint32_t base_addr, tb3d_codec_handle_t *handle)
{
    if (handle == NULL) {
        return -1;  /* EINVAL */
    }

    /* Initialize handle */
    memset(handle, 0, sizeof(tb3d_codec_handle_t));
    handle->base_addr = base_addr;
    handle->num_lanes = TB3D_NUM_LANES;

    /* Read VERSION register to confirm codec is present */
    uint32_t version = TB3D_READ_REG(base_addr, TB3D_VERSION_OFFSET);
    
    if (version == 0 || version == 0xFFFFFFFF) {
        /* Module not accessible or not present */
        return -2;  /* ENODEV */
    }

    handle->version = version;
    handle->initialized = true;

    return 0;  /* Success */
}

/**
 * tb3d_codec_enable
 * 
 * Sets CTRL[0] = 1 to enable codec in normal mode.
 * Data will pass through the encoder/decoder.
 */
int tb3d_codec_enable(tb3d_codec_handle_t *handle)
{
    if (handle == NULL || !handle->initialized) {
        return -1;
    }

    /* Set CODEC_EN bit in CTRL register */
    TB3D_RMW_REG(handle->base_addr, TB3D_CTRL_OFFSET, 
                 TB3D_CTRL_CODEC_EN, TB3D_CTRL_CODEC_EN);

    return 0;
}

/**
 * tb3d_codec_disable
 * 
 * Clears CTRL[0] = 0 to disable codec.
 * Data will pass through unchanged (useful for bypass/debug).
 */
int tb3d_codec_disable(tb3d_codec_handle_t *handle)
{
    if (handle == NULL || !handle->initialized) {
        return -1;
    }

    /* Clear CODEC_EN bit */
    TB3D_RMW_REG(handle->base_addr, TB3D_CTRL_OFFSET, 
                 TB3D_CTRL_CODEC_EN, 0);

    return 0;
}

/**
 * tb3d_codec_wait_for_lock
 * 
 * Polls STATUS register until all lanes assert lane_locked or timeout.
 * 
 * On successful lock:
 *   STATUS[7:0] should read as 0xFF (all lanes locked)
 * 
 * Timeout is approximate (depends on CPU clock frequency).
 */
int tb3d_codec_wait_for_lock(tb3d_codec_handle_t *handle, uint32_t timeout_ms)
{
    if (handle == NULL || !handle->initialized) {
        return -1;
    }

    uint32_t iterations = (TB3D_LOCK_ITERATIONS * timeout_ms) / TB3D_LOCK_TIMEOUT_MS;
    uint32_t iter = 0;

    while (iter < iterations) {
        uint32_t status = TB3D_READ_REG(handle->base_addr, TB3D_STATUS_OFFSET);
        uint8_t lane_locked = status & 0xFF;

        if (lane_locked == TB3D_STATUS_ALL_LOCKED) {
            /* All lanes locked successfully */
            handle->lock_count++;
            return 0;
        }

        iter++;
    }

    /* Timeout */
    handle->error_count++;
    return -3;  /* ETIMEDOUT */
}

/**
 * tb3d_codec_get_status
 * 
 * Reads current codec status without blocking.
 * Returns per-lane lock/error bits and cached CTRL register.
 */
int tb3d_codec_get_status(tb3d_codec_handle_t *handle, tb3d_codec_status_t *status)
{
    if (handle == NULL || status == NULL || !handle->initialized) {
        return -1;
    }

    /* Read STATUS register */
    uint32_t status_reg = TB3D_READ_REG(handle->base_addr, TB3D_STATUS_OFFSET);
    uint32_t ctrl_reg = TB3D_READ_REG(handle->base_addr, TB3D_CTRL_OFFSET);

    status->status_reg = status_reg;
    status->ctrl_reg = ctrl_reg;

    /* Unpack per-lane lock/error bits */
    for (int lane = 0; lane < TB3D_NUM_LANES; lane++) {
        uint8_t locked = (status_reg >> lane) & 1;
        uint8_t error = (status_reg >> (lane + 8)) & 1;
        status->lane_locked[lane] = (locked << 0) | (error << 1);
    }

    return 0;
}

/**
 * tb3d_codec_reset_counters
 * 
 * Clears error and lock event counters.
 * Sets CTRL[2] = 1, then immediately clears it.
 */
int tb3d_codec_reset_counters(tb3d_codec_handle_t *handle)
{
    if (handle == NULL || !handle->initialized) {
        return -1;
    }

    /* Set STAT_RST bit */
    TB3D_RMW_REG(handle->base_addr, TB3D_CTRL_OFFSET, 
                 TB3D_CTRL_STAT_RST, TB3D_CTRL_STAT_RST);

    /* Small delay for reset to propagate */
    volatile int delay = 100;
    while (delay--) {};

    /* Clear STAT_RST bit */
    TB3D_RMW_REG(handle->base_addr, TB3D_CTRL_OFFSET, 
                 TB3D_CTRL_STAT_RST, 0);

    return 0;
}

/**
 * tb3d_codec_set_lane_enable
 * 
 * Writes LANE_EN register to enable/disable per-lane processing.
 * Useful for graceful degradation or selective activation.
 */
int tb3d_codec_set_lane_enable(tb3d_codec_handle_t *handle, uint8_t lane_mask)
{
    if (handle == NULL || !handle->initialized) {
        return -1;
    }

    /* Write LANE_EN register */
    TB3D_WRITE_REG(handle->base_addr, TB3D_LANE_EN_OFFSET, (uint32_t)lane_mask);

    return 0;
}

/**
 * tb3d_codec_drp_config
 * 
 * Configure transceiver DRP for runtime reconfig without reset.
 * 
 * This is an advanced feature that requires the codec's internal DRP FSM.
 * Simple implementation: write address and enable DRP, then poll for ready.
 */
int tb3d_codec_drp_config(tb3d_codec_handle_t *handle, uint16_t drp_addr, uint16_t drp_data)
{
    if (handle == NULL || !handle->initialized) {
        return -1;
    }

    /* Enable DRP controller */
    TB3D_RMW_REG(handle->base_addr, TB3D_CTRL_OFFSET,
                 TB3D_CTRL_DRP_EN, TB3D_CTRL_DRP_EN);

    /* Write DRP address */
    TB3D_WRITE_REG(handle->base_addr, TB3D_DRP_ADDR_OFFSET, (uint32_t)drp_addr);

    /* Poll DRP_RDATA for valid result (simple timeout) */
    for (int iter = 0; iter < 10000; iter++) {
        uint32_t rdata = TB3D_READ_REG(handle->base_addr, TB3D_DRP_RDATA_OFFSET);
        if (rdata != 0) {
            /* DRP transaction completed */
            TB3D_RMW_REG(handle->base_addr, TB3D_CTRL_OFFSET,
                         TB3D_CTRL_DRP_EN, 0);  /* Disable DRP */
            return 0;
        }
    }

    return -3;  /* ETIMEDOUT */
}

/**
 * ============================================================================
 * BOOT-TIME INITIALIZATION EXAMPLE
 * ============================================================================
 */

/**
 * tb3d_bootstrap
 * 
 * Called early by MicroBlaze boot code (before ARM processors wake).
 * Initializes all TB3D codec modules and establishes "board sovereignty".
 * 
 * This is the key function that puts the entire platform under TB3D control.
 */
int tb3d_bootstrap(void)
{
    int status = 0;

    /* ====================================================================
     * Phase 1: Discover codec modules
     * ==================================================================== */

    tb3d_codec_handle_t gty_codec, pcie_codec, aeb_codec;

    status = tb3d_codec_open(TB3D_GTY_CODEC_BASE, &gty_codec);
    if (status < 0) {
        /* GTY codec not found — critical failure */
        return -1;
    }

    /* Optional: Initialize secondary codecs if present */
    tb3d_codec_open(TB3D_PCIE_CODEC_BASE, &pcie_codec);
    tb3d_codec_open(TB3D_AEB_CODEC_BASE, &aeb_codec);

    /* ====================================================================
     * Phase 2: Configure and enable codecs
     * ==================================================================== */

    /* GTY: Enable all lanes and activate encoder/decoder */
    tb3d_codec_set_lane_enable(&gty_codec, TB3D_LANES_MASK);
    tb3d_codec_enable(&gty_codec);

    /* PCIe: Enable if present */
    if (pcie_codec.initialized) {
        tb3d_codec_set_lane_enable(&pcie_codec, TB3D_LANES_MASK);
        tb3d_codec_enable(&pcie_codec);
    }

    /* AEB: Enable if present */
    if (aeb_codec.initialized) {
        tb3d_codec_set_lane_enable(&aeb_codec, TB3D_LANES_MASK);
        tb3d_codec_enable(&aeb_codec);
    }

    /* ====================================================================
     * Phase 3: Wait for lock and verify all codecs
     * ==================================================================== */

    status = tb3d_codec_wait_for_lock(&gty_codec, 50);
    if (status < 0) {
        /* GTY failed to lock — recovery needed */
        return -2;
    }

    if (pcie_codec.initialized) {
        tb3d_codec_wait_for_lock(&pcie_codec, 50);
    }

    if (aeb_codec.initialized) {
        tb3d_codec_wait_for_lock(&aeb_codec, 50);
    }

    /* ====================================================================
     * Phase 4: System is TB3D-enabled — ready for application
     * ==================================================================== */

    return 0;  /* Success: entire board now speaks TB3D */
}

/**
 * tb3d_monitor
 * 
 * Called periodically (or from watchdog handler) to monitor codec health.
 * Detects lane errors and can trigger recovery.
 * 
 * This can run at application level after MicroBlaze hands over to ARM.
 */
void tb3d_monitor(void)
{
    tb3d_codec_handle_t codec;
    tb3d_codec_status_t status;

    /* Monitor GTY codec */
    if (tb3d_codec_open(TB3D_GTY_CODEC_BASE, &codec) == 0) {
        if (tb3d_codec_get_status(&codec, &status) == 0) {
            uint8_t errors = (status.status_reg >> 8) & 0xFF;
            if (errors != 0) {
                /* Lane error detected — log and optionally reset */
                tb3d_codec_reset_counters(&codec);
            }
        }
    }
}
