/**
 * @file tb3d_driver.c
 * @brief DyaSmart TB3-D Driver Pipeline Implementation
 *
 * Implements the three hardware-integration subsystems:
 *
 *  1. Dragonfly Cache Interface — cache-line-aligned two-lane DMA buffers
 *     with prefetcht0 hints for simultaneous L1 cache population.
 *
 *  2. SIMD Bitmask DMA Layer — vectorized separation of the Physical (0x55)
 *     and Color (0xAA) sub-planes from a packed TB3-D buffer.
 *
 *  3. State Buffer — in-memory model of the L2 color look-ahead lane,
 *     providing O(1) per-bit color queries.
 *
 *  4. Transcoder — "Secretary" (write) and "Executive" (read) paths that
 *     convert between legacy binary and TB3-D Dragonfly Cache format.
 *
 * PREFETCH STRATEGY
 * -----------------
 * __builtin_prefetch(addr, rw, locality) maps to:
 *   prefetcht0 (locality=3, L1 cache) for hot data.
 *   prefetcht1 (locality=2, L2 cache) for warm data.
 * We issue prefetcht0 (locality=3) for both lanes when initiating a read
 * or write, so the CPU can begin filling the L1 cache lines before the
 * actual load/store instructions execute.
 */

#include "Dyasmart/tb3d_driver.h"
#include "Dyasmart/tb3d.h"

#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#if defined(__x86_64__) || defined(_M_X64)
#  ifdef __AVX2__
#    include <immintrin.h>
#    define TB3D_DRIVER_AVX2 1
#  else
#    define TB3D_DRIVER_AVX2 0
#  endif
#else
#  define TB3D_DRIVER_AVX2 0
#endif

/* ---- Cache-line-aligned allocation ------------------------------------ */

static void *aligned_alloc_cache(size_t size)
{
    /* Round up to a multiple of the cache-line size (required by aligned_alloc) */
    size_t aligned = (size + TB3D_CACHE_LINE_BYTES - 1U)
                     & ~((size_t)(TB3D_CACHE_LINE_BYTES - 1U));
    /*
     * aligned_alloc is standard C11 (§7.22.3.1).  The returned pointer is
     * suitable for free().  Requires size to be a multiple of alignment,
     * which is guaranteed by the rounding above.
     */
    return aligned_alloc(TB3D_CACHE_LINE_BYTES, aligned);
}

/* =========================================================================
 * Dragonfly Cache Interface
 * ========================================================================= */

int tb3d_dragonfly_cache_init(tb3d_dragonfly_cache_t *cache, size_t capacity)
{
    if (!cache || capacity == 0) return -1;

    /* Round up to cache-line boundary */
    size_t aligned = (capacity + TB3D_CACHE_LINE_BYTES - 1U)
                     & ~(TB3D_CACHE_LINE_BYTES - 1U);

    cache->physical_lane = (uint8_t *)aligned_alloc_cache(aligned);
    cache->color_lane    = (uint8_t *)aligned_alloc_cache(aligned);

    if (!cache->physical_lane || !cache->color_lane) {
        free(cache->physical_lane);
        free(cache->color_lane);
        cache->physical_lane = NULL;
        cache->color_lane    = NULL;
        return -1;
    }

    memset(cache->physical_lane, 0, aligned);
    memset(cache->color_lane,    0, aligned);

    cache->capacity = aligned;
    cache->used     = 0;
    return 0;
}

void tb3d_dragonfly_cache_destroy(tb3d_dragonfly_cache_t *cache)
{
    if (!cache) return;
    free(cache->physical_lane);
    free(cache->color_lane);
    cache->physical_lane = NULL;
    cache->color_lane    = NULL;
    cache->capacity = 0;
    cache->used     = 0;
}

