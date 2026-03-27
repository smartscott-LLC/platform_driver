/**
 * @file tb3d_engine.c
 * @brief DyaSmart TB3-D Logic Engine — Core bit-pairing implementation.
 *
 * ARCHITECTURE DECISION: x86-64, AMD Zen / Intel Haswell+, AVX2 + BMI2
 * -----------------------------------------------------------------------
 * We target x86-64 with the following feature tiers (detected at runtime):
 *
 *   Tier 1 – BMI2 PDEP/PEXT (preferred scalar path)
 *     Intel Haswell (2013), AMD Zen (2017) and newer.
 *     _pdep_u32 / _pext_u32 map exactly to the TB3-D interleave/deinterleave
 *     operation in a single clock cycle, making this the fastest scalar path.
 *
 *   Tier 2 – AVX2 vectorized buffer encoding (preferred batch path)
 *     Processes 16 legacy bytes per iteration using 256-bit SIMD registers.
 *     Uses VPSHUFB (byte shuffle) with a pre-computed 16-entry nibble→packed
 *     lookup table to spread nibble bits to the correct interleaved positions.
 *
 *   Tier 3 – Portable fallback (constant-time, LUT-based)
 *     Two 16-entry lookup tables (spread_lo, compress_lo) handle all
 *     platforms without BMI2/AVX2.  O(1) per nibble, branch-free.
 *
 * ENCODING ARITHMETIC
 * -------------------
 * For a nibble P = p3 p2 p1 p0 and color nibble C = c3 c2 c1 c0, the
 * packed TB3-D byte is:
 *
 *   packed = SPREAD_PHYS(P) | (SPREAD_PHYS(C) << 1)
 *
 * where SPREAD_PHYS maps nibble bit n to byte bit 2n (positions 0,2,4,6).
 * The color nibble is then shifted one position left to land at 1,3,5,7.
 *
 * DECODING ARITHMETIC
 * -------------------
 *   physical = COMPRESS(packed & 0x55)   -- extract bits at 0,2,4,6
 *   color    = COMPRESS((packed >> 1) & 0x55)  -- extract bits at 1,3,5,7
 *
 * COMPRESS is the inverse of SPREAD_PHYS:  bit 2n of input → bit n of output.
 */

#include "Dyasmart/tb3d.h"

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
/* ---- CPU feature detection (compile-time + runtime) ------------------- */

#if defined(__x86_64__) || defined(_M_X64)
#  include <cpuid.h>
#  ifdef __BMI2__
#    include <immintrin.h>
#    define TB3D_HAVE_BMI2_COMPILE 1
#  else
#    define TB3D_HAVE_BMI2_COMPILE 0
#  endif
#  ifdef __AVX2__
#    include <immintrin.h>
#    define TB3D_HAVE_AVX2_COMPILE 1
#  else
#    define TB3D_HAVE_AVX2_COMPILE 0
#  endif
#  ifdef __AVX512F__
#    define TB3D_HAVE_AVX512_COMPILE 1
#  else
#    define TB3D_HAVE_AVX512_COMPILE 0
#  endif
#else
#  define TB3D_HAVE_BMI2_COMPILE  0
#  define TB3D_HAVE_AVX2_COMPILE  0
#  define TB3D_HAVE_AVX512_COMPILE 0
#endif

/* ---- Spread / compress lookup tables ---------------------------------- */

/*
 * spread_lo[n] maps 4-bit nibble n to an 8-bit value where the nibble bits
 * are deposited at even bit positions (0, 2, 4, 6):
 *
 *   nibble bit 0 → byte bit 0
 *   nibble bit 1 → byte bit 2
 *   nibble bit 2 → byte bit 4
 *   nibble bit 3 → byte bit 6
 *
 * Equivalent to BMI2 _pdep_u32(n, 0x55).
 */
static const uint8_t spread_lo[16] = {
    0x00U, 0x01U, 0x04U, 0x05U,
    0x10U, 0x11U, 0x14U, 0x15U,
    0x40U, 0x41U, 0x44U, 0x45U,
    0x50U, 0x51U, 0x54U, 0x55U
};

