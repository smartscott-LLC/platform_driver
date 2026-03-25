/**
 * @file test_tb3d.c
 * @brief Comprehensive unit tests for the DyaSmart TB3-D Logic Engine.
 *
 * Tests cover:
 *   1. Scalar encode/decode round-trips (all 256 nibble pairs)
 *   2. Bit-layout verification (physical at 0x55, color at 0xAA)
 *   3. Full-byte encode/decode round-trips (all 256 legacy byte values)
 *   4. Color state query and mutation
 *   5. Buffer encode/decode round-trip
 *   6. Split-buffer (tb3d_buffer_t) encode/decode
 *   7. DMA bitmask layer (tb3d_dma_fetch)
 *   8. Dragonfly Cache Interface (write / read)
 *   9. State Buffer load, query, and set operations
 *  10. Transcoder (Secretary / Executive paths)
 *  11. Lossless reconstruction guarantee (specification claim)
 *  12. Bitmask invariants (spec: 0x55 physical, 0xAA color)
 */

#include "dyasmart/tb3d.h"
#include "dyasmart/tb3d_driver.h"

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* ---- Minimal test harness --------------------------------------------- */

static int  g_tests_run    = 0;
static int  g_tests_passed = 0;
static int  g_tests_failed = 0;

#define ASSERT(cond, msg)                                                      \
    do {                                                                       \
        g_tests_run++;                                                         \
        if (cond) {                                                            \
            g_tests_passed++;                                                  \
        } else {                                                               \
            g_tests_failed++;                                                  \
            fprintf(stderr, "FAIL [%s:%d] %s\n", __FILE__, __LINE__, (msg));  \
        }                                                                      \
    } while (0)

#define ASSERT_EQ(a, b, msg)                                                   \
    do {                                                                       \
        g_tests_run++;                                                         \
        if ((a) == (b)) {                                                      \
            g_tests_passed++;                                                  \
        } else {                                                               \
            g_tests_failed++;                                                  \
            fprintf(stderr, "FAIL [%s:%d] %s: got 0x%X, expected 0x%X\n",    \
                    __FILE__, __LINE__, (msg),                                 \
                    (unsigned)(a), (unsigned)(b));                             \
        }                                                                      \
    } while (0)

/* =========================================================================
 * 1. Scalar nibble encode/decode round-trip (all 256 pairs)
 * ========================================================================= */
static void test_nibble_roundtrip(void)
{
    printf("--- 1. Nibble encode/decode round-trip (all 256 pairs) ---\n");
    for (unsigned p = 0; p < 16; p++) {
        for (unsigned c = 0; c < 16; c++) {
            tb3d_packed_t packed = tb3d_encode_nibble((uint8_t)p, (uint8_t)c);
            uint8_t dec_p, dec_c;
            tb3d_decode_nibble(packed, &dec_p, &dec_c);
            ASSERT_EQ(dec_p, (uint8_t)p, "nibble roundtrip: physical");
            ASSERT_EQ(dec_c, (uint8_t)c, "nibble roundtrip: color");
        }
    }
}

/* =========================================================================
 * 2. Bit-layout verification
 *    Physical bits must land at 0x55 positions; color at 0xAA positions.
 * ========================================================================= */
