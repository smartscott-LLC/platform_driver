/**
 * ============================================================================
 * TB3-D Codec Runtime Monitor — ARM User-Space Application
 *
 * Project:    TB3-D Platform Driver — Versal VPK180
 * File:       apps/tb3d_monitor.c
 * Target:     ARM (A72/R5F) running Linux
 * Language:   C99
 * Purpose:    Real-time codec health monitoring with alerting
 *
 * Features:
 *   - Periodic polling of all codec instances (GTY, PCIe, AEB)
 *   - Per-lane lock status tracking
 *   - Error accumulation and threshold alerting
 *   - Formatted status output to stdout / syslog
 *   - Graceful shutdown (Ctrl-C)
 *
 * Compilation:
 *   arm-linux-gnueabihf-gcc -Wall -O2 -lpthread \
 *     -I../src -o tb3d_monitor tb3d_monitor.c ../src/tb3d_codec_arm_driver.h
 *
 * Usage:
 *   sudo ./tb3d_monitor [poll_interval_ms] [log_file]
 *   Examples:
 *     sudo ./tb3d_monitor 1000           # Poll every 1 second
 *     sudo ./tb3d_monitor 500 /tmp/tb3d.log  # Custom interval + log file
 * ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <signal.h>
#include <time.h>
#include <pthread.h>
#include <syslog.h>

/* Include the ARM driver */
#include "tb3d_codec_arm_driver.h"

/**
 * ============================================================================
 * GLOBAL STATE & CONFIGURATION
 * ============================================================================
 */

typedef struct {
    tb3d_arm_handle_t   gty_codec;
    tb3d_arm_handle_t   pcie_codec;
    tb3d_arm_handle_t   aeb_codec;
    uint32_t            poll_interval_ms;
    FILE               *log_file;
    bool                running;
    pthread_t           monitor_thread;
} tb3d_monitor_ctx_t;

static tb3d_monitor_ctx_t g_ctx = {0};
static volatile sig_atomic_t g_shutdown = 0;

/**
 * ============================================================================
 * SIGNAL HANDLING
 * ============================================================================
 */

static void signal_handler(int sig)
{
    if (sig == SIGINT || sig == SIGTERM) {
        fprintf(stderr, "\n[TB3D] Shutdown signal received\n");
        g_shutdown = 1;
        g_ctx.running = false;
    }
}

/**
 * ============================================================================
 * MONITORING THREAD
 * ============================================================================
 */

static void *monitor_thread_func(void *arg)
{
    (void)arg;

    tb3d_arm_status_t gty_status, pcie_status, aeb_status;
    bool gty_alert, pcie_alert, aeb_alert;
    uint32_t cycle_count = 0;

    while (g_ctx.running && !g_shutdown) {
        cycle_count++;

        /* Read status from each codec */
        int gty_rv   = tb3d_arm_read_status(&g_ctx.gty_codec, &gty_status);
        int pcie_rv  = tb3d_arm_read_status(&g_ctx.pcie_codec, &pcie_status);
        int aeb_rv   = tb3d_arm_read_status(&g_ctx.aeb_codec, &aeb_status);

        /* Monitor health */
        tb3d_arm_monitor_health(&g_ctx.gty_codec, &gty_status, &gty_alert);
        tb3d_arm_monitor_health(&g_ctx.pcie_codec, &pcie_status, &pcie_alert);
        tb3d_arm_monitor_health(&g_ctx.aeb_codec, &aeb_status, &aeb_alert);

        /* Format output */
        time_t now = time(NULL);
        struct tm *tm_info = localtime(&now);
        char timestamp[32];
        strftime(timestamp, sizeof(timestamp), "%Y-%m-%d %H:%M:%S", tm_info);

        fprintf(stdout, "[%s] Cycle %u\n", timestamp, cycle_count);

        if (gty_rv == 0) {
            fprintf(stdout, "  GTY:  %s | %s%s\n",
                    gty_status.codec_enabled ? "ENABLED " : "DISABLED",
                    gty_status.all_locked ? "ALL_LOCKED" : "LOCK_PND",
                    gty_alert ? " [ALERT]" : "");
            if (gty_status.has_errors) {
                fprintf(stdout, "       ERROR DETECTED - Lanes: ");
                for (int i = 0; i < TB3D_NUM_LANES; i++) {
                    if (gty_status.lane_error[i]) {
                        fprintf(stdout, "%d ", i);
                    }
                }
                fprintf(stdout, "\n");
            }
        } else {
            fprintf(stdout, "  GTY:  [OFFLINE]\n");
        }

        if (pcie_rv == 0) {
            fprintf(stdout, "  PCIe: %s | %s%s\n",
                    pcie_status.codec_enabled ? "ENABLED " : "DISABLED",
                    pcie_status.all_locked ? "ALL_LOCKED" : "LOCK_PND",
                    pcie_alert ? " [ALERT]" : "");
            if (pcie_status.has_errors) {
                fprintf(stdout, "       ERROR DETECTED\n");
            }
        } else {
            fprintf(stdout, "  PCIe: [OFFLINE]\n");
        }

        if (aeb_rv == 0) {
            fprintf(stdout, "  AEB:  %s | %s%s\n",
                    aeb_status.codec_enabled ? "ENABLED " : "DISABLED",
                    aeb_status.all_locked ? "ALL_LOCKED" : "LOCK_PND",
                    aeb_alert ? " [ALERT]" : "");
            if (aeb_status.has_errors) {
                fprintf(stdout, "       ERROR DETECTED\n");
            }
        } else {
            fprintf(stdout, "  AEB:  [OFFLINE]\n");
        }

        fprintf(stdout, "\n");

        /* Log to file if enabled */
        if (g_ctx.log_file) {
            fprintf(g_ctx.log_file, "[%s] Cycle %u | GTY=%s PCIe=%s AEB=%s\n",
                    timestamp, cycle_count,
                    gty_rv == 0 ? (gty_status.all_locked ? "OK" : "LOCKING") : "ERR",
                    pcie_rv == 0 ? (pcie_status.all_locked ? "OK" : "LOCKING") : "ERR",
                    aeb_rv == 0 ? (aeb_status.all_locked ? "OK" : "LOCKING") : "ERR");
            fflush(g_ctx.log_file);
        }

        /* Alert via syslog if requested */
        if (gty_alert) {
            syslog(LOG_WARNING, "TB3D GTY codec error threshold exceeded");
        }
        if (pcie_alert) {
            syslog(LOG_WARNING, "TB3D PCIe codec error threshold exceeded");
        }
        if (aeb_alert) {
            syslog(LOG_WARNING, "TB3D AEB codec error threshold exceeded");
        }

        /* Sleep for poll interval */
        usleep(g_ctx.poll_interval_ms * 1000);
    }

    return NULL;
}