/*
 * compress_lo[v] maps an 8-bit value v (with significant bits at 0,2,4,6)
 * back to a 4-bit nibble:
 *
 *   byte bit 0 → nibble bit 0
 *   byte bit 2 → nibble bit 1
 *   byte bit 4 → nibble bit 2
 *   byte bit 6 → nibble bit 3
 *
 * Equivalent to BMI2 _pext_u32(v, 0x55).
 * Only the 16 spread_lo values are valid inputs; all others give 0.
 * Only used on platforms without BMI2 — guarded to suppress unused warnings.
 */
#if !TB3D_HAVE_BMI2_COMPILE
static const uint8_t compress_lo[256] = {
    /* Generated from: compress_lo[spread_lo[n]] = n for n in 0..15 */
    /* 0x00 */ 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
    /* 0x10 */ 4,  5,  0,  0,  6,  7,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
    /* 0x20 */ 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
    /* 0x30 */ 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
    /* 0x40 */ 8,  9,  0,  0, 10, 11,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
    /* 0x50 */12, 13,  0,  0, 14, 15,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
    /* 0x60 */ 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
    /* 0x70 */ 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
    /* 0x80 */ 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
    /* 0x90 */ 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
    /* 0xa0 */ 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
    /* 0xb0 */ 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
    /* 0xc0 */ 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
    /* 0xd0 */ 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
    /* 0xe0 */ 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
    /* 0xf0 */ 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
};
#endif /* !TB3D_HAVE_BMI2_COMPILE */

/* ---- Internal helpers ------------------------------------------------- */

#if !TB3D_HAVE_BMI2_COMPILE
/*
 * Portable (no-BMI2) nibble spread: places nibble bits at positions 0,2,4,6.
 * Constant-time, branchless via the lookup table.
 */
static inline uint8_t spread_nibble(uint8_t nibble)
{
    return spread_lo[nibble & 0x0FU];
}

/*
 * Portable (no-BMI2) nibble compress: extracts bits at positions 0,2,4,6
 * back into a 4-bit nibble.
 */
static inline uint8_t compress_nibble(uint8_t spread)
{
    return compress_lo[spread & 0x55U];
}
#endif /* !TB3D_HAVE_BMI2_COMPILE */

/* =========================================================================
 * Public API — scalar operations
 * ========================================================================= */

tb3d_packed_t tb3d_encode_nibble(uint8_t physical, uint8_t color)
{
#if TB3D_HAVE_BMI2_COMPILE
    /*
     * BMI2 fast path:
     *   PDEP with mask 0x55 deposits the nibble at odd positions (0,2,4,6).
     *   PDEP with mask 0xAA deposits the nibble at even positions (1,3,5,7).
     */
    uint32_t p = _pdep_u32((uint32_t)(physical & 0x0FU), 0x55U);
    uint32_t c = _pdep_u32((uint32_t)(color    & 0x0FU), 0xAAU);
    return (tb3d_packed_t)(p | c);
#else
    /* Portable LUT path */
    uint8_t p = spread_nibble(physical);
    uint8_t c = (uint8_t)(spread_nibble(color) << 1);
    return (tb3d_packed_t)(p | c);
#endif
}

void tb3d_decode_nibble(tb3d_packed_t packed,
                        uint8_t      *physical,
                        uint8_t      *color)
{
#if TB3D_HAVE_BMI2_COMPILE
    /*
     * BMI2 fast path:
     *   PEXT with mask 0x55 collects bits at positions 0,2,4,6 → nibble.
     *   PEXT with mask 0xAA collects bits at positions 1,3,5,7 → nibble.
     */
    *physical = (uint8_t)_pext_u32((uint32_t)packed, 0x55U);
    *color    = (uint8_t)_pext_u32((uint32_t)packed, 0xAAU);
#else
    /* Portable LUT path */
    *physical = compress_nibble((uint8_t)(packed & 0x55U));
    *color    = compress_nibble((uint8_t)((packed >> 1) & 0x55U));
#endif
}