static void test_bit_layout(void)
{
    printf("--- 2. Bit-layout verification ---\n");

    /*
     * Encode nibble 0xF (all-ones physical) with color 0x0 (all-zeros).
     * The packed byte must have bits ONLY at positions 0,2,4,6 (mask 0x55).
     */
    tb3d_packed_t all_phys = tb3d_encode_nibble(0x0FU, 0x00U);
    ASSERT_EQ(all_phys, TB3D_PHYSICAL_LANE_MASK, "all-phys layout = 0x55");
    ASSERT((all_phys & TB3D_COLOR_LANE_MASK) == 0,
           "all-phys: no color bits set");

    /*
     * Encode nibble 0x0 (all-zeros physical) with color 0xF (all-ones).
     * The packed byte must have bits ONLY at positions 1,3,5,7 (mask 0xAA).
     */
    tb3d_packed_t all_color = tb3d_encode_nibble(0x00U, 0x0FU);
    ASSERT_EQ(all_color, TB3D_COLOR_LANE_MASK, "all-color layout = 0xAA");
    ASSERT((all_color & TB3D_PHYSICAL_LANE_MASK) == 0,
           "all-color: no physical bits set");

    /* OR of both should equal 0xFF */
    ASSERT_EQ((uint8_t)(all_phys | all_color), 0xFFU,
              "all-phys | all-color = 0xFF");

    /* AND of both should equal 0 (lanes don't overlap) */
    ASSERT_EQ((uint8_t)(all_phys & all_color), 0x00U,
              "all-phys & all-color = 0x00 (no overlap)");

    /*
     * Encode nibble 0x5 = 0b0101.
     * Physical bits 0 and 2 should be set → positions 0 and 4 in packed byte.
     * Expected packed physical: 0b00010001 = 0x11
     */
    tb3d_packed_t p5 = tb3d_encode_nibble(0x05U, 0x00U);
    ASSERT_EQ(p5, 0x11U, "physical 0x5 → packed 0x11");

    /*
     * Encode nibble 0x0 physical with color 0x5.
     * Color bits 0 and 2 should land at positions 1 and 5 in packed byte.
     * Expected: 0b00100010 = 0x22
     */
    tb3d_packed_t c5 = tb3d_encode_nibble(0x00U, 0x05U);
    ASSERT_EQ(c5, 0x22U, "color 0x5 → packed 0x22");
}

/* =========================================================================
 * 3. Full-byte encode/decode round-trip (all 256 values)
 * ========================================================================= */
static void test_byte_roundtrip(void)
{
    printf("--- 3. Full-byte encode/decode round-trip (all 256 values) ---\n");
    for (unsigned b = 0; b < 256; b++) {
        for (uint8_t color = 0x00U; color < 0xFFU; color += 0x55U) {
            tb3d_word_t  word   = tb3d_encode_byte((uint8_t)b, color);
            uint8_t      dec_b, dec_c;
            tb3d_decode_word_full(word, &dec_b, &dec_c);
            ASSERT_EQ(dec_b, (uint8_t)b, "byte roundtrip: data");
            ASSERT_EQ(dec_c, color,       "byte roundtrip: color");
        }
    }
}

/* =========================================================================
 * 4. tb3d_decode_byte discards color but preserves data
 * ========================================================================= */
static void test_decode_byte_simple(void)
{
    printf("--- 4. tb3d_decode_byte lossless ---\n");
    for (unsigned b = 0; b < 256; b++) {
        tb3d_word_t word = tb3d_encode_byte((uint8_t)b, 0xA5U);
        uint8_t     out  = tb3d_decode_byte(word);
        ASSERT_EQ(out, (uint8_t)b, "decode_byte lossless");
    }
}

/* =========================================================================
 * 5. Color state query and mutation
 * ========================================================================= */
