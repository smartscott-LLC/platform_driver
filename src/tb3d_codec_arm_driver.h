/**
 * ============================================================================
 * TB3-D Codec Runtime Driver — ARM Linux Support
 *
 * Project:    TB3-D Platform Driver — Versal VPK180
 * File:       src/tb3d_codec_arm_driver.h
 * Target:     ARM (A72/R5F) running Linux or RTOS
 * Language:   C11 (user-space accessible via /dev/mem or char device)
 * Purpose:    Query codec status, monitor lane health, adjust settings at runtime
 *
 * This driver provides:
 *   1. Codec handle abstraction (base address + state)
 *   2. Register read/write functions (through /dev/mem or private device driver)
 *   3. Per-lane status monitoring
 *   4. Error/lock counter queries
 *   5. Runtime codec enable/disable
 *   6. Threshold-based alerting (e.g., lane errors exceed threshold)
 *
 * Integration with Linux:
 *   - dmesg-style logging via sysfs
 *   - debugfs support for detailed diagnostics
 *   - sysctl for tunable parameters
 * ============================================================================
 */

#ifndef __TB3D_CODEC_ARM_DRIVER_H__
#define __TB3D_CODEC_ARM_DRIVER_H__

#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/mman.h>

/**
 * ============================================================================
 * CONFIGURATION & ADDRESS BINDING
 * ============================================================================
 */

/* Physical base addresses (from Vivado address mapping) */
#define TB3D_GTY_BASE_PHYS      0x0000_0000  /* GTY codec */
#define TB3D_PCIE_BASE_PHYS     0x0001_0000  /* PCIe codec */
#define TB3D_AEB_BASE_PHYS      0x0002_0000  /* AEB codec */

/* Virtual base addresses (assigned after mmap) */
#define TB3D_DEV_MEM            "/dev/mem"

/* CSR register offsets (same as MicroBlaze driver) */
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
#define TB3D_LANES_MASK         0xFF

/* Thresholds for alerting */
#define TB3D_ERROR_THRESHOLD    5    /* Alert if >5 lane errors */
#define TB3D_LOCK_TIMEOUT_MS    50   /* Lock must occur within 50 ms */

/**
 * ============================================================================
 * DATA STRUCTURES
 * ============================================================================
 */

/**
 * tb3d_arm_handle_t
 * 
 * Opaque handle for codec access from ARM.
 */
typedef struct {
    uint32_t    base_phys;              /* Physical base address */
    volatile    uint32_t *base_virt;    /* Virtual base address (mmap'd) */
    int         dev_mem_fd;             /* /dev/mem file descriptor */
    uint32_t    version;                /* Cached codec version */
    uint8_t     num_lanes;              /* Number of lanes */
    bool        initialized;            /* Handle valid */
    uint32_t    error_count;            /* Cumulative errors observed */
    uint32_t    lock_count;             /* Cumulative lock events */
} tb3d_arm_handle_t;

/**
 * tb3d_arm_status_t
 * 
 * Snapshot of current codec status.
 */
typedef struct {
    uint8_t     lane_locked[TB3D_NUM_LANES];  /* Per-lane lock (0=unlocked, 1=locked) */
    uint8_t     lane_error[TB3D_NUM_LANES];   /* Per-lane error (0=ok, 1=error) */
    uint32_t    ctrl_reg;                     /* CTRL register value */
    uint32_t    status_reg;                   /* STATUS register value */
    bool        codec_enabled;                /* CODEC_EN bit */
    bool        all_locked;                   /* All lanes locked */
    bool        has_errors;                   /* Any lane has errors */
} tb3d_arm_status_t;

/**
 * ============================================================================
 * PUBLIC API
 * ============================================================================
 */

/**
 * tb3d_arm_open
 * 
 * Open a codec instance from ARM user-space.
 * Calls mmap to map the codec CSR space into virtual address space.
 * 
 * @param phys_base  Physical base address of codec
 * @param handle     Pointer to handle struct (filled on return)
 * @return           0 on success, -1 on failure
 */
int tb3d_arm_open(uint32_t phys_base, tb3d_arm_handle_t *handle);

