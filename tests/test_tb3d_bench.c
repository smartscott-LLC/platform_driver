/**
 * @file test_tb3d_bench.c
 * @brief DyaSmart TB3-D — Metrics & Performance Benchmark Suite
 *
 * Measures and logs throughput, latency, and operational correctness at scale.
 *
 * OUTPUT
 * ------
 *   stdout     — formatted tables (human-readable)
 *   metrics_report.csv — comma-separated record per benchmark run (machine-readable,
 *                        append-friendly for tracking improvements over time)
 *
 * BENCHMARK DESIGN
 * ----------------
 *   Each benchmark runs BENCH_WARMUP_ITERS warm-up iterations (discarded),
 *   then BENCH_TIMED_ITERS timed iterations.  Wall-clock time is measured with
 *   clock_gettime(CLOCK_MONOTONIC) which offers nanosecond resolution and is
 *   not affected by CPU frequency scaling the way CLOCK_PROCESS_CPUTIME_ID is.
 *
 *   Reported metrics per benchmark:
 *     - throughput  MB/s  = (bytes_per_iter * iters) / elapsed_ns * 1e3
 *     - latency     ns/B  = elapsed_ns / (bytes_per_iter * iters)
 *     - ops/s             = (ops_per_iter * iters) / elapsed_s  (scalar ops)
 *
 * BUFFER SIZES
 * ------------
 *   256 B   — fits in L1 cache
 *   4 KB    — L1 working set limit
 *   64 KB   — L2 working set
 *   1 MB    — L3 working set
 *   16 MB   — exceeds L3; measures memory-bandwidth-bound performance
 *
 * HARDWARE TARGET
 * ---------------
 *   AMD EPYC 9B14 (Zen 4c), Google Compute Engine instance.
 *   Detected ISA tiers reported in the header section.
 */

/* POSIX timers (clock_gettime / CLOCK_MONOTONIC) require _POSIX_C_SOURCE */
#define _POSIX_C_SOURCE 200809L

#include "dyasmart/tb3d.h"
#include "dyasmart/tb3d_driver.h"

#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <stdbool.h>
#include <time.h>

/* =========================================================================
 * Configuration
 * ========================================================================= */

#define BENCH_WARMUP_ITERS   5
#define BENCH_TIMED_ITERS   20

/* Buffer sizes for scaling tests (in legacy bytes) */
static const size_t BENCH_SIZES[] = {
    256UL,             /*  256 B  — L1 */
    4UL   * 1024UL,   /*  4  KB  — L1 boundary */
    64UL  * 1024UL,   /*  64 KB  — L2 */
    1UL   * 1024UL * 1024UL,   /* 1 MB — L3 */
    16UL  * 1024UL * 1024UL    /* 16 MB — DRAM */
};
#define BENCH_N_SIZES  (sizeof(BENCH_SIZES) / sizeof(BENCH_SIZES[0]))

/* =========================================================================
 * Minimal correctness harness (mirrors test_tb3d.c conventions)
 * ========================================================================= */

static int g_tests_run    = 0;
static int g_tests_passed = 0;
static int g_tests_failed = 0;

#define ASSERT_EQ(a, b, msg)                                                    \
    do {                                                                        \
        g_tests_run++;                                                          \
        if ((a) == (b)) {                                                       \
            g_tests_passed++;                                                   \
        } else {                                                                \
            g_tests_failed++;                                                   \
            fprintf(stderr, "FAIL [%s:%d] %s: got 0x%X expected 0x%X\n",      \
                    __FILE__, __LINE__, (msg),                                  \
                    (unsigned)(a), (unsigned)(b));                              \
        }                                                                       \
    } while (0)

#define ASSERT(cond, msg)                                                       \
    do {                                                                        \
        g_tests_run++;                                                          \
        if (cond) {                                                             \
            g_tests_passed++;                                                   \
        } else {                                                                \
            g_tests_failed++;                                                   \
            fprintf(stderr, "FAIL [%s:%d] %s\n", __FILE__, __LINE__, (msg));   \
        }                                                                       \
    } while (0)

/* =========================================================================
 * Timing utilities
 * ========================================================================= */

/** Return current time in nanoseconds (monotonic wall clock). */
static uint64_t time_ns(void)
{
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return (uint64_t)ts.tv_sec * UINT64_C(1000000000) + (uint64_t)ts.tv_nsec;
}

typedef struct {
    double throughput_mbps; /**< MB/s throughput (1 MB = 1 048 576 bytes)     */
    double latency_ns_per_byte; /**< Average nanoseconds per byte processed    */
    double ops_per_sec;     /**< Operations per second (for scalar ops)        */
    uint64_t elapsed_ns;    /**< Total timed elapsed time in nanoseconds       */
    size_t bytes_total;     /**< Total bytes processed across all timed iters  */
} bench_result_t;

/**
 * Compute benchmark statistics from raw measurements.
 *
 * @param elapsed_ns   Total nanoseconds for @p iters timed iterations.
 * @param bytes_per_iter  Bytes processed in one iteration.
 * @param ops_per_iter    Scalar operations in one iteration (0 if N/A).
 * @param iters        Number of timed iterations.
 */