int tb3d_dragonfly_cache_write(tb3d_dragonfly_cache_t *cache,
                                const uint8_t          *src,
                                size_t                  len,
                                size_t                  offset,
                                uint8_t                 color)
{
    if (!cache || !src || offset + len > cache->capacity) return -1;

    /* Issue prefetcht0 hints for destination cache lines */
    for (size_t cl = 0; cl < len; cl += TB3D_CACHE_LINE_BYTES) {
        __builtin_prefetch(cache->physical_lane + offset + cl, 1, 3);
        __builtin_prefetch(cache->color_lane    + offset + cl, 1, 3);
    }

    for (size_t i = 0; i < len; i++) {
        /* Physical nibble pair: pack lo and hi nibble of the source byte */
        cache->physical_lane[offset + i] = src[i];  /* packed nibbles */
        /* Color nibble pair: replicate the color nibble for both halves */
        uint8_t c_lo = color & 0x0FU;
        uint8_t c_hi = (color >> 4) & 0x0FU;
        cache->color_lane[offset + i] = (uint8_t)(c_lo | (c_hi << 4));
    }

    if (offset + len > cache->used) {
        cache->used = offset + len;
    }
    return (int)len;
}

int tb3d_dragonfly_cache_read(const tb3d_dragonfly_cache_t *cache,
                               uint8_t                      *dst,
                               size_t                        len,
                               size_t                        offset)
{
    if (!cache || !dst || offset + len > cache->used) return -1;

    /* Issue prefetcht0 hints for source cache lines */
    for (size_t cl = 0; cl < len; cl += TB3D_CACHE_LINE_BYTES) {
        __builtin_prefetch(cache->physical_lane + offset + cl, 0, 3);
        __builtin_prefetch(cache->color_lane    + offset + cl, 0, 3);
    }

    memcpy(dst, cache->physical_lane + offset, len);
    return (int)len;
}

/* =========================================================================
 * SIMD Bitmask DMA Layer
 * ========================================================================= */

int tb3d_dma_fetch(tb3d_dma_descriptor_t *desc)
{
    if (!desc || !desc->src || !desc->phys_out || !desc->color_out) return -1;
    if (desc->src_len == 0 || desc->out_len < desc->src_len)        return -1;

    const uint8_t *src      = desc->src;
    uint8_t       *phys     = desc->phys_out;
    uint8_t       *col      = desc->color_out;
    size_t         n        = desc->src_len;
    size_t         i        = 0;

    /* Prefetch first burst of source data */
    __builtin_prefetch(src, 0, 3);

#if TB3D_DRIVER_AVX2
    /*
     * AVX2 vectorized path:
     * Process 32 packed TB3-D bytes per iteration.
     * Apply Physical Lane mask (0x55) and Color Lane mask (0xAA) in parallel.
     */
    const __m256i phys_mask  = _mm256_set1_epi8((char)TB3D_PHYSICAL_LANE_MASK);
    const __m256i color_mask = _mm256_set1_epi8((char)TB3D_COLOR_LANE_MASK);

    for (; i + 32 <= n; i += 32) {
        /* Prefetch next cache line */
        __builtin_prefetch(src + i + 64, 0, 3);

        __m256i v = _mm256_loadu_si256((const __m256i *)(src + i));

        /* Physical sub-plane: mask 0x55 */
        __m256i v_phys  = _mm256_and_si256(v, phys_mask);
        /* Color sub-plane: mask 0xAA, then shift right to normalize */
        __m256i v_color = _mm256_srli_epi16(_mm256_and_si256(v, color_mask), 1);

        _mm256_storeu_si256((__m256i *)(phys + i),  v_phys);
        _mm256_storeu_si256((__m256i *)(col  + i),  v_color);
    }
#endif /* TB3D_DRIVER_AVX2 */

    /* Scalar tail */
    for (; i < n; i++) {
        phys[i] = (uint8_t)(src[i] & TB3D_PHYSICAL_LANE_MASK);
        col[i]  = (uint8_t)((src[i] & TB3D_COLOR_LANE_MASK) >> 1);
    }

    return (int)n;
}

/* =========================================================================
 * State Buffer
 * ========================================================================= */

int tb3d_state_buffer_init(tb3d_state_buffer_t *sb, size_t capacity)
{
    if (!sb || capacity == 0) return -1;

    /* Two nibbles (8 color bits) per legacy byte, packed as one byte */
    sb->color_nibbles = (uint8_t *)calloc(capacity, 1);
    if (!sb->color_nibbles) return -1;

    sb->capacity = capacity;
    return 0;
}

