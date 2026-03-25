/**
 * @file tb3d.h
 * @brief DyaSmart TB3-D (Ternary Binary Multi-Dimensional) Logic Engine
 *        Core types, constants, and public API.
 *
 * Architecture: 3D Ternary Bit-Pairing (Odd/Even Interleave)
 *
 * ENCODING SCHEME
 * ---------------
 * A legacy 8-bit byte is split into two nibbles. Each nibble is paired with
 * a 4-bit Color/State mask and packed into a single 8-bit TB3-D packed byte:
 *
 *   Bit position:  7    6    5    4    3    2    1    0
 *   TB3-D layout: C[3] P[3] C[2] P[2] C[1] P[1] C[0] P[0]
 *
 * Physical bits (P) occupy even bit positions → mask 0x55 = 0b01010101
 * Color bits    (C) occupy odd  bit positions → mask 0xAA = 0b10101010
 *
 * Note: the specification labels Physical as "Odd" and Color as "Even" using
 * its own interleave-slot numbering; by the standard zero-based bit-position
 * convention used throughout this codebase, P lives at even positions (0,2,4,6)
 * and C lives at odd positions (1,3,5,7).
 *
 * A full legacy byte is encoded as a 16-bit TB3-D word:
 *   word[7:0]  = packed TB3-D byte for legacy bits [3:0]  (lower nibble)
 *   word[15:8] = packed TB3-D byte for legacy bits [7:4]  (upper nibble)
 *
 * COLOR STATES
 * ------------
 *   GREEN (0) – Baseline Ternary Passivity:        satellite bit = NULL/LOW
 *   RED   (1) – High-Frequency Ternary Activation: satellite bit = HIGH
 *
 * EFFICIENCY CLAIMS (per specification)
 * --------------------------------------
 *   • 50% physical footprint reduction: 8-bit data encoded in 4 physical bits.
 *   • 2× effective bandwidth: physical and color lanes read in parallel.
 *   • 1:1 parallel resolution via interleave (no ALU summation required).
 *   • 100% lossless reconstruction of original binary data.
 */
#ifndef DYASMART_TB3D_H
#define DYASMART_TB3D_H

#include <stddef.h>
#include <stdint.h>
#include <stdbool.h>