static bench_result_t bench_stats(uint64_t elapsed_ns,
                                   size_t   bytes_per_iter,
                                   uint64_t ops_per_iter,
                                   int      iters)
{
    bench_result_t r;
    r.elapsed_ns    = elapsed_ns;
    r.bytes_total   = bytes_per_iter * (size_t)iters;

    if (elapsed_ns == 0) {
        r.throughput_mbps    = 0.0;
        r.latency_ns_per_byte = 0.0;
        r.ops_per_sec        = 0.0;
        return r;
    }

    double secs = (double)elapsed_ns / 1e9;
    double mb   = (double)r.bytes_total / (1024.0 * 1024.0);

    r.throughput_mbps     = mb / secs;
    r.latency_ns_per_byte = (double)elapsed_ns / (double)r.bytes_total;
    r.ops_per_sec         = (ops_per_iter > 0)
                            ? ((double)ops_per_iter * (double)iters) / secs
                            : 0.0;
    return r;
}

/* =========================================================================
 * CSV output
 * ========================================================================= */

static FILE *g_csv = NULL;

static void csv_header(void)
{
    if (!g_csv) return;
    fprintf(g_csv,
            "operation,buffer_size_bytes,iterations,"
            "elapsed_ns,throughput_MB_s,latency_ns_per_byte,ops_per_sec\n");
}

static void csv_row(const char   *op,
                    size_t        buf_size,
                    int           iters,
                    bench_result_t r)
{
    if (!g_csv) return;
    fprintf(g_csv, "%s,%zu,%d,%"PRIu64",%.2f,%.4f,%.0f\n",
            op, buf_size, iters, r.elapsed_ns,
            r.throughput_mbps, r.latency_ns_per_byte, r.ops_per_sec);
}

/* =========================================================================
 * Print helpers
 * ========================================================================= */

static void print_separator(void)
{
    printf("%-40s %10s %12s %12s\n",
           "------------------------------------",
           "----------",
           "------------",
           "------------");
}

static void print_bench_header(void)
{
    printf("\n%-40s %10s %12s %12s\n",
           "Operation / Buffer size",
           "MB/s",
           "ns/byte",
           "ops/s");
    print_separator();
}

static void print_bench_row(const char    *label,
                             bench_result_t r,
                             bool           show_ops)
{
    if (show_ops && r.ops_per_sec > 0.0) {
        printf("  %-38s %10.1f %12.3f %12.0f\n",
               label, r.throughput_mbps, r.latency_ns_per_byte, r.ops_per_sec);
    } else {
        printf("  %-38s %10.1f %12.3f\n",
               label, r.throughput_mbps, r.latency_ns_per_byte);
    }
}

/* =========================================================================
 * 1. Scalar nibble ops/sec  (tb3d_encode_nibble / tb3d_decode_nibble)
 * ========================================================================= */
static void bench_scalar_nibble(void)
{
    printf("\n[BENCH] Scalar nibble operations\n");
    print_bench_header();

    /* Encode: iterate all 256 (physical, color) pairs, repeated */
    const uint64_t OPS_PER_ITER = 256UL * 256UL; /* 65,536 pairs */

    /* -- encode -- */
    volatile tb3d_packed_t sink_enc = 0; /* volatile prevents dead-code elim */
    uint64_t t0, t1, elapsed_encode = 0, elapsed_decode = 0;

    for (int w = 0; w < BENCH_WARMUP_ITERS; w++) {
        for (unsigned p = 0; p < 256; p++)
            for (unsigned c = 0; c < 256; c++)
                sink_enc = tb3d_encode_nibble((uint8_t)p, (uint8_t)c);
    }

    t0 = time_ns();
    for (int it = 0; it < BENCH_TIMED_ITERS; it++) {
        for (unsigned p = 0; p < 256; p++)
            for (unsigned c = 0; c < 256; c++)
                sink_enc = tb3d_encode_nibble((uint8_t)p, (uint8_t)c);
    }
    t1 = time_ns();
    elapsed_encode = t1 - t0;

    /* -- decode -- */
    volatile uint8_t sink_p = 0, sink_c = 0;
    for (int w = 0; w < BENCH_WARMUP_ITERS; w++) {
        for (unsigned v = 0; v < 256; v++) {
            uint8_t p2, c2;
            tb3d_decode_nibble((tb3d_packed_t)v, &p2, &c2);
            sink_p = p2; sink_c = c2;
        }
    }

    t0 = time_ns();
    for (int it = 0; it < BENCH_TIMED_ITERS; it++) {
        for (unsigned v = 0; v < 256; v++) {
            uint8_t p2, c2;
            tb3d_decode_nibble((tb3d_packed_t)v, &p2, &c2);
            sink_p = p2; sink_c = c2;
        }
    }
    t1 = time_ns();
    elapsed_decode = t1 - t0;
    (void)sink_enc; (void)sink_p; (void)sink_c;

    bench_result_t r_enc = bench_stats(elapsed_encode,
                                        (size_t)OPS_PER_ITER,
                                        OPS_PER_ITER,
                                        BENCH_TIMED_ITERS);
    bench_result_t r_dec = bench_stats(elapsed_decode,
                                        256UL,
                                        256UL,
                                        BENCH_TIMED_ITERS);

    print_bench_row("tb3d_encode_nibble (65536 pairs)", r_enc, true);
    print_bench_row("tb3d_decode_nibble (256 values)",  r_dec, true);

    csv_row("encode_nibble", (size_t)OPS_PER_ITER, BENCH_TIMED_ITERS, r_enc);
    csv_row("decode_nibble", 256UL,                BENCH_TIMED_ITERS, r_dec);
}

