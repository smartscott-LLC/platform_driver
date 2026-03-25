; =============================================================================
; tb3d_decoder.ll — TB3-D (Ternary Binary Multi-Dimensional) Decoder Core
; LLVM Intermediate Representation
;
; Target:  x86-64 (AMD64), LLVM 18+
; Purpose: Reference LLVM IR for the TB3-D bit-pairing (interleave) engine.
;          This file is the authoritative LLVM-level specification for the
;          TB3-D encoding/decoding operations, aligned with the DyaSmart spec.
;
; ENCODING SCHEME RECAP
; ---------------------
; A TB3-D packed byte stores 4 physical bits P[3:0] and 4 color bits C[3:0]
; interleaved by position:
;
;   Bit position:  7    6    5    4    3    2    1    0
;   TB3-D layout: C[3] P[3] C[2] P[2] C[1] P[1] C[0] P[0]
;
; Physical Lane mask: 0x55 = 0b01010101 (bit positions 0,2,4,6)
; Color/State  mask:  0xAA = 0b10101010 (bit positions 1,3,5,7)
;
; SPEC REFERENCE — "TB3-D Decoder Core (Bit-Pairing)"
; ----------------------------------------------------
; The specification describes the vectorized decoder as operating on
; <4 x i8> vectors (4 packed bytes in parallel).  The Color/State bits
; are shifted one position to the right of their Physical counterparts.
; Note: The original spec shows return type <8 x i8>; the correct type
; that matches the computation body is <4 x i8> — corrected below.
;
; The scalar encode/decode logic mirrors the vectorized form but operates
; on a single i8 (one packed byte at a time).
; =============================================================================

; ---- Module metadata -------------------------------------------------------
source_filename = "tb3d_decoder.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; =============================================================================
; SCALAR OPERATIONS
; =============================================================================

; -----------------------------------------------------------------------------
; tb3d_encode_nibble_scalar — encode a single nibble pair into a packed byte.
;
; Algorithm (equivalent to BMI2 PDEP):
;   bit 0 of physical → bit 0 of packed  (position 0)
;   bit 1 of physical → bit 2 of packed  (position 2)
;   bit 2 of physical → bit 4 of packed  (position 4)
;   bit 3 of physical → bit 6 of packed  (position 6)
;   bit 0 of color    → bit 1 of packed  (position 1)
;   bit 1 of color    → bit 3 of packed  (position 3)
;   bit 2 of color    → bit 5 of packed  (position 5)
;   bit 3 of color    → bit 7 of packed  (position 7)
;
; Parameters:
;   %p — physical nibble  i8, bits[3:0] used
;   %c — color nibble     i8, bits[3:0] used
; Returns: i8 packed TB3-D byte
; -----------------------------------------------------------------------------
define i8 @tb3d_encode_nibble_scalar(i8 %p, i8 %c) #0 {
entry:
  ; Mask to nibble range
  %p4 = and i8 %p, 15
  %c4 = and i8 %c, 15

  ; --- Spread physical bits to positions 0, 2, 4, 6 ---
  ; bit 0 → position 0: extract bit 0
  %p_b0     = and i8 %p4, 1

  ; bit 1 → position 2: extract, shift left 1 (to bring to position 2)
  %p_b1_raw = lshr i8 %p4, 1
  %p_b1     = and  i8 %p_b1_raw, 1
  %p_b1_s   = shl  i8 %p_b1, 2

  ; bit 2 → position 4: extract, shift left 2
  %p_b2_raw = lshr i8 %p4, 2
  %p_b2     = and  i8 %p_b2_raw, 1
  %p_b2_s   = shl  i8 %p_b2, 4

  ; bit 3 → position 6: extract, shift left 3
  %p_b3_raw = lshr i8 %p4, 3
  %p_b3     = and  i8 %p_b3_raw, 1
  %p_b3_s   = shl  i8 %p_b3, 6

  ; OR all physical bits into the physical spread
  %p_s01    = or i8 %p_b0, %p_b1_s
  %p_s23    = or i8 %p_b2_s, %p_b3_s
  %p_spread = or i8 %p_s01, %p_s23

  ; --- Spread color bits to positions 1, 3, 5, 7 ---
  ; bit 0 → position 1: shift left 1
  %c_b0     = and i8 %c4, 1
  %c_b0_s   = shl i8 %c_b0, 1

  ; bit 1 → position 3: extract, shift left 2
  %c_b1_raw = lshr i8 %c4, 1
  %c_b1     = and  i8 %c_b1_raw, 1
  %c_b1_s   = shl  i8 %c_b1, 3

  ; bit 2 → position 5: extract, shift left 3
  %c_b2_raw = lshr i8 %c4, 2
  %c_b2     = and  i8 %c_b2_raw, 1
  %c_b2_s   = shl  i8 %c_b2, 5

  ; bit 3 → position 7: extract, shift left 4
  %c_b3_raw = lshr i8 %c4, 3
  %c_b3     = and  i8 %c_b3_raw, 1
  %c_b3_s   = shl  i8 %c_b3, 7

  ; OR all color bits into the color spread
  %c_s01    = or i8 %c_b0_s, %c_b1_s
  %c_s23    = or i8 %c_b2_s, %c_b3_s
  %c_spread = or i8 %c_s01, %c_s23

  ; --- Merge physical and color spreads ---
  %result = or i8 %p_spread, %c_spread
  ret i8 %result
}