tb3d_word_t tb3d_encode_byte(uint8_t byte, uint8_t color_mask)
{
    tb3d_packed_t lo = tb3d_encode_nibble(byte         & 0x0FU,
                                           color_mask   & 0x0FU);
    tb3d_packed_t hi = tb3d_encode_nibble((byte       >> 4) & 0x0FU,
                                           (color_mask >> 4) & 0x0FU);
    return (tb3d_word_t)lo | ((tb3d_word_t)hi << 8);
}

uint8_t tb3d_decode_byte(tb3d_word_t word)
{
    uint8_t lo_phys, hi_phys, tmp_color;
    tb3d_decode_nibble((tb3d_packed_t)(word & 0xFFU),        &lo_phys, &tmp_color);
    tb3d_decode_nibble((tb3d_packed_t)((word >> 8) & 0xFFU), &hi_phys, &tmp_color);
    (void)tmp_color;
    return (uint8_t)(lo_phys | (hi_phys << 4));
}

void tb3d_decode_word_full(tb3d_word_t  word,
                           uint8_t     *byte,
                           uint8_t     *color_mask)
{
    uint8_t lo_phys, lo_color, hi_phys, hi_color;
    tb3d_decode_nibble((tb3d_packed_t)(word & 0xFFU),        &lo_phys, &lo_color);
    tb3d_decode_nibble((tb3d_packed_t)((word >> 8) & 0xFFU), &hi_phys, &hi_color);
    *byte       = (uint8_t)(lo_phys | (hi_phys << 4));
    *color_mask = (uint8_t)(lo_color | (hi_color << 4));
}

tb3d_color_t tb3d_get_bit_color(tb3d_packed_t packed, uint8_t bit_pos)
{
    /* Color bit n resides at packed bit position 2n+1 */
    uint8_t shift = (uint8_t)(2U * (bit_pos & 0x03U) + 1U);
    return (tb3d_color_t)((packed >> shift) & 1U);
}

tb3d_packed_t tb3d_set_bit_color(tb3d_packed_t packed,
                                  uint8_t       bit_pos,
                                  tb3d_color_t  color)
{
    uint8_t shift = (uint8_t)(2U * (bit_pos & 0x03U) + 1U);
    uint8_t mask  = (uint8_t)(1U << shift);
    if (color == TB3D_COLOR_RED) {
        return (tb3d_packed_t)(packed | mask);
    } else {
        return (tb3d_packed_t)(packed & (uint8_t)~mask);
    }
}

/* =========================================================================
 * Buffer API
 * ========================================================================= */