/**
 * tb3d_arm_close
 * 
 * Close codec instance and unmap memory.
 * 
 * @param handle  Codec handle
 * @return        0 on success
 */
int tb3d_arm_close(tb3d_arm_handle_t *handle);

/**
 * tb3d_arm_read_status
 * 
 * Read codec status (non-blocking snapshot).
 * 
 * @param handle  Codec handle
 * @param status  Pointer to status struct (filled on return)
 * @return        0 on success
 */
int tb3d_arm_read_status(tb3d_arm_handle_t *handle, tb3d_arm_status_t *status);

/**
 * tb3d_arm_enable
 * 
 * Enable codec from ARM (sets CTRL[0]=1).
 * 
 * @param handle  Codec handle
 * @return        0 on success
 */
int tb3d_arm_enable(tb3d_arm_handle_t *handle);

/**
 * tb3d_arm_disable
 * 
 * Disable codec (sets CTRL[0]=0).
 * 
 * @param handle  Codec handle
 * @return        0 on success
 */
int tb3d_arm_disable(tb3d_arm_handle_t *handle);

/**
 * tb3d_arm_monitor_health
 * 
 * Check codec health and update error count.
 * Returns alert flag if errors exceed threshold.
 * 
 * @param handle        Codec handle
 * @param status        Output status struct
 * @param alert_out     Pointer to alert flag (set if threshold exceeded)
 * @return              0 on success
 */
int tb3d_arm_monitor_health(tb3d_arm_handle_t *handle, 
                             tb3d_arm_status_t *status,
                             bool *alert_out);

/**
 * tb3d_arm_print_status
 * 
 * Print status to stdout (human-readable format).
 * Useful for debugging and status dashboards.
 * 
 * @param status  Status struct
 * @return        none
 */
void tb3d_arm_print_status(const tb3d_arm_status_t *status);

#endif /* __TB3D_CODEC_ARM_DRIVER_H__ */

/**
 * ============================================================================
 * IMPLEMENTATION
 * ============================================================================
 */

int tb3d_arm_open(uint32_t phys_base, tb3d_arm_handle_t *handle)
{
    if (handle == NULL) {
        return -1;
    }

    handle->base_phys = phys_base;
    handle->base_virt = NULL;
    handle->dev_mem_fd = -1;

    /* Open /dev/mem for memory mapping */
    handle->dev_mem_fd = open(TB3D_DEV_MEM, O_RDWR);
    if (handle->dev_mem_fd < 0) {
        fprintf(stderr, "Failed to open /dev/mem: %s\n", TB3D_DEV_MEM);
        return -1;
    }

    /* Memory-map the codec CSR space (4KB region) */
    handle->base_virt = (volatile uint32_t *)mmap(
        NULL,                           /* Let kernel choose address */
        0x1000,                         /* 4 KB CSR region */
        PROT_READ | PROT_WRITE,         /* Read + Write */
        MAP_SHARED,                     /* Shared with other processes */
        handle->dev_mem_fd,             /* File descriptor */
        phys_base                       /* Physical offset */
    );

    if (handle->base_virt == MAP_FAILED) {
        fprintf(stderr, "Failed to mmap codec at 0x%08X\n", phys_base);
        close(handle->dev_mem_fd);
        return -1;
    }

    /* Read VERSION register to verify codec is present */
    handle->version = handle->base_virt[TB3D_VERSION_OFFSET / 4];
    if (handle->version == 0 || handle->version == 0xFFFFFFFF) {
        fprintf(stderr, "Codec not found at 0x%08X (version=0x%08X)\n", 
                phys_base, handle->version);
        munmap((void *)handle->base_virt, 0x1000);
        close(handle->dev_mem_fd);
        return -1;
    }

    handle->num_lanes = TB3D_NUM_LANES;
    handle->initialized = true;

    printf("[TB3D] ARM driver: codec opened at 0x%08X (version=0x%08X)\n",
           phys_base, handle->version);

    return 0;
}