; -----------------------------------------------------------------------------
; tb3d_decode_nibble_scalar — decode a packed byte into physical and color nibbles.
;
; Parameters:
;   %packed — i8 TB3-D packed byte [C3|P3|C2|P2|C1|P1|C0|P0]
; Returns: { i8 physical, i8 color }  (as a struct / aggregate return)
; -----------------------------------------------------------------------------
define { i8, i8 } @tb3d_decode_nibble_scalar(i8 %packed) #0 {
entry:
  ; --- Extract physical bits from positions 0, 2, 4, 6 ---
  ; Mask odd positions: packed & 0x55
  %phys_masked = and i8 %packed, 85          ; 0x55 = 85

  ; Compress to nibble: bit 0→0, bit 2→1, bit 4→2, bit 6→3
  %ph_b0     = and  i8 %phys_masked, 1       ; bit 0
  %ph_b2_raw = lshr i8 %phys_masked, 2
  %ph_b2     = and  i8 %ph_b2_raw, 1
  %ph_b2_s   = shl  i8 %ph_b2, 1            ; → bit 1
  %ph_b4_raw = lshr i8 %phys_masked, 4
  %ph_b4     = and  i8 %ph_b4_raw, 1
  %ph_b4_s   = shl  i8 %ph_b4, 2            ; → bit 2
  %ph_b6_raw = lshr i8 %phys_masked, 6
  %ph_b6     = and  i8 %ph_b6_raw, 1
  %ph_b6_s   = shl  i8 %ph_b6, 3            ; → bit 3
  %ph_01     = or  i8 %ph_b0, %ph_b2_s
  %ph_23     = or  i8 %ph_b4_s, %ph_b6_s
  %physical  = or  i8 %ph_01, %ph_23

  ; --- Extract color bits from positions 1, 3, 5, 7 ---
  ; Mask even positions: (packed >> 1) & 0x55
  %col_shifted = lshr i8 %packed, 1
  %col_masked  = and  i8 %col_shifted, 85    ; 0x55 = 85

  ; Compress to nibble
  %co_b0     = and  i8 %col_masked, 1
  %co_b2_raw = lshr i8 %col_masked, 2
  %co_b2     = and  i8 %co_b2_raw, 1
  %co_b2_s   = shl  i8 %co_b2, 1
  %co_b4_raw = lshr i8 %col_masked, 4
  %co_b4     = and  i8 %co_b4_raw, 1
  %co_b4_s   = shl  i8 %co_b4, 2
  %co_b6_raw = lshr i8 %col_masked, 6
  %co_b6     = and  i8 %co_b6_raw, 1
  %co_b6_s   = shl  i8 %co_b6, 3
  %co_01     = or  i8 %co_b0, %co_b2_s
  %co_23     = or  i8 %co_b4_s, %co_b6_s
  %color     = or  i8 %co_01, %co_23

  ; Return aggregate {physical, color}
  %ret0 = insertvalue { i8, i8 } undef, i8 %physical, 0
  %ret1 = insertvalue { i8, i8 } %ret0, i8 %color, 1
  ret { i8, i8 } %ret1
}

