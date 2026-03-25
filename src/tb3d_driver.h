/**
 * @file tb3d_driver.h
 * @brief DyaSmart TB3-D Driver Pipeline — Hardware Integration Layer
 *
 * This header exposes the three hardware-integration subsystems of the
 * TB3-D Logic Engine:
 *
 *  1. Dragonfly Cache Interface
 *     Manages cache-friendly DMA fetches using prefetcht0.  Data is stored
 *     in packed_nibble format so the 4-bit physical stream and 4-bit color
 *     mask are cache-line-aligned and fetched simultaneously.
 *
 *  2. SIMD Bitmask DMA Layer
 *     Applies the Physical Lane (0x55) and Color/State Lane (0xAA) bitmasks
 *     as a parallel read during memory fetch, allowing a single-cycle
 *     logical separation of the two sub-planes.
 *
 *  3. State Buffer
 *     A software model of the dedicated 4-bit-per-byte metadata lane
 *     described in the TB3-D specification.  Enables high-speed color
 *     look-ahead without touching the physical data lane.
 *
 * HARDWARE COUNTERPARTS (software models)
 * -----------------------------------------
 *   tb3d_transcoder_*  ↔  The Transcoder (mux/demux, legacy ↔ TB3-D RAM)
 *   tb3d_dma_fetch     ↔  The Vector Resolver (single-cycle interleave)
 *   tb3d_state_buffer  ↔  The State Buffer (L2 color look-ahead lane)
 */
#ifndef DYASMART_TB3D_DRIVER_H
#define DYASMART_TB3D_DRIVER_H

#include "tb3d.h"
#include <stddef.h>
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

/* =========================================================================
 * Cache line and alignment constants
 * ========================================================================= */

/** L1 cache-line size in bytes (64 B on all modern x86-64 CPUs). */
#define TB3D_CACHE_LINE_BYTES   64U

/** Required alignment for Dragonfly Cache Interface buffers. */
#define TB3D_BUFFER_ALIGNMENT   TB3D_CACHE_LINE_BYTES

/** DMA burst size: number of TB3-D words per prefetch burst. */
#define TB3D_DMA_BURST_WORDS    32U

/* =========================================================================
 * Dragonfly Cache Interface
 * ========================================================================= */

/**
 * @brief Dragonfly Cache descriptor.
 *
 * Holds two cache-line-aligned buffers that mirror the two logical sub-planes
 * of TB3-D memory.  During a DMA fetch cycle both lanes are prefetched into
 * L1 simultaneously via @c prefetcht0, giving a single-cycle parallel read.
 */
typedef struct {
    uint8_t *physical_lane; /**< Cache-aligned physical nibble buffer (0x55) */
    uint8_t *color_lane;    /**< Cache-aligned color/state nibble buffer (0xAA) */
    size_t   capacity;      /**< Buffer capacity in bytes per lane              */
    size_t   used;          /**< Bytes currently occupied per lane              */
} tb3d_dragonfly_cache_t;

/**
 * @brief Initialize a Dragonfly Cache descriptor.
 *
 * Allocates two cache-line-aligned buffers of @c capacity bytes each.
 * Both buffers are zero-initialized (all-GREEN state).
 *
 * @param cache     Descriptor to initialize.
 * @param capacity  Per-lane capacity in bytes (rounded up to cache-line size).
 * @return          0 on success, -1 on allocation failure.
 */
int tb3d_dragonfly_cache_init(tb3d_dragonfly_cache_t *cache, size_t capacity);

/**
 * @brief Release resources held by a Dragonfly Cache descriptor.
 *
 * @param cache  Descriptor to destroy.
 */
void tb3d_dragonfly_cache_destroy(tb3d_dragonfly_cache_t *cache);

/**
 * @brief Write legacy bytes into the Dragonfly Cache.
 *
 * The source bytes are encoded into TB3-D packed nibbles and written into
 * both lanes of @c cache, starting at @c offset.  A prefetcht0 hint is
 * issued for the destination cache lines before writing.
 *
 * @param cache   Target Dragonfly Cache descriptor.
 * @param src     Source legacy bytes.
 * @param len     Number of bytes to write.
 * @param offset  Byte offset within the cache lanes.
 * @param color   Default color mask (0x00 = GREEN, 0xFF = RED).
 * @return        Number of bytes written, or -1 on bounds error.
 */
int tb3d_dragonfly_cache_write(tb3d_dragonfly_cache_t *cache,
                                const uint8_t          *src,
                                size_t                  len,
                                size_t                  offset,
                                uint8_t                 color);

/**
 * @brief Read legacy bytes from the Dragonfly Cache.
 *
 * Reconstructs legacy bytes from the two cached lanes.  A prefetcht0 hint
 * is issued for the source cache lines before reading.
 *
 * @param cache   Source Dragonfly Cache descriptor.
 * @param dst     Destination buffer.
 * @param len     Number of bytes to read.
 * @param offset  Byte offset within the cache lanes.
 * @return        Number of bytes read, or -1 on bounds error.
 */
int tb3d_dragonfly_cache_read(const tb3d_dragonfly_cache_t *cache,
                               uint8_t                      *dst,
                               size_t                        len,
                               size_t                        offset);

/* =========================================================================
 * SIMD Bitmask DMA Layer
 * ========================================================================= */

/**
 * @brief DMA fetch descriptor for the SIMD bitmask layer.
 *
 * The memory controller treats the physical sub-plane (mask 0x55) and the
 * color sub-plane (mask 0xAA) as independent streams, enabling a
 * single-cycle parallel read.
 */