/**
 * ============================================================================
 * MAIN ENTRY POINT
 * ============================================================================
 */

int main(int argc, char *argv[])
{
    /* Default configuration */
    g_ctx.poll_interval_ms = 1000;  /* 1 second default */
    g_ctx.log_file = NULL;
    g_ctx.running = true;

    /* Parse command-line arguments */
    if (argc >= 2) {
        g_ctx.poll_interval_ms = atoi(argv[1]);
        if (g_ctx.poll_interval_ms < 100) {
            fprintf(stderr, "Poll interval must be >= 100 ms\n");
            return 1;
        }
    }

    if (argc >= 3) {
        g_ctx.log_file = fopen(argv[2], "w");
        if (g_ctx.log_file == NULL) {
            fprintf(stderr, "Failed to open log file: %s\n", argv[2]);
            return 1;
        }
    }

    printf("TB3D Codec Monitor\n");
    printf("==================\n");
    printf("Poll Interval: %u ms\n", g_ctx.poll_interval_ms);
    if (g_ctx.log_file) {
        printf("Log File: %s\n", argv[2]);
    }
    printf("\nPress Ctrl-C to exit.\n\n");

    /* Register signal handlers */
    signal(SIGINT, signal_handler);
    signal(SIGTERM, signal_handler);

    /* Open codec instances */
    printf("[TB3D] Opening codecs...\n");

    if (tb3d_arm_open(TB3D_GTY_BASE_PHYS, &g_ctx.gty_codec) != 0) {
        fprintf(stderr, "[TB3D] WARNING: GTY codec not accessible\n");
    }

    if (tb3d_arm_open(TB3D_PCIE_BASE_PHYS, &g_ctx.pcie_codec) != 0) {
        fprintf(stderr, "[TB3D] WARNING: PCIe codec not accessible\n");
    }

    if (tb3d_arm_open(TB3D_AEB_BASE_PHYS, &g_ctx.aeb_codec) != 0) {
        fprintf(stderr, "[TB3D] WARNING: AEB codec not accessible\n");
    }

    printf("[TB3D] All codecs opened. Starting monitor thread...\n\n");

    /* Start monitor thread */
    if (pthread_create(&g_ctx.monitor_thread, NULL, monitor_thread_func, NULL) != 0) {
        fprintf(stderr, "Failed to create monitor thread\n");
        return 1;
    }

    /* Wait for shutdown signal */
    pthread_join(g_ctx.monitor_thread, NULL);

    /* Cleanup */
    printf("\n[TB3D] Shutting down...\n");

    tb3d_arm_close(&g_ctx.gty_codec);
    tb3d_arm_close(&g_ctx.pcie_codec);
    tb3d_arm_close(&g_ctx.aeb_codec);

    if (g_ctx.log_file) {
        fclose(g_ctx.log_file);
    }

    printf("[TB3D] Monitor exited cleanly\n");

    return 0;
}