static void test_color_state(void)
{
    printf("--- 5. Color state query and mutation ---\n");

    /* All-GREEN packed byte */
    tb3d_packed_t green_all = tb3d_encode_nibble(0x0FU, 0x00U);
    for (uint8_t pos = 0; pos < 4; pos++) {
        ASSERT_EQ((int)tb3d_get_bit_color(green_all, pos),
                  (int)TB3D_COLOR_GREEN,
                  "all-physical packed: color is GREEN");
    }

    /* All-RED packed byte */
    tb3d_packed_t red_all = tb3d_encode_nibble(0x00U, 0x0FU);
    for (uint8_t pos = 0; pos < 4; pos++) {
        ASSERT_EQ((int)tb3d_get_bit_color(red_all, pos),
                  (int)TB3D_COLOR_RED,
                  "all-color packed: color is RED");
    }

    /* Set bit 2 to RED, verify others remain GREEN */
    tb3d_packed_t base    = tb3d_encode_nibble(0x0FU, 0x00U);
    tb3d_packed_t updated = tb3d_set_bit_color(base, 2, TB3D_COLOR_RED);
    ASSERT_EQ((int)tb3d_get_bit_color(updated, 0), (int)TB3D_COLOR_GREEN,
              "bit 0 still GREEN after setting bit 2 RED");
    ASSERT_EQ((int)tb3d_get_bit_color(updated, 1), (int)TB3D_COLOR_GREEN,
              "bit 1 still GREEN after setting bit 2 RED");
    ASSERT_EQ((int)tb3d_get_bit_color(updated, 2), (int)TB3D_COLOR_RED,
              "bit 2 is now RED");
    ASSERT_EQ((int)tb3d_get_bit_color(updated, 3), (int)TB3D_COLOR_GREEN,
              "bit 3 still GREEN after setting bit 2 RED");

    /* Clear bit 2 back to GREEN */
    tb3d_packed_t cleared = tb3d_set_bit_color(updated, 2, TB3D_COLOR_GREEN);
    ASSERT_EQ(cleared, base, "clearing bit 2 restores original value");
}

/* =========================================================================
 * 6. Buffer encode/decode round-trip
 * ========================================================================= */
static void test_buffer_roundtrip(void)
{
    printf("--- 6. Buffer encode/decode round-trip ---\n");
    const size_t N = 256;
    uint8_t src[256], encoded[512], decoded[256];

    for (size_t i = 0; i < N; i++) src[i] = (uint8_t)i;

    tb3d_encode_buffer(src, encoded, N, 0x00U);
    tb3d_decode_buffer(encoded, decoded, N);

    for (size_t i = 0; i < N; i++) {
        ASSERT_EQ(decoded[i], src[i], "buffer round-trip byte");
    }
}

/* =========================================================================
 * 7. Split-buffer encode/decode
 * ========================================================================= */
static void test_split_buffer(void)
{
    printf("--- 7. Split-buffer encode/decode ---\n");
    const size_t N = 64;
    uint8_t src[64], phys_lane[64], color_lane[64], decoded[64];

    for (size_t i = 0; i < N; i++) src[i] = (uint8_t)(i * 3 + 7);

    tb3d_buffer_t buf = {
        .physical_buf = phys_lane,
        .color_buf    = color_lane,
        .length       = N
    };

    tb3d_encode_split(src, 0xFFU, &buf);
    tb3d_decode_split(&buf, decoded);

    for (size_t i = 0; i < N; i++) {
        ASSERT_EQ(decoded[i], src[i], "split buffer round-trip");
    }
}

/* =========================================================================
 * 8. DMA bitmask layer
 * ========================================================================= */
static void test_dma_fetch(void)
{
    printf("--- 8. DMA bitmask layer (tb3d_dma_fetch) ---\n");

    /*
     * Encode a known pattern, then use the DMA layer to separate lanes.
     * Physical bits (mask 0x55) should match the spread of the source nibble.
     * Color bits   (mask 0xAA, shifted) should match the spread of the color nibble.
     */
    const size_t N = 32;
    uint8_t src_data[32];
    for (size_t i = 0; i < N; i++) src_data[i] = (uint8_t)i;

    uint8_t packed[32];
    tb3d_encode_buffer(src_data, packed, N / 2, 0x00U); /* N/2 legacy bytes → N packed */

    uint8_t phys_out[32], color_out[32];
    tb3d_dma_descriptor_t desc = {
        .src       = packed,
        .src_len   = N,
        .phys_out  = phys_out,
        .color_out = color_out,
        .out_len   = N
    };

    int ret = tb3d_dma_fetch(&desc);
    ASSERT(ret > 0, "dma_fetch returns positive count");

    /* Verify physical lane: each byte should have bits only at 0x55 positions */
    for (size_t i = 0; i < N; i++) {
        ASSERT((phys_out[i] & TB3D_COLOR_LANE_MASK) == 0,
               "DMA physical out: no color bits");
    }

    /* Verify color lane: after >>1 normalization, bits are at 0x55 positions */
    for (size_t i = 0; i < N; i++) {
        ASSERT((color_out[i] & TB3D_COLOR_LANE_MASK) == 0,
               "DMA color out (normalized): no stray high bits");
    }

    /* Null pointer guard */
    tb3d_dma_descriptor_t bad_desc = { .src = NULL };
    ASSERT_EQ(tb3d_dma_fetch(&bad_desc), -1, "dma_fetch null src returns -1");
    ASSERT_EQ(tb3d_dma_fetch(NULL),      -1, "dma_fetch null desc returns -1");
}