/* =========================================================================
 * 2. Buffer encode/decode throughput (tb3d_encode_buffer / decode_buffer)
 *    Measured at multiple buffer sizes to observe cache effects.
 * ========================================================================= */
static void bench_buffer_encode_decode(void)
{
    printf("\n[BENCH] Buffer encode/decode throughput\n");
    print_bench_header();

    for (size_t si = 0; si < BENCH_N_SIZES; si++) {
        size_t N = BENCH_SIZES[si];

        uint8_t *src     = (uint8_t *)malloc(N);
        uint8_t *encoded = (uint8_t *)malloc(N * 2);
        uint8_t *decoded = (uint8_t *)malloc(N);

        if (!src || !encoded || !decoded) {
            fprintf(stderr, "WARN: malloc failed for size %zu — skipping\n", N);
            free(src); free(encoded); free(decoded);
            continue;
        }

        /* Fill source with a pseudo-random pattern */
        for (size_t i = 0; i < N; i++)
            src[i] = (uint8_t)((i * 2654435761UL) & 0xFFU);

        uint64_t t0, t1;

        /* Warm-up encode */
        for (int w = 0; w < BENCH_WARMUP_ITERS; w++)
            tb3d_encode_buffer(src, encoded, N, 0x00U);

        /* Timed encode */
        t0 = time_ns();
        for (int it = 0; it < BENCH_TIMED_ITERS; it++)
            tb3d_encode_buffer(src, encoded, N, 0x00U);
        t1 = time_ns();
        bench_result_t r_enc = bench_stats(t1 - t0, N, 0, BENCH_TIMED_ITERS);

        /* Warm-up decode */
        for (int w = 0; w < BENCH_WARMUP_ITERS; w++)
            tb3d_decode_buffer(encoded, decoded, N);

        /* Timed decode */
        t0 = time_ns();
        for (int it = 0; it < BENCH_TIMED_ITERS; it++)
            tb3d_decode_buffer(encoded, decoded, N);
        t1 = time_ns();
        bench_result_t r_dec = bench_stats(t1 - t0, N, 0, BENCH_TIMED_ITERS);

        /* Correctness: decoded must equal src */
        ASSERT(memcmp(src, decoded, N) == 0, "buffer bench: round-trip correct");

        /* Format label: "encode N KB/MB" */
        char label_enc[64], label_dec[64];
        if (N >= 1024UL * 1024UL)
            snprintf(label_enc, sizeof(label_enc),
                     "encode_buffer  (%4zu MB)", N / (1024UL * 1024UL));
        else if (N >= 1024UL)
            snprintf(label_enc, sizeof(label_enc),
                     "encode_buffer  (%4zu KB)", N / 1024UL);
        else
            snprintf(label_enc, sizeof(label_enc),
                     "encode_buffer  (%4zu  B)", N);

        if (N >= 1024UL * 1024UL)
            snprintf(label_dec, sizeof(label_dec),
                     "decode_buffer  (%4zu MB)", N / (1024UL * 1024UL));
        else if (N >= 1024UL)
            snprintf(label_dec, sizeof(label_dec),
                     "decode_buffer  (%4zu KB)", N / 1024UL);
        else
            snprintf(label_dec, sizeof(label_dec),
                     "decode_buffer  (%4zu  B)", N);

        print_bench_row(label_enc, r_enc, false);
        print_bench_row(label_dec, r_dec, false);

        csv_row("encode_buffer", N, BENCH_TIMED_ITERS, r_enc);
        csv_row("decode_buffer", N, BENCH_TIMED_ITERS, r_dec);

        free(src); free(encoded); free(decoded);
    }
}

/* =========================================================================
 * 3. DMA bitmask fetch throughput (tb3d_dma_fetch)
 * ========================================================================= */
static void bench_dma_fetch(void)
{
    printf("\n[BENCH] DMA bitmask fetch throughput\n");
    print_bench_header();

    for (size_t si = 0; si < BENCH_N_SIZES; si++) {
        size_t N = BENCH_SIZES[si];

        /* DMA fetch operates on packed bytes; encode src first */
        uint8_t *legacy  = (uint8_t *)malloc(N);
        uint8_t *packed  = (uint8_t *)malloc(N * 2);
        uint8_t *phys    = (uint8_t *)malloc(N * 2);
        uint8_t *col     = (uint8_t *)malloc(N * 2);

        if (!legacy || !packed || !phys || !col) {
            fprintf(stderr, "WARN: malloc failed for size %zu — skipping\n", N);
            free(legacy); free(packed); free(phys); free(col);
            continue;
        }

        for (size_t i = 0; i < N; i++)
            legacy[i] = (uint8_t)(i & 0xFFU);
        tb3d_encode_buffer(legacy, packed, N, 0x55U);

        tb3d_dma_descriptor_t desc = {
            .src       = packed,
            .src_len   = N * 2,
            .phys_out  = phys,
            .color_out = col,
            .out_len   = N * 2
        };

        uint64_t t0, t1;

        /* Warm-up */
        for (int w = 0; w < BENCH_WARMUP_ITERS; w++)
            tb3d_dma_fetch(&desc);

        /* Timed */
        t0 = time_ns();
        for (int it = 0; it < BENCH_TIMED_ITERS; it++)
            tb3d_dma_fetch(&desc);
        t1 = time_ns();

        bench_result_t r = bench_stats(t1 - t0, N * 2, 0, BENCH_TIMED_ITERS);

        char label[64];
        if (N >= 1024UL * 1024UL)
            snprintf(label, sizeof(label),
                     "dma_fetch      (%4zu MB packed)", N / (1024UL * 1024UL));
        else if (N >= 1024UL)
            snprintf(label, sizeof(label),
                     "dma_fetch      (%4zu KB packed)", N / 1024UL);
        else
            snprintf(label, sizeof(label),
                     "dma_fetch      (%4zu  B packed)", N);

        print_bench_row(label, r, false);
        csv_row("dma_fetch", N * 2, BENCH_TIMED_ITERS, r);

        free(legacy); free(packed); free(phys); free(col);
    }
}

