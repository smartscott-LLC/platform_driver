# DyaSmart — TB3-D Logic Engine

DyaSmart is a **Ternary Binary Multi-Dimensional (TB3-D)** logic engine that
moves the state of normalized 2-D binary into 3-D ternary binary, effectively
increasing compute power and bandwidth while reducing the digital footprint of
traditional binary data storage and transmission.

## What It Does

Every physical bit carries a paired **Color/State** satellite bit (RED = active,
GREEN = passive), creating a third information dimension beyond the classic
binary `0`/`1`.  The engine packs 4 physical bits and 4 color bits into a
single 8-bit interleaved byte:

```
Bit position:  7    6    5    4    3    2    1    0
TB3-D layout: C[3] P[3] C[2] P[2] C[1] P[1] C[0] P[0]
```

- **Physical lane** (mask `0x55`): odd bit positions 0,2,4,6
- **Color/State lane** (mask `0xAA`): even bit positions 1,3,5,7

## Key Properties

| Property | Value |
|----------|-------|
| Physical footprint | 50% reduction (8-bit data stored in 4 physical bits) |
| Effective bandwidth | 2× (physical + color lanes read in parallel) |
| Resolution | 1:1 parallel interleave — no ALU summation |
| Fidelity | 100% lossless binary reconstruction |

## Architecture

The engine is implemented in C11 targeting **x86-64** with three feature tiers:

| Tier | ISA | Operation |
|------|-----|-----------|
| 1 | BMI2 (Haswell+, Zen+) | PDEP/PEXT — single-cycle nibble spread/compress |
| 2 | AVX2 (256-bit SIMD) | VPSHUFB — 16 legacy bytes per iteration |
| 3 | Portable (all platforms) | Constant-time 16-entry lookup table |

Three hardware-integration subsystems:

- **Dragonfly Cache Interface** — `prefetcht0`-prefetched, cache-line-aligned
  two-lane buffers for simultaneous L1 population of both sub-planes.
- **SIMD Bitmask DMA Layer** — AVX2-vectorized physical/color lane separation
  using the 0x55 / 0xAA bitmasks in a single pass.
- **State Buffer** — O(1) per-bit color look-ahead without touching the
  physical data lane (models the dedicated L2 metadata lane).

## Build

```bash
cmake -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build
cd build && ctest --output-on-failure
```

CMake automatically detects and enables BMI2, AVX2, and the LLVM toolchain
(for assembling the reference LLVM IR module in `llvm/tb3d_decoder.ll`).

## LLVM IR

`llvm/tb3d_decoder.ll` contains the authoritative LLVM Intermediate
Representation for all TB3-D operations, including the spec-aligned vectorized
decoder (`tb3d_decode_v4`) and the DMA lane-separation functions.

```bash
# Assemble to bitcode
llvm-as-18 llvm/tb3d_decoder.ll -o build/tb3d_decoder.bc

# Compile to native object
llc-18 -filetype=obj -mcpu=x86-64 -mattr=+avx2,+bmi2 \
    build/tb3d_decoder.bc -o build/tb3d_decoder.o
```

## Documentation

See [`docs/architecture.md`](docs/architecture.md) for full architecture and
design decision documentation.