/* =========================================================================
 * 9. Dragonfly Cache Interface
 * ========================================================================= */
static void test_dragonfly_cache(void)
{
    printf("--- 9. Dragonfly Cache Interface ---\n");

    tb3d_dragonfly_cache_t cache;
    ASSERT_EQ(tb3d_dragonfly_cache_init(&cache, 128), 0,
              "dragonfly_cache_init returns 0");
    ASSERT(cache.physical_lane != NULL, "physical_lane allocated");
    ASSERT(cache.color_lane    != NULL, "color_lane allocated");
    ASSERT(cache.capacity >= 128, "capacity >= requested");

    /* Write data */
    uint8_t src[64];
    for (size_t i = 0; i < 64; i++) src[i] = (uint8_t)(i + 1);
    int wr = tb3d_dragonfly_cache_write(&cache, src, 64, 0, 0x55U);
    ASSERT(wr > 0, "dragonfly_cache_write returns positive");
    ASSERT_EQ(cache.used, 64U, "used updated after write");

    /* Read data back */
    uint8_t dst[64];
    int rd = tb3d_dragonfly_cache_read(&cache, dst, 64, 0);
    ASSERT(rd > 0, "dragonfly_cache_read returns positive");
    ASSERT_EQ(memcmp(src, dst, 64), 0, "cache read/write round-trip");

    /* Bounds check: write beyond capacity should fail */
    int overwrite = tb3d_dragonfly_cache_write(&cache, src, 128, 64, 0x00U);
    ASSERT_EQ(overwrite, -1, "write beyond capacity returns -1");

    tb3d_dragonfly_cache_destroy(&cache);
    ASSERT(cache.physical_lane == NULL, "physical_lane NULL after destroy");
    ASSERT(cache.color_lane    == NULL, "color_lane NULL after destroy");
}

/* =========================================================================
 * 10. State Buffer
 * ========================================================================= */