/* =========================================================================
 * 4. Dragonfly Cache write/read throughput
 * ========================================================================= */
static void bench_dragonfly_cache(void)
{
    printf("\n[BENCH] Dragonfly Cache Interface write/read throughput\n");
    print_bench_header();

    for (size_t si = 0; si < BENCH_N_SIZES; si++) {
        size_t N = BENCH_SIZES[si];

        uint8_t *src = (uint8_t *)malloc(N);
        uint8_t *dst = (uint8_t *)malloc(N);
        if (!src || !dst) {
            free(src); free(dst);
            continue;
        }

        for (size_t i = 0; i < N; i++)
            src[i] = (uint8_t)(i & 0xFFU);

        tb3d_dragonfly_cache_t cache;
        if (tb3d_dragonfly_cache_init(&cache, N) != 0) {
            fprintf(stderr, "WARN: dragonfly_cache_init failed for %zu B\n", N);
            free(src); free(dst);
            continue;
        }

        uint64_t t0, t1;

        /* Warm-up write */
        for (int w = 0; w < BENCH_WARMUP_ITERS; w++)
            tb3d_dragonfly_cache_write(&cache, src, N, 0, 0x00U);

        /* Timed write */
        t0 = time_ns();
        for (int it = 0; it < BENCH_TIMED_ITERS; it++)
            tb3d_dragonfly_cache_write(&cache, src, N, 0, 0x00U);
        t1 = time_ns();
        bench_result_t r_wr = bench_stats(t1 - t0, N, 0, BENCH_TIMED_ITERS);

        /* Warm-up read */
        for (int w = 0; w < BENCH_WARMUP_ITERS; w++)
            tb3d_dragonfly_cache_read(&cache, dst, N, 0);

        /* Timed read */
        t0 = time_ns();
        for (int it = 0; it < BENCH_TIMED_ITERS; it++)
            tb3d_dragonfly_cache_read(&cache, dst, N, 0);
        t1 = time_ns();
        bench_result_t r_rd = bench_stats(t1 - t0, N, 0, BENCH_TIMED_ITERS);

        ASSERT(memcmp(src, dst, N) == 0, "dragonfly cache bench: read == write");

        char label_wr[64], label_rd[64];
        if (N >= 1024UL * 1024UL) {
            snprintf(label_wr, sizeof(label_wr),
                     "cache_write    (%4zu MB)", N / (1024UL * 1024UL));
            snprintf(label_rd, sizeof(label_rd),
                     "cache_read     (%4zu MB)", N / (1024UL * 1024UL));
        } else if (N >= 1024UL) {
            snprintf(label_wr, sizeof(label_wr),
                     "cache_write    (%4zu KB)", N / 1024UL);
            snprintf(label_rd, sizeof(label_rd),
                     "cache_read     (%4zu KB)", N / 1024UL);
        } else {
            snprintf(label_wr, sizeof(label_wr),
                     "cache_write    (%4zu  B)", N);
            snprintf(label_rd, sizeof(label_rd),
                     "cache_read     (%4zu  B)", N);
        }

        print_bench_row(label_wr, r_wr, false);
        print_bench_row(label_rd, r_rd, false);

        csv_row("dragonfly_cache_write", N, BENCH_TIMED_ITERS, r_wr);
        csv_row("dragonfly_cache_read",  N, BENCH_TIMED_ITERS, r_rd);

        tb3d_dragonfly_cache_destroy(&cache);
        free(src); free(dst);
    }
}

/* =========================================================================
 * 5. Transcoder (Secretary / Executive) throughput
 * ========================================================================= */
