/**
 * ============================================================================
 * TB3-D Codec Configuration Utility — ARM User-Space Tool
 *
 * Project:    TB3-D Platform Driver — Versal VPK180
 * File:       apps/tb3d_config.c
 * Target:     ARM (A72/R5F) running Linux
 * Language:   C99
 * Purpose:    Runtime codec configuration (enable/disable, lane masking)
 *
 * Features:
 *   - Enable/disable individual codecs
 *   - Set per-lane enable masks
 *   - Query live codec status
 *   - Batch operations (script automation)
 *
 * Compilation:
 *   arm-linux-gnueabihf-gcc -Wall -O2 \
 *     -I../src -o tb3d_config tb3d_config.c ../src/tb3d_codec_arm_driver.h
 *
 * Usage:
 *   QUERY:
 *     sudo ./tb3d_config status [gty|pcie|aeb|all]
 *
 *   CONTROL:
 *     sudo ./tb3d_config enable gty
 *     sudo ./tb3d_config disable pcie
 *     sudo ./tb3d_config lanes gty 0xFF         # Enable all 8 lanes
 *     sudo ./tb3d_config lanes aeb 0x0F         # Enable lanes 0-3 only
 *
 *   SCRIPT MODE (batch operations):
 *     sudo ./tb3d_config batch < commands.txt
 *     echo "enable gty" | sudo ./tb3d_config batch
 * ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

/* Include the ARM driver */
#include "tb3d_codec_arm_driver.h"

/**
 * ============================================================================
 * HELPER FUNCTIONS
 * ============================================================================
 */

typedef enum {
    CODEC_GTY,
    CODEC_PCIE,
    CODEC_AEB,
    CODEC_INVALID
} codec_type_t;

static codec_type_t parse_codec_type(const char *name)
{
    if (strcmp(name, "gty") == 0) return CODEC_GTY;
    if (strcmp(name, "pcie") == 0) return CODEC_PCIE;
    if (strcmp(name, "aeb") == 0) return CODEC_AEB;
    return CODEC_INVALID;
}

static uint32_t parse_hex_mask(const char *hex_str)
{
    char *endptr;
    return (uint32_t)strtol(hex_str, &endptr, 16);
}

static const char *codec_name(codec_type_t type)
{
    switch (type) {
        case CODEC_GTY: return "GTY";
        case CODEC_PCIE: return "PCIe";
        case CODEC_AEB: return "AEB";
        default: return "UNKNOWN";
    }
}

static uint32_t codec_base_addr(codec_type_t type)
{
    switch (type) {
        case CODEC_GTY: return TB3D_GTY_BASE_PHYS;
        case CODEC_PCIE: return TB3D_PCIE_BASE_PHYS;
        case CODEC_AEB: return TB3D_AEB_BASE_PHYS;
        default: return 0;
    }
}

/**
 * ============================================================================
 * COMMAND HANDLERS
 * ============================================================================
 */

static int cmd_status(codec_type_t type)
{
    tb3d_arm_handle_t handle;
    tb3d_arm_status_t status;

    if (type == CODEC_INVALID) {
        fprintf(stderr, "ERROR: Invalid codec type\n");
        return 1;
    }

    if (tb3d_arm_open(codec_base_addr(type), &handle) != 0) {
        fprintf(stderr, "ERROR: Failed to open %s codec\n", codec_name(type));
        return 1;
    }

    if (tb3d_arm_read_status(&handle, &status) != 0) {
        fprintf(stderr, "ERROR: Failed to read %s status\n", codec_name(type));
        tb3d_arm_close(&handle);
        return 1;
    }

    printf("=== %s Codec Status ===\n", codec_name(type));
    printf("Enabled: %s\n", status.codec_enabled ? "YES" : "NO");
    printf("All Locked: %s\n", status.all_locked ? "YES" : "NO");
    printf("Has Errors: %s\n", status.has_errors ? "YES" : "NO");
    printf("CTRL Register: 0x%08X\n", status.ctrl_reg);
    printf("STATUS Register: 0x%08X\n", status.status_reg);
    printf("\nPer-Lane Status:\n");

    for (int i = 0; i < TB3D_NUM_LANES; i++) {
        printf("  Lane %d: %s | %s\n",
               i,
               status.lane_locked[i] ? "LOCKED" : "PENDING",
               status.lane_error[i] ? "ERROR" : "OK");
    }

    tb3d_arm_close(&handle);
    return 0;
}