; =============================================================================
; VECTORIZED OPERATIONS — <4 x i8> (spec-aligned, corrected return type)
; =============================================================================

; -----------------------------------------------------------------------------
; tb3d_decode_v4 — Vectorized TB3-D decoder (4 packed bytes in parallel).
;
; This is the corrected version of the specification's "TB3-D Decoder Core
; (Bit-Pairing)" with the return type fixed from <8 x i8> to <4 x i8>.
;
; Specification excerpt (with correction noted):
;   define <4 x i8> @tb3d_decode_v4(<4 x i8> %p, <4 x i8> %c)  ; was <8 x i8>
;
; The input vectors %p and %c each contain 4 nibble values (one per byte lane).
; The operation interleaves them into 4 packed TB3-D bytes.
;
; Parameters:
;   %p — <4 x i8> physical nibble vector (one nibble per lane)
;   %c — <4 x i8> color nibble vector    (one nibble per lane)
; Returns: <4 x i8> packed TB3-D byte vector (spec-corrected return type)
; -----------------------------------------------------------------------------
define <4 x i8> @tb3d_decode_v4(<4 x i8> %p, <4 x i8> %c) #0 {
entry:
  ; --- Per-specification: mask both inputs to their nibble weight positions ---
  ; Physical weight mask: extracts positional weights 1,2,4,8 per lane
  %p_masked = and <4 x i8> %p, <i8 1, i8 2, i8 4, i8 8>
  %c_masked = and <4 x i8> %c, <i8 1, i8 2, i8 4, i8 8>

  ; --- Shift Color (satellite) bits one position left ---
  ; This places C[n] at the even bit position adjacent to P[n]
  %c_shifted = shl <4 x i8> %c_masked, <i8 1, i8 1, i8 1, i8 1>

  ; --- Parallel OR merge: combine physical and color sub-planes ---
  %result = or <4 x i8> %p_masked, %c_shifted
  ret <4 x i8> %result
}

; -----------------------------------------------------------------------------
; tb3d_encode_v4 — Vectorized TB3-D encoder (4 nibble pairs in parallel).
;
; Parameters:
;   %p — <4 x i8> physical nibble vector (bits[3:0] of each lane)
;   %c — <4 x i8> color nibble vector    (bits[3:0] of each lane)
; Returns: <4 x i8> packed TB3-D byte vector
; -----------------------------------------------------------------------------
define <4 x i8> @tb3d_encode_v4(<4 x i8> %p, <4 x i8> %c) #0 {
entry:
  ; Mask both to lower nibbles
  %p4 = and <4 x i8> %p, <i8 15, i8 15, i8 15, i8 15>
  %c4 = and <4 x i8> %c, <i8 15, i8 15, i8 15, i8 15>

  ; Spread physical nibble bits to positions 0,2,4,6:
  ;   p_b0 = p[0]         (bit 0 → position 0)
  ;   p_b1 = p[1] << 1    (bit 1 → position 2)
  ;   p_b2 = p[2] << 2    (bit 2 → position 4)
  ;   p_b3 = p[3] << 3    (bit 3 → position 6)
  %p_b0     = and <4 x i8> %p4, <i8 1, i8 1, i8 1, i8 1>
  %p_b1_r   = lshr <4 x i8> %p4, <i8 1, i8 1, i8 1, i8 1>
  %p_b1     = and  <4 x i8> %p_b1_r, <i8 1, i8 1, i8 1, i8 1>
  %p_b1_s   = shl  <4 x i8> %p_b1, <i8 2, i8 2, i8 2, i8 2>
  %p_b2_r   = lshr <4 x i8> %p4, <i8 2, i8 2, i8 2, i8 2>
  %p_b2     = and  <4 x i8> %p_b2_r, <i8 1, i8 1, i8 1, i8 1>
  %p_b2_s   = shl  <4 x i8> %p_b2, <i8 4, i8 4, i8 4, i8 4>
  %p_b3_r   = lshr <4 x i8> %p4, <i8 3, i8 3, i8 3, i8 3>
  %p_b3     = and  <4 x i8> %p_b3_r, <i8 1, i8 1, i8 1, i8 1>
  %p_b3_s   = shl  <4 x i8> %p_b3, <i8 6, i8 6, i8 6, i8 6>
  %p_s01    = or <4 x i8> %p_b0, %p_b1_s
  %p_s23    = or <4 x i8> %p_b2_s, %p_b3_s
  %p_spread = or <4 x i8> %p_s01, %p_s23

  ; Spread color nibble bits to positions 1,3,5,7:
  %c_b0     = and <4 x i8> %c4, <i8 1, i8 1, i8 1, i8 1>
  %c_b0_s   = shl <4 x i8> %c_b0, <i8 1, i8 1, i8 1, i8 1>
  %c_b1_r   = lshr <4 x i8> %c4, <i8 1, i8 1, i8 1, i8 1>
  %c_b1     = and  <4 x i8> %c_b1_r, <i8 1, i8 1, i8 1, i8 1>
  %c_b1_s   = shl  <4 x i8> %c_b1, <i8 3, i8 3, i8 3, i8 3>
  %c_b2_r   = lshr <4 x i8> %c4, <i8 2, i8 2, i8 2, i8 2>
  %c_b2     = and  <4 x i8> %c_b2_r, <i8 1, i8 1, i8 1, i8 1>
  %c_b2_s   = shl  <4 x i8> %c_b2, <i8 5, i8 5, i8 5, i8 5>
  %c_b3_r   = lshr <4 x i8> %c4, <i8 3, i8 3, i8 3, i8 3>
  %c_b3     = and  <4 x i8> %c_b3_r, <i8 1, i8 1, i8 1, i8 1>
  %c_b3_s   = shl  <4 x i8> %c_b3, <i8 7, i8 7, i8 7, i8 7>
  %c_s01    = or <4 x i8> %c_b0_s, %c_b1_s
  %c_s23    = or <4 x i8> %c_b2_s, %c_b3_s
  %c_spread = or <4 x i8> %c_s01, %c_s23

  ; Merge
  %result = or <4 x i8> %p_spread, %c_spread
  ret <4 x i8> %result
}