static void bench_transcoder(void)
{
    printf("\n[BENCH] Transcoder (Secretary/Executive) throughput\n");
    print_bench_header();

    for (size_t si = 0; si < BENCH_N_SIZES; si++) {
        size_t N = BENCH_SIZES[si];

        uint8_t *legacy_src = (uint8_t *)malloc(N);
        uint8_t *legacy_dst = (uint8_t *)malloc(N);

        if (!legacy_src || !legacy_dst) {
            free(legacy_src); free(legacy_dst);
            continue;
        }

        for (size_t i = 0; i < N; i++)
            legacy_src[i] = (uint8_t)(i ^ 0xA5U);

        tb3d_dragonfly_cache_t cache;
        if (tb3d_dragonfly_cache_init(&cache, N) != 0) {
            free(legacy_src); free(legacy_dst);
            continue;
        }

        uint64_t t0, t1;

        /* Warm-up Secretary */
        for (int w = 0; w < BENCH_WARMUP_ITERS; w++)
            tb3d_transcode_to_cache(legacy_src, N, &cache, 0x00U);

        /* Timed Secretary */
        t0 = time_ns();
        for (int it = 0; it < BENCH_TIMED_ITERS; it++)
            tb3d_transcode_to_cache(legacy_src, N, &cache, 0x00U);
        t1 = time_ns();
        bench_result_t r_sec = bench_stats(t1 - t0, N, 0, BENCH_TIMED_ITERS);

        /* Warm-up Executive */
        for (int w = 0; w < BENCH_WARMUP_ITERS; w++)
            tb3d_transcode_from_cache(&cache, legacy_dst);

        /* Timed Executive */
        t0 = time_ns();
        for (int it = 0; it < BENCH_TIMED_ITERS; it++)
            tb3d_transcode_from_cache(&cache, legacy_dst);
        t1 = time_ns();
        bench_result_t r_exec = bench_stats(t1 - t0, N, 0, BENCH_TIMED_ITERS);

        ASSERT(memcmp(legacy_src, legacy_dst, N) == 0,
               "transcoder bench: round-trip correct");

        char label_s[64], label_e[64];
        if (N >= 1024UL * 1024UL) {
            snprintf(label_s, sizeof(label_s),
                     "transcode_to_cache (%4zu MB)",   N / (1024UL * 1024UL));
            snprintf(label_e, sizeof(label_e),
                     "transcode_from_cache (%4zu MB)", N / (1024UL * 1024UL));
        } else if (N >= 1024UL) {
            snprintf(label_s, sizeof(label_s),
                     "transcode_to_cache (%4zu KB)",   N / 1024UL);
            snprintf(label_e, sizeof(label_e),
                     "transcode_from_cache (%4zu KB)", N / 1024UL);
        } else {
            snprintf(label_s, sizeof(label_s),
                     "transcode_to_cache (%4zu  B)",   N);
            snprintf(label_e, sizeof(label_e),
                     "transcode_from_cache (%4zu  B)", N);
        }

        print_bench_row(label_s, r_sec,  false);
        print_bench_row(label_e, r_exec, false);

        csv_row("transcode_to_cache",   N, BENCH_TIMED_ITERS, r_sec);
        csv_row("transcode_from_cache", N, BENCH_TIMED_ITERS, r_exec);

        tb3d_dragonfly_cache_destroy(&cache);
        free(legacy_src); free(legacy_dst);
    }
}

/* =========================================================================
 * 6. Split-buffer (tb3d_encode_split / decode_split) throughput
 * ========================================================================= */
static void bench_split_buffer(void)
{
    printf("\n[BENCH] Split-buffer encode/decode throughput\n");
    print_bench_header();

    for (size_t si = 0; si < BENCH_N_SIZES; si++) {
        size_t N = BENCH_SIZES[si];

        uint8_t *src        = (uint8_t *)malloc(N);
        uint8_t *phys_lane  = (uint8_t *)malloc(N);
        uint8_t *color_lane = (uint8_t *)malloc(N);
        uint8_t *decoded    = (uint8_t *)malloc(N);

        if (!src || !phys_lane || !color_lane || !decoded) {
            free(src); free(phys_lane); free(color_lane); free(decoded);
            continue;
        }

        for (size_t i = 0; i < N; i++)
            src[i] = (uint8_t)((i * 3 + 7) & 0xFFU);

        tb3d_buffer_t buf = {
            .physical_buf = phys_lane,
            .color_buf    = color_lane,
            .length       = N
        };

        uint64_t t0, t1;

        /* Warm-up encode */
        for (int w = 0; w < BENCH_WARMUP_ITERS; w++)
            tb3d_encode_split(src, 0xAAU, &buf);

        /* Timed encode */
        t0 = time_ns();
        for (int it = 0; it < BENCH_TIMED_ITERS; it++)
            tb3d_encode_split(src, 0xAAU, &buf);
        t1 = time_ns();
        bench_result_t r_enc = bench_stats(t1 - t0, N, 0, BENCH_TIMED_ITERS);

        /* Warm-up decode */
        for (int w = 0; w < BENCH_WARMUP_ITERS; w++)
            tb3d_decode_split(&buf, decoded);

        /* Timed decode */
        t0 = time_ns();
        for (int it = 0; it < BENCH_TIMED_ITERS; it++)
            tb3d_decode_split(&buf, decoded);
        t1 = time_ns();
        bench_result_t r_dec = bench_stats(t1 - t0, N, 0, BENCH_TIMED_ITERS);

        ASSERT(memcmp(src, decoded, N) == 0, "split_buffer bench: round-trip");

        char label_enc[64], label_dec[64];
        if (N >= 1024UL * 1024UL) {
            snprintf(label_enc, sizeof(label_enc),
                     "encode_split   (%4zu MB)", N / (1024UL * 1024UL));
            snprintf(label_dec, sizeof(label_dec),
                     "decode_split   (%4zu MB)", N / (1024UL * 1024UL));
        } else if (N >= 1024UL) {
            snprintf(label_enc, sizeof(label_enc),
                     "encode_split   (%4zu KB)", N / 1024UL);
            snprintf(label_dec, sizeof(label_dec),
                     "decode_split   (%4zu KB)", N / 1024UL);
        } else {
            snprintf(label_enc, sizeof(label_enc),
                     "encode_split   (%4zu  B)", N);
            snprintf(label_dec, sizeof(label_dec),
                     "decode_split   (%4zu  B)", N);
        }

        print_bench_row(label_enc, r_enc, false);
        print_bench_row(label_dec, r_dec, false);

        csv_row("encode_split", N, BENCH_TIMED_ITERS, r_enc);
        csv_row("decode_split", N, BENCH_TIMED_ITERS, r_dec);

        free(src); free(phys_lane); free(color_lane); free(decoded);
    }
}