#ifdef __cplusplus
extern "C" {
#endif

/* =========================================================================
 * Version
 * ========================================================================= */
#define TB3D_VERSION_MAJOR 1
#define TB3D_VERSION_MINOR 0
#define TB3D_VERSION_PATCH 0

/* =========================================================================
 * Bitmask constants
 * ========================================================================= */

/** Physical lane bitmask — selects even bit positions (0,2,4,6) within a byte.
 *  The specification refers to these as the "Odd" positions in its interleave
 *  slot numbering, but by standard zero-based bit position convention these are
 *  the even positions (bit 0, 2, 4, 6). */
#define TB3D_PHYSICAL_LANE_MASK  ((uint8_t)0x55U)

/** Color/State lane bitmask — selects odd bit positions (1,3,5,7) within a byte.
 *  The specification refers to these as the "Even" positions in its interleave
 *  slot numbering, but by standard zero-based bit position convention these are
 *  the odd positions (bit 1, 3, 5, 7). */
#define TB3D_COLOR_LANE_MASK     ((uint8_t)0xAAU)

/** Nibble mask — lower 4 bits. */
#define TB3D_NIBBLE_MASK         ((uint8_t)0x0FU)

/** Maximum nibble value (2^4 - 1). */
#define TB3D_NIBBLE_MAX          ((uint8_t)0x0FU)

/* =========================================================================
 * Color / State Encoding
 * ========================================================================= */

/**
 * @brief Per-bit color (state) tag used by the TB3-D engine.
 *
 * Each physical bit in a TB3-D encoded value carries a paired satellite bit
 * that indicates its activation state.
 */
typedef enum {
    /** Baseline Ternary Passivity — satellite bit is NULL (LOW, 0). */
    TB3D_COLOR_GREEN = 0,
    /** High-Frequency Ternary Activation — satellite bit is HIGH (1). */
    TB3D_COLOR_RED   = 1
} tb3d_color_t;

/* =========================================================================
 * Core Types
 * ========================================================================= */

/**
 * @brief A packed TB3-D byte: 8 bits encoding 4 physical bits + 4 color bits.
 *
 * Bit layout: [C3|P3|C2|P2|C1|P1|C0|P0]
 *   - P[n] at bit position 2n   (physical lane, mask 0x55)
 *   - C[n] at bit position 2n+1 (color lane,    mask 0xAA)
 */
typedef uint8_t tb3d_packed_t;

/**
 * @brief A TB3-D word: 16 bits encoding one full legacy byte (8 bits) plus
 *        its 8-bit color mask.
 *
 * Layout:
 *   bits [7:0]  = tb3d_packed_t for legacy byte bits [3:0]  (lower nibble)
 *   bits [15:8] = tb3d_packed_t for legacy byte bits [7:4]  (upper nibble)
 */
typedef uint16_t tb3d_word_t;

/**
 * @brief A nibble pair: 4 physical bits + 4 color bits, un-packed.
 *
 * Only bits[3:0] of each field are significant; upper bits are ignored.
 */
typedef struct {
    uint8_t physical; /**< Physical register nibble P[3:0] */
    uint8_t color;    /**< Color/State mask nibble   C[3:0] */
} tb3d_nibble_pair_t;

/**
 * @brief A TB3-D buffer descriptor wrapping two aligned lanes.
 *
 * Represents @c length legacy bytes stored in the TB3-D two-lane format:
 *   - @c physical_buf: packed physical nibbles (length bytes, 2 nibbles/byte)
 *   - @c color_buf:    packed color nibbles    (length bytes, 2 nibbles/byte)
 *
 * Both buffers must be @c length bytes long and 64-byte aligned for optimal
 * cache performance (see Dragonfly Cache Interface in tb3d_driver.h).
 */
typedef struct {
    uint8_t *physical_buf; /**< Physical data lane (packed nibble pairs) */
    uint8_t *color_buf;    /**< Color/State lane   (packed nibble pairs) */
    size_t   length;       /**< Number of legacy bytes represented       */
} tb3d_buffer_t;

/* =========================================================================
 * Scalar API — single nibble / single byte operations
 * ========================================================================= */

/**
 * @brief Encode a nibble pair into a TB3-D packed byte.
 *
 * Interleaves the 4 physical bits and 4 color bits into the canonical
 * TB3-D layout: [C3|P3|C2|P2|C1|P1|C0|P0].
 *
 * Uses BMI2 PDEP when available; falls back to a constant-time LUT.
 *
 * @param physical  4-bit physical nibble (bits[3:0] used; upper bits ignored).
 * @param color     4-bit color nibble    (bits[3:0] used; upper bits ignored).
 * @return          8-bit TB3-D packed byte.
 */
tb3d_packed_t tb3d_encode_nibble(uint8_t physical, uint8_t color);

/**
 * @brief Decode a TB3-D packed byte into its physical and color nibbles.
 *
 * Uses BMI2 PEXT when available; falls back to a constant-time LUT.
 *
 * @param packed    TB3-D packed byte [C3|P3|C2|P2|C1|P1|C0|P0].
 * @param[out] physical  4-bit physical nibble.
 * @param[out] color     4-bit color nibble.
 */
void tb3d_decode_nibble(tb3d_packed_t packed,
                        uint8_t      *physical,
                        uint8_t      *color);

/**
 * @brief Encode a legacy 8-bit byte into a TB3-D word.
 *
 * @param byte        Legacy byte to encode.
 * @param color_mask  8-bit color mask (one color bit per physical data bit).
 *                    Use 0x00 for all-GREEN (baseline passivity) and
 *                    0xFF for all-RED (full activation).
 * @return            16-bit TB3-D word.
 */
tb3d_word_t tb3d_encode_byte(uint8_t byte, uint8_t color_mask);

/**
 * @brief Decode a TB3-D word back to a legacy 8-bit byte.
 *
 * Color information is discarded. Use @c tb3d_decode_word_full to retain it.
 *
 * @param word  16-bit TB3-D word.
 * @return      Original 8-bit legacy byte.
 */
uint8_t tb3d_decode_byte(tb3d_word_t word);

/**
 * @brief Decode a TB3-D word into both the legacy byte and its color mask.
 *
 * @param word           16-bit TB3-D word.
 * @param[out] byte       Reconstructed 8-bit legacy byte.
 * @param[out] color_mask Reconstructed 8-bit color mask.
 */
void tb3d_decode_word_full(tb3d_word_t  word,
                           uint8_t     *byte,
                           uint8_t     *color_mask);

/**
 * @brief Query the color state of a specific bit position in a TB3-D packed byte.
 *
 * @param packed   TB3-D packed byte.
 * @param bit_pos  Physical bit position to query (0–3).
 * @return         @c TB3D_COLOR_RED or @c TB3D_COLOR_GREEN.
 */
tb3d_color_t tb3d_get_bit_color(tb3d_packed_t packed, uint8_t bit_pos);

/**
 * @brief Set the color state of a specific bit position in a TB3-D packed byte.
 *
 * @param packed   TB3-D packed byte (value to modify).
 * @param bit_pos  Physical bit position to update (0–3).
 * @param color    Color state to write.
 * @return         Updated TB3-D packed byte.
 */
tb3d_packed_t tb3d_set_bit_color(tb3d_packed_t packed,
                                  uint8_t       bit_pos,
                                  tb3d_color_t  color);

/* =========================================================================
 * Buffer API — block / streaming operations
 * ========================================================================= */

/**
 * @brief Encode a legacy byte buffer into a TB3-D word buffer.
 *
 * Each source byte is encoded as two consecutive bytes in @c dst (a TB3-D word).
 * The caller must allocate @c dst with at least @c 2 * src_len bytes.
 *
 * When AVX2 is available the inner loop is vectorized (16 bytes/iteration).
 *
 * @param src           Source legacy byte buffer.
 * @param dst           Destination buffer (2 × src_len bytes).
 * @param src_len       Number of source bytes to encode.
 * @param default_color Color mask applied uniformly to every bit.
 *                      0x00 = all GREEN; 0xFF = all RED.
 */
void tb3d_encode_buffer(const uint8_t *src,
                        uint8_t       *dst,
                        size_t         src_len,
                        uint8_t        default_color);

/**
 * @brief Decode a TB3-D word buffer back to a legacy byte buffer.
 *
 * @param src      Source TB3-D word buffer (2 × dst_len bytes).
 * @param dst      Destination legacy byte buffer (dst_len bytes).
 * @param dst_len  Number of legacy bytes to decode.
 */
void tb3d_decode_buffer(const uint8_t *src,
                        uint8_t       *dst,
                        size_t         dst_len);

/**
 * @brief Encode a legacy byte buffer into a split TB3-D buffer descriptor.
 *
 * Physical nibbles and color nibbles are written to separate lanes, enabling
 * the parallel read path of the Dragonfly Cache Interface.
 *
 * @param src   Source legacy byte buffer (@c buf->length bytes).
 * @param color Default color mask (0x00 = all GREEN, 0xFF = all RED).
 * @param buf   Initialized @c tb3d_buffer_t with pre-allocated lanes.
 */
void tb3d_encode_split(const uint8_t  *src,
                       uint8_t         color,
                       tb3d_buffer_t  *buf);

/**
 * @brief Decode a split TB3-D buffer descriptor into a legacy byte buffer.
 *
 * @param buf   Source @c tb3d_buffer_t (physical + color lanes).
 * @param dst   Destination legacy byte buffer (@c buf->length bytes).
 */
void tb3d_decode_split(const tb3d_buffer_t *buf, uint8_t *dst);

/* =========================================================================
 * CPU feature query
 * ========================================================================= */

/** @return true if BMI2 (PDEP/PEXT) acceleration is active. */
bool tb3d_has_bmi2(void);

/** @return true if AVX2 SIMD vectorization is active. */
bool tb3d_has_avx2(void);

/** @return true if AVX-512 SIMD vectorization is active. */
bool tb3d_has_avx512(void);

/* =========================================================================
 * Diagnostic / display utilities
 * ========================================================================= */

/**
 * @brief Print a human-readable representation of a TB3-D packed byte to stdout.
 *
 * Example output:
 *   Packed=0x1B  P[3:0]=0x5  C[3:0]=0x3  Layout=[0|1|0|1|1|0|1|1]
 *                                                  C3 P3 C2 P2 C1 P1 C0 P0
 *
 * @param packed  TB3-D packed byte to display.
 */
void tb3d_print_packed(tb3d_packed_t packed);

/**
 * @brief Print a human-readable representation of a TB3-D word to stdout.
 *
 * @param word  TB3-D word to display.
 */
void tb3d_print_word(tb3d_word_t word);

#ifdef __cplusplus
}
#endif

#endif /* DYASMART_TB3D_H */