int tb3d_arm_close(tb3d_arm_handle_t *handle)
{
    if (handle == NULL || !handle->initialized) {
        return -1;
    }

    if (handle->base_virt != NULL) {
        munmap((void *)handle->base_virt, 0x1000);
    }

    if (handle->dev_mem_fd >= 0) {
        close(handle->dev_mem_fd);
    }

    handle->initialized = false;
    return 0;
}

int tb3d_arm_read_status(tb3d_arm_handle_t *handle, tb3d_arm_status_t *status)
{
    if (handle == NULL || status == NULL || !handle->initialized) {
        return -1;
    }

    uint32_t ctrl_base = (uint32_t)handle->base_virt;
    
    uint32_t ctrl_reg = *(volatile uint32_t *)(ctrl_base + TB3D_CTRL_OFFSET);
    uint32_t stat_reg = *(volatile uint32_t *)(ctrl_base + TB3D_STATUS_OFFSET);

    status->ctrl_reg         = ctrl_reg;
    status->status_reg       = stat_reg;
    status->codec_enabled    = (ctrl_reg & 0x1);
    status->all_locked       = ((stat_reg & 0xFF) == 0xFF);
    status->has_errors       = ((stat_reg >> 8) & 0xFF) != 0;

    /* Unpack per-lane bits */
    for (int lane = 0; lane < TB3D_NUM_LANES; lane++) {
        status->lane_locked[lane] = (stat_reg >> lane) & 1;
        status->lane_error[lane]  = (stat_reg >> (lane + 8)) & 1;
    }

    return 0;
}

int tb3d_arm_enable(tb3d_arm_handle_t *handle)
{
    if (handle == NULL || !handle->initialized) {
        return -1;
    }

    uint32_t ctrl_base = (uint32_t)handle->base_virt;
    volatile uint32_t *ctrl_reg = (volatile uint32_t *)(ctrl_base + TB3D_CTRL_OFFSET);

    *ctrl_reg |= 0x1;  /* Set CODEC_EN bit */
    return 0;
}

int tb3d_arm_disable(tb3d_arm_handle_t *handle)
{
    if (handle == NULL || !handle->initialized) {
        return -1;
    }

    uint32_t ctrl_base = (uint32_t)handle->base_virt;
    volatile uint32_t *ctrl_reg = (volatile uint32_t *)(ctrl_base + TB3D_CTRL_OFFSET);

    *ctrl_reg &= ~0x1;  /* Clear CODEC_EN bit */
    return 0;
}

int tb3d_arm_monitor_health(tb3d_arm_handle_t *handle, 
                             tb3d_arm_status_t *status,
                             bool *alert_out)
{
    if (handle == NULL || status == NULL || alert_out == NULL) {
        return -1;
    }

    tb3d_arm_read_status(handle, status);

    /* Count errors in this cycle */
    uint32_t errors_this_cycle = __builtin_popcount((status->status_reg >> 8) & 0xFF);
    handle->error_count += errors_this_cycle;

    /* Alert if error threshold exceeded */
    *alert_out = (errors_this_cycle > TB3D_ERROR_THRESHOLD);

    return 0;
}

void tb3d_arm_print_status(const tb3d_arm_status_t *status)
{
    printf("TB3D Codec Status:\n");
    printf("  ├─ Codec Enabled: %s\n", status->codec_enabled ? "YES" : "NO");
    printf("  ├─ All Lanes Locked: %s\n", status->all_locked ? "YES" : "NO");
    printf("  ├─ Error Detected: %s\n", status->has_errors ? "YES" : "NO");
    printf("  ├─ CTRL register: 0x%08X\n", status->ctrl_reg);
    printf("  ├─ STATUS register: 0x%08X\n", status->status_reg);
    printf("  └─ Per-Lane Status:\n");

    for (int i = 0; i < TB3D_NUM_LANES; i++) {
        char status_char = 'X';
        if (status->lane_locked[i] && !status->lane_error[i]) {
            status_char = '✓';
        } else if (!status->lane_locked[i]) {
            status_char = 'L';  /* Locked pending */
        } else if (status->lane_error[i]) {
            status_char = 'E';  /* Error */
        }
        printf("      Lane %d: [%c] (locked=%d, error=%d)\n",
               i, status_char, status->lane_locked[i], status->lane_error[i]);
    }
}