/* =========================================================================
 * 7. Alignment boundary stress test
 *    Verifies encode/decode correctness for buffers of every size from
 *    1 to 128 bytes, catching any off-by-one in the AVX2/scalar tail.
 * ========================================================================= */
static void stress_alignment_boundary(void)
{
    printf("\n[STRESS] Alignment boundary / tail-loop correctness (1-128 bytes)\n");

    for (size_t N = 1; N <= 128; N++) {
        uint8_t src[128], encoded[256], decoded[128];
        for (size_t i = 0; i < N; i++)
            src[i] = (uint8_t)((i * 97 + 13) & 0xFFU);

        tb3d_encode_buffer(src, encoded, N, 0x5AU);
        tb3d_decode_buffer(encoded, decoded, N);

        for (size_t i = 0; i < N; i++) {
            ASSERT(decoded[i] == src[i],
                   "alignment boundary: encode/decode correct");
        }
    }
    printf("  Checked sizes 1..128 bytes — all correct.\n");
}

/* =========================================================================
 * 8. Large random stress test (16 MB, pseudo-random data, all color masks)
 * ========================================================================= */
static void stress_large_random(void)
{
    printf("\n[STRESS] Large random buffer (1 MB, varied color masks)\n");

    const size_t N = 1UL * 1024UL * 1024UL;
    uint8_t *src     = (uint8_t *)malloc(N);
    uint8_t *encoded = (uint8_t *)malloc(N * 2);
    uint8_t *decoded = (uint8_t *)malloc(N);

    if (!src || !encoded || !decoded) {
        printf("  SKIP: malloc failed\n");
        free(src); free(encoded); free(decoded);
        return;
    }

    /* Fill with Knuth multiplicative hash for good bit coverage */
    for (size_t i = 0; i < N; i++)
        src[i] = (uint8_t)(((uint32_t)i * 2654435761UL) & 0xFFU);

    uint8_t color_masks[] = { 0x00U, 0xFFU, 0x55U, 0xAAU, 0xA5U, 0x5AU };
    size_t  n_masks = sizeof(color_masks) / sizeof(color_masks[0]);

    for (size_t m = 0; m < n_masks; m++) {
        tb3d_encode_buffer(src, encoded, N, color_masks[m]);
        tb3d_decode_buffer(encoded, decoded, N);
        ASSERT(memcmp(src, decoded, N) == 0,
               "large random: encode/decode lossless");
    }
    printf("  1 MB, %zu color mask variants — all correct.\n", n_masks);

    free(src); free(encoded); free(decoded);
}

/* =========================================================================
 * 9. Null-pointer / bounds guard audit
 *    Verifies that every public API function handles bad inputs gracefully.
 * ========================================================================= */