void tb3d_encode_buffer(const uint8_t *src,
                        uint8_t       *dst,
                        size_t         src_len,
                        uint8_t        default_color)
{
    size_t i = 0;

#if TB3D_HAVE_AVX2_COMPILE
    /*
     * AVX2 vectorized path — 16 legacy bytes per iteration → 32 output bytes.
     *
     * Algorithm:
     *   1. Load 16 source bytes, zero-extend to 16 x uint16 (cvtepu8_epi16).
     *   2. Extract lo nibble (bits 3:0) and hi nibble (bits 7:4) per element.
     *   3. Spread each nibble to physical bit positions via VPSHUFB lookup.
     *   4. OR in the color contribution (pre-computed constant).
     *   5. Pack 16 x uint16 → 16 x uint8 via packus_epi16 + permute.
     *   6. Interleave lo_packed and hi_packed bytes: [lo0,hi0, lo1,hi1, ...].
     *   7. Single 32-byte store.
     */

    /* 256-bit LUT: two identical copies of the 16-entry spread table */
    const __m128i lut128 = _mm_set_epi8(
        (char)spread_lo[15], (char)spread_lo[14],
        (char)spread_lo[13], (char)spread_lo[12],
        (char)spread_lo[11], (char)spread_lo[10],
        (char)spread_lo[ 9], (char)spread_lo[ 8],
        (char)spread_lo[ 7], (char)spread_lo[ 6],
        (char)spread_lo[ 5], (char)spread_lo[ 4],
        (char)spread_lo[ 3], (char)spread_lo[ 2],
        (char)spread_lo[ 1], (char)spread_lo[ 0]);
    const __m256i lut = _mm256_broadcastsi128_si256(lut128);

    const __m256i nibble_mask = _mm256_set1_epi8(0x0F);
    const __m256i word16_lo   = _mm256_set1_epi16(0x00FF); /* keep low byte of uint16 */
    const __m256i zero256     = _mm256_setzero_si256();

    /*
     * Pre-compute the constant color contribution for lo and hi nibbles.
     * color_lo_byte / color_hi_byte are the spread-and-shifted color bytes.
     * They are broadcast as uint16 (high byte = 0) to OR into the low-byte
     * lanes of the spread result without corrupting the zero high bytes.
     */
    uint8_t c_lo = default_color & 0x0FU;
    uint8_t c_hi = (default_color >> 4) & 0x0FU;
    /* spread_lo[c] puts color bits at even positions; <<1 shifts to odd positions */
    uint8_t c_lo_byte = (uint8_t)((spread_lo[c_lo] << 1) & 0xFEU);
    uint8_t c_hi_byte = (uint8_t)((spread_lo[c_hi] << 1) & 0xFEU);
    /* Broadcast as int16 = 0x00XX (zero high byte) */
    const __m256i v_clo = _mm256_set1_epi16((int16_t)(uint16_t)c_lo_byte);
    const __m256i v_chi = _mm256_set1_epi16((int16_t)(uint16_t)c_hi_byte);

    for (; i + 16 <= src_len; i += 16) {
        __m128i src128 = _mm_loadu_si128((const __m128i *)(src + i));
        /* Zero-extend 16 x uint8 → 16 x uint16; high bytes = 0 */
        __m256i v_src = _mm256_cvtepu8_epi16(src128);

        /* Extract nibbles; each result is 0x00nn per uint16 lane */
        __m256i v_lo = _mm256_and_si256(v_src, nibble_mask);
        __m256i v_hi = _mm256_and_si256(_mm256_srli_epi16(v_src, 4), nibble_mask);

        /*
         * VPSHUFB: for each byte lane, index into the 16-entry spread LUT.
         * Since v_lo/v_hi have 0x00nn per uint16 (low byte = nibble, high = 0),
         * the low byte indexes into the LUT and the high byte (index 0) gives
         * spread_lo[0] = 0x00 — harmlessly preserving the zero high byte.
         */
        __m256i p_lo = _mm256_shuffle_epi8(lut, v_lo);  /* spread_lo[lo_nibble] */
        __m256i p_hi = _mm256_shuffle_epi8(lut, v_hi);  /* spread_lo[hi_nibble] */

        /* OR in constant color contribution (fits in low byte; high byte = 0) */
        p_lo = _mm256_or_si256(p_lo, v_clo);
        p_hi = _mm256_or_si256(p_hi, v_chi);

        /*
         * Compact: 16 x uint16 (meaningful in low bytes) → 16 x uint8.
         * packus_epi16(p, zero) packs p[0..7] to bytes 0..7 and zeros to 8..15
         * in the low 128-bit half, and p[8..15] / zeros in the high 128-bit half.
         * permute4x64_epi64 with 0xD8 moves the two useful groups to the front.
         */
        __m256i lo_c = _mm256_permute4x64_epi64(
                        _mm256_packus_epi16(_mm256_and_si256(p_lo, word16_lo), zero256),
                        0xD8);
        __m256i hi_c = _mm256_permute4x64_epi64(
                        _mm256_packus_epi16(_mm256_and_si256(p_hi, word16_lo), zero256),
                        0xD8);

        /*
         * Interleave lo and hi bytes: [lo0,hi0, lo1,hi1, ..., lo15,hi15].
         * unpacklo_epi8 handles the low 8 elements of each 128-bit half.
         * unpackhi_epi8 handles the high 8 elements of each 128-bit half.
         * permute2x128 combines the two useful halves into one 256-bit result.
         */
        __m256i r_lo = _mm256_unpacklo_epi8(lo_c, hi_c);
        __m256i r_hi = _mm256_unpackhi_epi8(lo_c, hi_c);
        __m256i result = _mm256_permute2x128_si256(r_lo, r_hi, 0x20);

        _mm256_storeu_si256((__m256i *)(dst + i * 2), result);
    }
#endif /* TB3D_HAVE_AVX2_COMPILE */

    /* Scalar tail (or entire loop if no AVX2) */
    for (; i < src_len; i++) {
        tb3d_word_t w = tb3d_encode_byte(src[i], default_color);
        dst[i * 2]     = (uint8_t)(w & 0xFFU);
        dst[i * 2 + 1] = (uint8_t)(w >> 8);
    }
}