; =============================================================================
; BITMASK LANE SEPARATION (DMA Layer simulation)
; =============================================================================

; -----------------------------------------------------------------------------
; tb3d_extract_physical_v8 — Extract physical sub-plane from 8 packed bytes.
;
; Applies the Physical Lane bitmask 0x55 to isolate physical bits.
;
; Parameters:  %v — <8 x i8> vector of packed TB3-D bytes
; Returns:     <8 x i8> physical sub-plane (bits at positions 0,2,4,6)
; -----------------------------------------------------------------------------
define <8 x i8> @tb3d_extract_physical_v8(<8 x i8> %v) #0 {
entry:
  %result = and <8 x i8> %v,
            <i8 85, i8 85, i8 85, i8 85, i8 85, i8 85, i8 85, i8 85>
  ret <8 x i8> %result
}

; -----------------------------------------------------------------------------
; tb3d_extract_color_v8 — Extract color/state sub-plane from 8 packed bytes.
;
; Applies the Color Lane bitmask 0xAA, then shifts right by 1 to normalize
; color nibble bits back to positions 0,1,2,3.
;
; Parameters:  %v — <8 x i8> vector of packed TB3-D bytes
; Returns:     <8 x i8> color sub-plane (normalized to bits 0,2,4,6)
; -----------------------------------------------------------------------------
define <8 x i8> @tb3d_extract_color_v8(<8 x i8> %v) #0 {
entry:
  ; 170 decimal = 0xAA = 0b10101010 (Color/State Lane mask — odd bit positions 1,3,5,7).
  ; LLVM i8 is a signed 8-bit integer; 0xAA = 170 overflows signed i8, so
  ; the two's-complement representation is used: 170 - 256 = -86.
  ; This is identical to the unsigned value 0xAA for all bitwise operations.
  %masked  = and  <8 x i8> %v,
             <i8 -86, i8 -86, i8 -86, i8 -86, i8 -86, i8 -86, i8 -86, i8 -86>
  %shifted = lshr <8 x i8> %masked,
             <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>
  ret <8 x i8> %shifted
}

; =============================================================================
; Function attributes
; =============================================================================
attributes #0 = { nounwind readnone speculatable willreturn }