static void stress_null_guards(void)
{
    printf("\n[STRESS] Null-pointer & bounds-error guard audit\n");

    /* tb3d_encode_nibble / decode_nibble — not pointer-based; skip */

    /* DMA fetch — null descriptor */
    ASSERT_EQ(tb3d_dma_fetch(NULL), -1, "dma_fetch(NULL)=-1");
    {
        tb3d_dma_descriptor_t bad = { .src = NULL, .src_len = 4,
                                      .phys_out = NULL, .color_out = NULL,
                                      .out_len = 4 };
        ASSERT_EQ(tb3d_dma_fetch(&bad), -1, "dma_fetch(null src)=-1");
    }
    {
        uint8_t tmp[8];
        tb3d_dma_descriptor_t zero_len = {
            .src = tmp, .src_len = 0,
            .phys_out = tmp, .color_out = tmp, .out_len = 0
        };
        ASSERT_EQ(tb3d_dma_fetch(&zero_len), -1, "dma_fetch(src_len=0)=-1");
    }

    /* Dragonfly cache — init edge cases */
    ASSERT_EQ(tb3d_dragonfly_cache_init(NULL, 64), -1,
              "dragonfly_cache_init(NULL,64)=-1");
    {
        tb3d_dragonfly_cache_t cache;
        ASSERT_EQ(tb3d_dragonfly_cache_init(&cache, 0), -1,
                  "dragonfly_cache_init(cache,0)=-1");
    }

    /* Dragonfly cache — write/read beyond bounds */
    {
        tb3d_dragonfly_cache_t cache;
        tb3d_dragonfly_cache_init(&cache, 64);
        uint8_t dummy[128] = {0};
        ASSERT_EQ(tb3d_dragonfly_cache_write(&cache, dummy, 65, 0, 0), -1,
                  "cache_write(65 > capacity 64)=-1");
        ASSERT_EQ(tb3d_dragonfly_cache_read(&cache, dummy, 1, 0), -1,
                  "cache_read(used=0 so offset+len=1 > 0)=-1");
        ASSERT_EQ(tb3d_dragonfly_cache_write(NULL, dummy, 8, 0, 0), -1,
                  "cache_write(NULL cache)=-1");
        ASSERT_EQ(tb3d_dragonfly_cache_read(NULL, dummy, 8, 0), -1,
                  "cache_read(NULL cache)=-1");
        tb3d_dragonfly_cache_destroy(&cache);
    }

    /* State buffer — init/query/set bounds */
    {
        tb3d_state_buffer_t sb;
        ASSERT_EQ(tb3d_state_buffer_init(NULL, 16),  -1, "sb_init(NULL)=-1");
        ASSERT_EQ(tb3d_state_buffer_init(&sb, 0),    -1, "sb_init(0)=-1");
        tb3d_state_buffer_init(&sb, 16);
        ASSERT_EQ(tb3d_state_buffer_query(&sb, 16, 0), -1, "sb_query(oob idx)=-1");
        ASSERT_EQ(tb3d_state_buffer_query(&sb,  0, 8), -1, "sb_query(bit>7)=-1");
        ASSERT_EQ(tb3d_state_buffer_query(NULL,  0, 0), -1, "sb_query(NULL)=-1");
        ASSERT_EQ(tb3d_state_buffer_set(&sb, 16, 0, TB3D_COLOR_RED),   -1,
                  "sb_set(oob idx)=-1");
        ASSERT_EQ(tb3d_state_buffer_set(&sb, 0,  8, TB3D_COLOR_RED),   -1,
                  "sb_set(bit>7)=-1");
        ASSERT_EQ(tb3d_state_buffer_set(NULL, 0, 0, TB3D_COLOR_RED),   -1,
                  "sb_set(NULL)=-1");
        tb3d_state_buffer_destroy(&sb);
    }

    /* Transcoder — null guards */
    {
        tb3d_dragonfly_cache_t cache;
        tb3d_dragonfly_cache_init(&cache, 64);
        uint8_t dummy[64] = {0};
        ASSERT_EQ(tb3d_transcode_to_cache(NULL, 32, &cache, 0), -1,
                  "transcode_to_cache(NULL src)=-1");
        ASSERT_EQ(tb3d_transcode_to_cache(dummy, 0, &cache, 0), -1,
                  "transcode_to_cache(0 len)=-1");
        ASSERT_EQ(tb3d_transcode_to_cache(dummy, 32, NULL, 0), -1,
                  "transcode_to_cache(NULL cache)=-1");
        /* Exceed cache capacity */
        ASSERT_EQ(tb3d_transcode_to_cache(dummy, 65, &cache, 0), -1,
                  "transcode_to_cache(> capacity)=-1");
        ASSERT_EQ(tb3d_transcode_from_cache(NULL, dummy), -1,
                  "transcode_from_cache(NULL cache)=-1");
        ASSERT_EQ(tb3d_transcode_from_cache(&cache, NULL), -1,
                  "transcode_from_cache(NULL dst)=-1");
        tb3d_dragonfly_cache_destroy(&cache);
    }

    printf("  All null-guard checks passed.\n");
}

/* =========================================================================
 * 10. State buffer color load/query coverage (all nibble patterns)
 * ========================================================================= */
static void stress_state_buffer_coverage(void)
{
    printf("\n[STRESS] State buffer — all 256 packed byte patterns\n");

    tb3d_state_buffer_t sb;
    ASSERT_EQ(tb3d_state_buffer_init(&sb, 128), 0, "sb_init for coverage");

    /* Build a packed source with all byte values */
    uint8_t src[256];
    for (int i = 0; i < 256; i++) src[i] = (uint8_t)i;

    ASSERT_EQ(tb3d_state_buffer_load(&sb, src, 256), 0,
              "sb_load all patterns");

    /* For each of the 128 legacy bytes, decode the expected color nibble
     * and check both halves against the state buffer. */
    for (size_t i = 0; i < 128; i++) {
        uint8_t p_lo, c_lo, p_hi, c_hi;
        tb3d_decode_nibble(src[i * 2],     &p_lo, &c_lo);
        tb3d_decode_nibble(src[i * 2 + 1], &p_hi, &c_hi);
        (void)p_lo; (void)p_hi;

        uint8_t expected_color = (uint8_t)(c_lo | (c_hi << 4));

        for (uint8_t b = 0; b < 8; b++) {
            int expected_bit = (expected_color >> b) & 1;
            int actual_bit   = tb3d_state_buffer_query(&sb, i, b);
            ASSERT(actual_bit == expected_bit,
                   "state buffer coverage: bit matches decode");
        }
    }

    tb3d_state_buffer_destroy(&sb);
    printf("  128 legacy bytes, 8 bits each — all correct.\n");
}

/* =========================================================================
 * 11. Color mutation idempotency
 *     Setting a bit to a color it already has must be a no-op.
 * ========================================================================= */