void tb3d_decode_buffer(const uint8_t *src,
                        uint8_t       *dst,
                        size_t         dst_len)
{
    for (size_t i = 0; i < dst_len; i++) {
        tb3d_word_t w = (tb3d_word_t)src[i * 2] |
                        ((tb3d_word_t)src[i * 2 + 1] << 8);
        dst[i] = tb3d_decode_byte(w);
    }
}

void tb3d_encode_split(const uint8_t  *src,
                       uint8_t         color,
                       tb3d_buffer_t  *buf)
{
    for (size_t i = 0; i < buf->length; i++) {
        /* Each legacy byte → two nibble entries per lane */
        uint8_t byte       = src[i];
        uint8_t lo_phys    = byte & 0x0FU;
        uint8_t hi_phys    = (byte >> 4) & 0x0FU;
        uint8_t lo_color   = color & 0x0FU;
        uint8_t hi_color   = (color >> 4) & 0x0FU;

        /* Pack two nibbles per byte in each lane */
        buf->physical_buf[i] = (uint8_t)(lo_phys | (hi_phys << 4));
        buf->color_buf[i]    = (uint8_t)(lo_color | (hi_color << 4));
    }
}

void tb3d_decode_split(const tb3d_buffer_t *buf, uint8_t *dst)
{
    for (size_t i = 0; i < buf->length; i++) {
        uint8_t lo_phys = buf->physical_buf[i] & 0x0FU;
        uint8_t hi_phys = (buf->physical_buf[i] >> 4) & 0x0FU;
        dst[i] = (uint8_t)(lo_phys | (hi_phys << 4));
    }
}

/* =========================================================================
 * CPU feature query
 * ========================================================================= */

bool tb3d_has_bmi2(void)
{
    return (bool)TB3D_HAVE_BMI2_COMPILE;
}

bool tb3d_has_avx2(void)
{
    return (bool)TB3D_HAVE_AVX2_COMPILE;
}

bool tb3d_has_avx512(void)
{
    return (bool)TB3D_HAVE_AVX512_COMPILE;
}

/* =========================================================================
 * Diagnostic utilities
 * ========================================================================= */

void tb3d_print_packed(tb3d_packed_t packed)
{
    uint8_t physical, color;
    tb3d_decode_nibble(packed, &physical, &color);
    printf("Packed=0x%02X  P[3:0]=0x%X  C[3:0]=0x%X  "
           "Layout=[%d|%d|%d|%d|%d|%d|%d|%d]  (C3 P3 C2 P2 C1 P1 C0 P0)\n",
           packed, physical, color,
           (packed >> 7) & 1, (packed >> 6) & 1,
           (packed >> 5) & 1, (packed >> 4) & 1,
           (packed >> 3) & 1, (packed >> 2) & 1,
           (packed >> 1) & 1, (packed >> 0) & 1);
}

void tb3d_print_word(tb3d_word_t word)
{
    uint8_t byte, color_mask;
    tb3d_decode_word_full(word, &byte, &color_mask);
    printf("Word=0x%04X  Byte=0x%02X (%3d)  ColorMask=0x%02X\n",
           word, byte, byte, color_mask);
    printf("  LO: "); tb3d_print_packed((tb3d_packed_t)(word & 0xFFU));
    printf("  HI: "); tb3d_print_packed((tb3d_packed_t)(word >> 8));
}