static void test_state_buffer(void)
{
    printf("--- 10. State Buffer ---\n");

    tb3d_state_buffer_t sb;
    ASSERT_EQ(tb3d_state_buffer_init(&sb, 64), 0, "state_buffer_init");

    /* Initially all-GREEN */
    for (size_t i = 0; i < 64; i++) {
        for (uint8_t b = 0; b < 8; b++) {
            ASSERT_EQ(tb3d_state_buffer_query(&sb, i, b),
                      (int)TB3D_COLOR_GREEN,
                      "initial state is GREEN");
        }
    }

    /* Set a bit to RED and verify */
    ASSERT_EQ(tb3d_state_buffer_set(&sb, 5, 3, TB3D_COLOR_RED), 0,
              "state_buffer_set returns 0");
    ASSERT_EQ(tb3d_state_buffer_query(&sb, 5, 3), (int)TB3D_COLOR_RED,
              "queried color is RED after set");
    ASSERT_EQ(tb3d_state_buffer_query(&sb, 5, 2), (int)TB3D_COLOR_GREEN,
              "adjacent bit unaffected");

    /* Clear back to GREEN */
    tb3d_state_buffer_set(&sb, 5, 3, TB3D_COLOR_GREEN);
    ASSERT_EQ(tb3d_state_buffer_query(&sb, 5, 3), (int)TB3D_COLOR_GREEN,
              "color cleared back to GREEN");

    /* Load from a packed buffer */
    uint8_t src[8] = { 0xAAU, 0xAAU, 0xAAU, 0xAAU,
                       0xAAU, 0xAAU, 0xAAU, 0xAAU };
    /* 0xAA packed byte has color nibble 0xF (all color bits set) */
    ASSERT_EQ(tb3d_state_buffer_load(&sb, src, 8), 0, "state_buffer_load");
    /* After loading 8 packed bytes = 4 legacy bytes worth of color data */
    /* Each packed byte 0xAA = all color bits → color nibble = 0xF */
    for (size_t i = 0; i < 4; i++) {
        for (uint8_t b = 0; b < 4; b++) {
            ASSERT_EQ(tb3d_state_buffer_query(&sb, i, b),
                      (int)TB3D_COLOR_RED,
                      "loaded all-RED state");
        }
    }

    /* Bounds check */
    ASSERT_EQ(tb3d_state_buffer_query(&sb, 200, 0), -1, "out-of-bounds query");
    ASSERT_EQ(tb3d_state_buffer_set(&sb, 200, 0, TB3D_COLOR_RED), -1,
              "out-of-bounds set");

    tb3d_state_buffer_destroy(&sb);
    ASSERT(sb.color_nibbles == NULL, "color_nibbles NULL after destroy");
}

/* =========================================================================
 * 11. Transcoder (Secretary / Executive paths)
 * ========================================================================= */
static void test_transcoder(void)
{
    printf("--- 11. Transcoder (Secretary / Executive paths) ---\n");

    tb3d_dragonfly_cache_t cache;
    ASSERT_EQ(tb3d_dragonfly_cache_init(&cache, 256), 0, "cache init for transcoder");

    uint8_t legacy_src[128];
    for (size_t i = 0; i < 128; i++) legacy_src[i] = (uint8_t)(i * 2 + 1);

    /* Secretary path */
    ASSERT_EQ(tb3d_transcode_to_cache(legacy_src, 128, &cache, 0x00U), 0,
              "transcode_to_cache returns 0");
    ASSERT_EQ(cache.used, 128U, "cache.used = 128 after transcode");

    /* Executive path */
    uint8_t legacy_dst[128];
    ASSERT_EQ(tb3d_transcode_from_cache(&cache, legacy_dst), 0,
              "transcode_from_cache returns 0");
    ASSERT_EQ(memcmp(legacy_src, legacy_dst, 128), 0,
              "transcoder round-trip lossless");

    /* Null guards */
    ASSERT_EQ(tb3d_transcode_to_cache(NULL, 128, &cache, 0), -1,
              "transcode_to_cache null src");
    ASSERT_EQ(tb3d_transcode_from_cache(NULL, legacy_dst), -1,
              "transcode_from_cache null cache");

    tb3d_dragonfly_cache_destroy(&cache);
}

/* =========================================================================
 * 12. Lossless reconstruction guarantee (specification claim)
 *     "100% bit-accurate (Lossless Ternary-to-Binary reconstruction)"
 * ========================================================================= */