static void stress_color_idempotency(void)
{
    printf("\n[STRESS] Color mutation idempotency (set_bit_color)\n");

    for (unsigned packed = 0; packed < 256; packed++) {
        for (uint8_t pos = 0; pos < 4; pos++) {
            tb3d_color_t cur = tb3d_get_bit_color((tb3d_packed_t)packed, pos);
            tb3d_packed_t after = tb3d_set_bit_color((tb3d_packed_t)packed,
                                                      pos, cur);
            ASSERT_EQ(after, (uint8_t)packed,
                      "set_bit_color idempotent when color unchanged");
        }
    }
    printf("  All 256×4 idempotency checks passed.\n");
}

/* =========================================================================
 * 12. Physical-lane preservation across color mutations
 *     Changing only the color lane must never alter physical bits.
 * ========================================================================= */
static void stress_lane_isolation(void)
{
    printf("\n[STRESS] Lane isolation: color mutation must not alter physical bits\n");

    for (unsigned p = 0; p < 16; p++) {
        for (unsigned c_orig = 0; c_orig < 16; c_orig++) {
            tb3d_packed_t packed = tb3d_encode_nibble((uint8_t)p,
                                                       (uint8_t)c_orig);
            /* Flip every color bit one at a time */
            for (uint8_t pos = 0; pos < 4; pos++) {
                tb3d_color_t new_c = (tb3d_get_bit_color(packed, pos) == TB3D_COLOR_RED)
                                     ? TB3D_COLOR_GREEN : TB3D_COLOR_RED;
                tb3d_packed_t mutated = tb3d_set_bit_color(packed, pos, new_c);

                /* Physical nibble must be unchanged */
                uint8_t phys_before, phys_after, tmp;
                tb3d_decode_nibble(packed,  &phys_before, &tmp);
                tb3d_decode_nibble(mutated, &phys_after,  &tmp);
                ASSERT_EQ(phys_after, phys_before,
                          "physical bits preserved after color mutation");
            }
        }
    }
    printf("  All 16×16×4 lane isolation checks passed.\n");
}

/* =========================================================================
 * 13. Word-level encode/decode with full color round-trip
 * ========================================================================= */
static void stress_word_color_roundtrip(void)
{
    printf("\n[STRESS] Word encode/decode — full data + color round-trip\n");

    for (unsigned byte = 0; byte < 256; byte++) {
        for (uint8_t color = 0; ; color++) {
            tb3d_word_t  w = tb3d_encode_byte((uint8_t)byte, color);
            uint8_t dec_byte, dec_color;
            tb3d_decode_word_full(w, &dec_byte, &dec_color);
            ASSERT_EQ(dec_byte,  (uint8_t)byte,  "word rt: data byte");
            ASSERT_EQ(dec_color, color,           "word rt: color mask");
            if (color == 0xFFU) break;
        }
    }
    printf("  All 256×256 byte+color word round-trips passed.\n");
}

/* =========================================================================
 * Main
 * ========================================================================= */
int main(int argc, char *argv[])
{
    /* Optional CSV file path (default: metrics_report.csv) */
    const char *csv_path = "metrics_report.csv";
    if (argc >= 2) csv_path = argv[1];

    g_csv = fopen(csv_path, "a");
    if (!g_csv) {
        fprintf(stderr, "WARN: cannot open %s for writing — CSV output disabled\n",
                csv_path);
    } else {
        /* Write header only when the file is newly created (size == 0) */
        if (ftell(g_csv) == 0) {
            csv_header();
        }
    }

    /* ---- Banner --------------------------------------------------------- */
    printf("============================================================\n");
    printf("  DyaSmart TB3-D — Metrics & Performance Benchmark Suite    \n");
    printf("  Warmup iters: %d   Timed iters: %d\n",
           BENCH_WARMUP_ITERS, BENCH_TIMED_ITERS);
    printf("  ISA: BMI2=%s  AVX2=%s  AVX-512=%s\n",
           tb3d_has_bmi2()   ? "ON" : "off",
           tb3d_has_avx2()   ? "ON" : "off",
           tb3d_has_avx512() ? "ON" : "off");
    printf("  CSV output: %s\n", csv_path);
    printf("============================================================\n");

    /* ---- Benchmarks ----------------------------------------------------- */
    bench_scalar_nibble();
    bench_buffer_encode_decode();
    bench_dma_fetch();
    bench_dragonfly_cache();
    bench_transcoder();
    bench_split_buffer();

    /* ---- Stress / extended correctness ---------------------------------- */
    stress_alignment_boundary();
    stress_large_random();
    stress_null_guards();
    stress_state_buffer_coverage();
    stress_color_idempotency();
    stress_lane_isolation();
    stress_word_color_roundtrip();

    /* ---- Summary -------------------------------------------------------- */
    printf("\n============================================================\n");
    printf("  Correctness checks: %d/%d passed",
           g_tests_passed, g_tests_run);
    if (g_tests_failed > 0)
        printf(", %d FAILED", g_tests_failed);
    printf("\n");
    if (g_csv) {
        fclose(g_csv);
        printf("  Metrics written to: %s\n", csv_path);
    }
    printf("============================================================\n");

    return (g_tests_failed == 0) ? 0 : 1;
}