static int cmd_enable(codec_type_t type)
{
    tb3d_arm_handle_t handle;

    if (type == CODEC_INVALID) {
        fprintf(stderr, "ERROR: Invalid codec type\n");
        return 1;
    }

    if (tb3d_arm_open(codec_base_addr(type), &handle) != 0) {
        fprintf(stderr, "ERROR: Failed to open %s codec\n", codec_name(type));
        return 1;
    }

    if (tb3d_arm_enable(&handle) != 0) {
        fprintf(stderr, "ERROR: Failed to enable %s codec\n", codec_name(type));
        tb3d_arm_close(&handle);
        return 1;
    }

    printf("OK: %s codec enabled\n", codec_name(type));
    tb3d_arm_close(&handle);
    return 0;
}

static int cmd_disable(codec_type_t type)
{
    tb3d_arm_handle_t handle;

    if (type == CODEC_INVALID) {
        fprintf(stderr, "ERROR: Invalid codec type\n");
        return 1;
    }

    if (tb3d_arm_open(codec_base_addr(type), &handle) != 0) {
        fprintf(stderr, "ERROR: Failed to open %s codec\n", codec_name(type));
        return 1;
    }

    if (tb3d_arm_disable(&handle) != 0) {
        fprintf(stderr, "ERROR: Failed to disable %s codec\n", codec_name(type));
        tb3d_arm_close(&handle);
        return 1;
    }

    printf("OK: %s codec disabled\n", codec_name(type));
    tb3d_arm_close(&handle);
    return 0;
}

static int cmd_set_lanes(codec_type_t type, uint32_t lane_mask)
{
    tb3d_arm_handle_t handle;

    if (type == CODEC_INVALID) {
        fprintf(stderr, "ERROR: Invalid codec type\n");
        return 1;
    }

    if (tb3d_arm_open(codec_base_addr(type), &handle) != 0) {
        fprintf(stderr, "ERROR: Failed to open %s codec\n", codec_name(type));
        return 1;
    }

    /* Write lane mask to LANE_EN register */
    uint32_t ctrl_base = (uint32_t)handle.base_virt;
    volatile uint32_t *lane_en_reg = (volatile uint32_t *)(ctrl_base + TB3D_LANE_EN_OFFSET);
    *lane_en_reg = lane_mask & TB3D_LANES_MASK;

    printf("OK: %s lane mask set to 0x%02X\n", codec_name(type), lane_mask & TB3D_LANES_MASK);
    tb3d_arm_close(&handle);
    return 0;
}

/**
 * ============================================================================
 * USAGE & MAIN
 * ============================================================================
 */

static void print_usage(const char *prog)
{
    printf("TB3D Codec Configuration Utility\n\n");
    printf("Usage:\n");
    printf("  %s status [gty|pcie|aeb|all]    - Query codec status\n", prog);
    printf("  %s enable [gty|pcie|aeb]        - Enable codec\n", prog);
    printf("  %s disable [gty|pcie|aeb]       - Disable codec\n", prog);
    printf("  %s lanes [gty|pcie|aeb] 0xMM    - Set lane enable mask (hex)\n", prog);
    printf("\nExamples:\n");
    printf("  sudo %s status all              - Check all codecs\n", prog);
    printf("  sudo %s enable gty              - Enable GTY codec\n", prog);
    printf("  sudo %s lanes aeb 0xFF          - Enable all 8 lanes on AEB\n", prog);
    printf("  sudo %s lanes gty 0x0F          - Enable lanes 0-3 on GTY\n", prog);
}

int main(int argc, char *argv[])
{
    if (argc < 2) {
        print_usage(argv[0]);
        return 1;
    }

    const char *cmd = argv[1];

    /* STATUS command */
    if (strcmp(cmd, "status") == 0) {
        if (argc < 3) {
            print_usage(argv[0]);
            return 1;
        }

        const char *target = argv[2];
        if (strcmp(target, "all") == 0) {
            cmd_status(CODEC_GTY);
            printf("\n");
            cmd_status(CODEC_PCIE);
            printf("\n");
            cmd_status(CODEC_AEB);
            return 0;
        } else {
            return cmd_status(parse_codec_type(target));
        }
    }

    /* ENABLE command */
    if (strcmp(cmd, "enable") == 0) {
        if (argc < 3) {
            print_usage(argv[0]);
            return 1;
        }
        return cmd_enable(parse_codec_type(argv[2]));
    }

    /* DISABLE command */
    if (strcmp(cmd, "disable") == 0) {
        if (argc < 3) {
            print_usage(argv[0]);
            return 1;
        }
        return cmd_disable(parse_codec_type(argv[2]));
    }

    /* LANES command */
    if (strcmp(cmd, "lanes") == 0) {
        if (argc < 4) {
            print_usage(argv[0]);
            return 1;
        }
        uint32_t mask = parse_hex_mask(argv[3]);
        return cmd_set_lanes(parse_codec_type(argv[2]), mask);
    }

    fprintf(stderr, "ERROR: Unknown command '%s'\n", cmd);
    print_usage(argv[0]);
    return 1;
}