typedef struct {
    const uint8_t *src;        /**< Source TB3-D packed buffer                   */
    size_t         src_len;    /**< Source buffer length in bytes                 */
    uint8_t       *phys_out;   /**< Output: physical lane bytes (mask 0x55 applied) */
    uint8_t       *color_out;  /**< Output: color/state lane bytes (mask 0xAA)    */
    size_t         out_len;    /**< Output buffer length in bytes                 */
} tb3d_dma_descriptor_t;

/**
 * @brief Execute a SIMD bitmask DMA fetch.
 *
 * Applies the Physical Lane mask (0x55) and the Color/State Lane mask (0xAA)
 * to the source buffer in a single vectorized pass, separating the two
 * sub-planes.  When AVX2 is available, 32 bytes are processed per iteration.
 *
 * @param desc  Populated DMA descriptor.
 * @return      Number of bytes processed, or -1 on parameter error.
 */
int tb3d_dma_fetch(tb3d_dma_descriptor_t *desc);

/* =========================================================================
 * State Buffer (color look-ahead lane)
 * ========================================================================= */

/**
 * @brief State Buffer: software model of the TB3-D L2 metadata lane.
 *
 * Provides O(1) per-bit color query without touching the physical data lane,
 * mirroring the "dedicated 4-bit-per-byte metadata lane in the L2 cache"
 * described in the specification.
 */
typedef struct {
    uint8_t *color_nibbles; /**< One color nibble (4 bits) per legacy byte */
    size_t   capacity;      /**< Buffer capacity in bytes                   */
} tb3d_state_buffer_t;

/**
 * @brief Initialize a State Buffer.
 *
 * @param sb        State Buffer to initialize.
 * @param capacity  Number of legacy bytes to track.
 * @return          0 on success, -1 on allocation failure.
 */
int tb3d_state_buffer_init(tb3d_state_buffer_t *sb, size_t capacity);

/**
 * @brief Release resources held by a State Buffer.
 *
 * @param sb  State Buffer to destroy.
 */
void tb3d_state_buffer_destroy(tb3d_state_buffer_t *sb);

/**
 * @brief Load color state from a TB3-D packed buffer into the State Buffer.
 *
 * @param sb    Target State Buffer.
 * @param src   Source TB3-D packed buffer.
 * @param len   Number of TB3-D packed bytes (= number of nibbles = len/2 legacy bytes when interleaved).
 * @return      0 on success, -1 on error.
 */
int tb3d_state_buffer_load(tb3d_state_buffer_t *sb,
                            const uint8_t       *src,
                            size_t               len);

/**
 * @brief Look-ahead query: return the color of bit @c bit_pos in byte @c byte_idx.
 *
 * @param sb        State Buffer (must have been populated via tb3d_state_buffer_load).
 * @param byte_idx  Legacy byte index (0 … capacity-1).
 * @param bit_pos   Bit position within the byte (0–7).
 * @return          TB3D_COLOR_RED or TB3D_COLOR_GREEN, or -1 on bounds error.
 */
int tb3d_state_buffer_query(const tb3d_state_buffer_t *sb,
                             size_t                    byte_idx,
                             uint8_t                   bit_pos);

/**
 * @brief Set the color of bit @c bit_pos in byte @c byte_idx.
 *
 * @param sb        State Buffer.
 * @param byte_idx  Legacy byte index.
 * @param bit_pos   Bit position (0–7).
 * @param color     Color to set.
 * @return          0 on success, -1 on bounds error.
 */
int tb3d_state_buffer_set(tb3d_state_buffer_t *sb,
                           size_t               byte_idx,
                           uint8_t              bit_pos,
                           tb3d_color_t         color);

/* =========================================================================
 * Transcoder — legacy binary ↔ TB3-D RAM buffer conversion
 * ========================================================================= */

/**
 * @brief Transcode a legacy binary buffer into a split TB3-D Dragonfly Cache.
 *
 * Models the hardware Transcoder's "Secretary" (write) path:
 *   - Snaps the incoming 8-bit stream to TB3-D frequency before it reaches
 *     the memory controller.
 *   - Writes physical and color lanes into separate cache-aligned buffers.
 *
 * @param legacy_src   Source legacy byte buffer.
 * @param src_len      Number of legacy bytes.
 * @param cache        Destination Dragonfly Cache (must be pre-initialized).
 * @param color_mask   Default color mask for all bits.
 * @return             0 on success, -1 on error.
 */
int tb3d_transcode_to_cache(const uint8_t          *legacy_src,
                              size_t                  src_len,
                              tb3d_dragonfly_cache_t *cache,
                              uint8_t                 color_mask);

/**
 * @brief Transcode a split TB3-D Dragonfly Cache back to a legacy byte buffer.
 *
 * Models the hardware Transcoder's "Executive" (read) path:
 *   - Pulls the pre-resolved TB3-D frequency from the cache.
 *   - Reconstructs the original binary representation losslessly.
 *
 * @param cache      Source Dragonfly Cache.
 * @param legacy_dst Destination legacy byte buffer (cache->used bytes).
 * @return           0 on success, -1 on error.
 */
int tb3d_transcode_from_cache(const tb3d_dragonfly_cache_t *cache,
                                uint8_t                      *legacy_dst);

#ifdef __cplusplus
}
#endif

#endif /* DYASMART_TB3D_DRIVER_H */