void tb3d_state_buffer_destroy(tb3d_state_buffer_t *sb)
{
    if (!sb) return;
    free(sb->color_nibbles);
    sb->color_nibbles = NULL;
    sb->capacity = 0;
}

int tb3d_state_buffer_load(tb3d_state_buffer_t *sb,
                            const uint8_t       *src,
                            size_t               len)
{
    if (!sb || !src) return -1;
    /*
     * Each TB3-D packed byte contains 4 color bits (at odd positions).
     * Two consecutive packed bytes represent one legacy byte.
     * We load len/2 legacy bytes worth of color data.
     */
    size_t n_legacy = len / 2;
    if (n_legacy > sb->capacity) n_legacy = sb->capacity;

    for (size_t i = 0; i < n_legacy; i++) {
        uint8_t lo_p, lo_c, hi_p, hi_c;
        tb3d_decode_nibble(src[i * 2],     &lo_p, &lo_c);
        tb3d_decode_nibble(src[i * 2 + 1], &hi_p, &hi_c);
        sb->color_nibbles[i] = (uint8_t)(lo_c | (hi_c << 4));
        (void)lo_p; (void)hi_p;
    }
    return 0;
}

int tb3d_state_buffer_query(const tb3d_state_buffer_t *sb,
                             size_t                    byte_idx,
                             uint8_t                   bit_pos)
{
    if (!sb || byte_idx >= sb->capacity || bit_pos > 7) return -1;

    uint8_t color_byte = sb->color_nibbles[byte_idx];
    return (int)((color_byte >> bit_pos) & 1U);
}

int tb3d_state_buffer_set(tb3d_state_buffer_t *sb,
                           size_t               byte_idx,
                           uint8_t              bit_pos,
                           tb3d_color_t         color)
{
    if (!sb || byte_idx >= sb->capacity || bit_pos > 7) return -1;

    uint8_t mask = (uint8_t)(1U << bit_pos);
    if (color == TB3D_COLOR_RED) {
        sb->color_nibbles[byte_idx] |= mask;
    } else {
        sb->color_nibbles[byte_idx] &= (uint8_t)~mask;
    }
    return 0;
}

/* =========================================================================
 * Transcoder
 * ========================================================================= */

int tb3d_transcode_to_cache(const uint8_t          *legacy_src,
                              size_t                  src_len,
                              tb3d_dragonfly_cache_t *cache,
                              uint8_t                 color_mask)
{
    if (!legacy_src || !cache || src_len == 0) return -1;
    if (src_len > cache->capacity) return -1;

    /*
     * "Secretary" path:
     *   Snap 8-bit binary to TB3-D format before it hits the memory controller.
     *   Physical nibbles go to the physical lane.
     *   Color nibbles go to the color lane.
     */
    for (size_t cl = 0; cl < src_len; cl += TB3D_CACHE_LINE_BYTES) {
        __builtin_prefetch(legacy_src + cl, 0, 3);
        __builtin_prefetch(cache->physical_lane + cl, 1, 3);
        __builtin_prefetch(cache->color_lane    + cl, 1, 3);
    }

    for (size_t i = 0; i < src_len; i++) {
        cache->physical_lane[i] = legacy_src[i];
        uint8_t c_lo = color_mask & 0x0FU;
        uint8_t c_hi = (color_mask >> 4) & 0x0FU;
        cache->color_lane[i] = (uint8_t)(c_lo | (c_hi << 4));
    }

    cache->used = src_len;
    return 0;
}

int tb3d_transcode_from_cache(const tb3d_dragonfly_cache_t *cache,
                                uint8_t                      *legacy_dst)
{
    if (!cache || !legacy_dst || cache->used == 0) return -1;

    /*
     * "Executive" path:
     *   Pull pre-resolved TB3-D data from the cache and reconstruct binary.
     */
    for (size_t cl = 0; cl < cache->used; cl += TB3D_CACHE_LINE_BYTES) {
        __builtin_prefetch(cache->physical_lane + cl, 0, 3);
    }

    memcpy(legacy_dst, cache->physical_lane, cache->used);
    return 0;
}