static void test_lossless_guarantee(void)
{
    printf("--- 12. Lossless reconstruction guarantee ---\n");
    const size_t N = 256;
    uint8_t src[256], encoded[512], decoded[256];

    for (size_t i = 0; i < N; i++) src[i] = (uint8_t)i;

    /* GREEN color */
    tb3d_encode_buffer(src, encoded, N, 0x00U);
    tb3d_decode_buffer(encoded, decoded, N);
    ASSERT_EQ(memcmp(src, decoded, N), 0, "lossless with GREEN color");

    /* RED color */
    tb3d_encode_buffer(src, encoded, N, 0xFFU);
    tb3d_decode_buffer(encoded, decoded, N);
    ASSERT_EQ(memcmp(src, decoded, N), 0, "lossless with RED color");

    /* Mixed color */
    tb3d_encode_buffer(src, encoded, N, 0xA5U);
    tb3d_decode_buffer(encoded, decoded, N);
    ASSERT_EQ(memcmp(src, decoded, N), 0, "lossless with mixed color 0xA5");

    /* Edge values */
    uint8_t edge[2] = { 0x00U, 0xFFU };
    uint8_t edge_enc[4], edge_dec[2];
    tb3d_encode_buffer(edge, edge_enc, 2, 0x55U);
    tb3d_decode_buffer(edge_enc, edge_dec, 2);
    ASSERT_EQ(edge_dec[0], 0x00U, "edge 0x00 lossless");
    ASSERT_EQ(edge_dec[1], 0xFFU, "edge 0xFF lossless");
}

/* =========================================================================
 * 13. Bitmask invariants (spec: 0x55 physical, 0xAA color)
 * ========================================================================= */
static void test_bitmask_invariants(void)
{
    printf("--- 13. Bitmask invariants ---\n");

    ASSERT_EQ(TB3D_PHYSICAL_LANE_MASK, 0x55U, "physical lane mask = 0x55");
    ASSERT_EQ(TB3D_COLOR_LANE_MASK,    0xAAU, "color lane mask = 0xAA");
    ASSERT_EQ((uint8_t)(TB3D_PHYSICAL_LANE_MASK | TB3D_COLOR_LANE_MASK),
              0xFFU, "masks are complementary (OR = 0xFF)");
    ASSERT_EQ((uint8_t)(TB3D_PHYSICAL_LANE_MASK & TB3D_COLOR_LANE_MASK),
              0x00U, "masks are exclusive (AND = 0x00)");

    /* For every possible packed byte, verify lane separation */
    for (unsigned packed = 0; packed < 256; packed++) {
        uint8_t p = (uint8_t)packed & TB3D_PHYSICAL_LANE_MASK;
        uint8_t c = (uint8_t)packed & TB3D_COLOR_LANE_MASK;
        ASSERT_EQ((uint8_t)(p | c), (uint8_t)packed, "p|c = packed");
        ASSERT_EQ((uint8_t)(p & c), 0x00U, "p&c = 0 for any packed byte");
    }
}

/* =========================================================================
 * 14. CPU feature flags
 * ========================================================================= */
static void test_cpu_features(void)
{
    printf("--- 14. CPU feature detection ---\n");
    printf("    BMI2:   %s\n", tb3d_has_bmi2()   ? "yes" : "no");
    printf("    AVX2:   %s\n", tb3d_has_avx2()   ? "yes" : "no");
    printf("    AVX-512:%s\n", tb3d_has_avx512() ? "yes" : "no");
    /* No assertion — presence depends on build flags / hardware */
    g_tests_run++;
    g_tests_passed++;
}

/* =========================================================================
 * Main
 * ========================================================================= */
int main(void)
{
    printf("========================================\n");
    printf("  DyaSmart TB3-D Logic Engine — Tests   \n");
    printf("========================================\n\n");

    test_nibble_roundtrip();
    test_bit_layout();
    test_byte_roundtrip();
    test_decode_byte_simple();
    test_color_state();
    test_buffer_roundtrip();
    test_split_buffer();
    test_dma_fetch();
    test_dragonfly_cache();
    test_state_buffer();
    test_transcoder();
    test_lossless_guarantee();
    test_bitmask_invariants();
    test_cpu_features();

    printf("\n========================================\n");
    printf("  Results: %d/%d passed", g_tests_passed, g_tests_run);
    if (g_tests_failed > 0) {
        printf(", %d FAILED", g_tests_failed);
    }
    printf("\n========================================\n");

    return (g_tests_failed == 0) ? 0 : 1;
}
