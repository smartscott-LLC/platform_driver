# TB3-D Platform Driver — Versal 1802 Architecture

## System Topology

The TB3-D engine is deployed as a **Versal 1802 System-on-Chip (SoC)** with three independent clock domains coordinated by a master orchestrator.

```
╔═══════════════════════════════════════════════════════════════════════╗
║                    tb3d_orchestrator (top level)                      ║
║              [Master Coordinator + CDC Management]                    ║
║                   @ AXI clock domain (200 MHz)                        ║
╚═══════════════════════════════════════════════════════════════════════╝
    ↓                        ↓                        ↓
┌───────────────────┐  ┌──────────────────┐  ┌────────────────────┐
│  GTY Codec Module │  │ Microblaze       │  │ AXI Bridge Module  │
│                   │  │ Module           │  │                    │
│  • Transceiver    │  │ • Microblaze CPU │  │ • AXI4-Lite CSR    │
│    encoder/       │  │   (L2 cache)     │  │   slave            │
│    decoder        │  │ • UART log       │  │ • AXI4 DMA slave   │
│  • 512 GTYP lanes │  │ • Cache coherent │  │   / master         │
│  • Interception   │  │   memory ops     │  │ • AXI SmartConnect │
│                   │  │                  │  │   to NoC           │
│ GTY clock domain  │  │ MB clock domain  │  │ AXI clock domain   │
│ (250 MHz ref)     │  │ (125/200 MHz mb_clk) │ (200 MHz axi_clk) │
└───────────────────┘  └──────────────────┘  └────────────────────┘
         ↑                       ↑                        ↑
         └───────────┬──────────┴──────────┬─────────────┘
                     │  CDC Bridges       │
              (async FIFO crossings)
```

---

## Module Responsibilities

### 1. GTY Codec Module (`tb3d_gty_transceiver_codec.v`)

**Purpose**: Intercept and transcode all Versal GTYP transceiver lanes.

**Clock Domain**: GTY reference clock (~250 MHz)

**Interface**:
- **GTY Transceiver pins**: 512 GTYP lanes (Tx/Rx per lane)
- **Control/Status**: AXI4-Lite interface to orchestrator (CDC via async FIFO)
- **Optional payload**: Direct connection to DMA for high-bandwidth streaming

**Responsibilities**:
- Codec instantiation for all 512 lanes (2× per lane: encoder TX, decoder RX)
- Lane-wise encoding: input binary → TB3-D on transmit
- Lane-wise decoding: TB3-D → output binary on receive
- Per-lane status/error reporting
- Rate control and flow management

**Key Design Decision**: Each GTY lane is **independent and composable** — lane N failure does not block lane N+1. Failed lanes report status to orchestrator but do not stall others.

---

### 2. Microblaze Module (`tb3d_microblaze_module.v`)

**Purpose**: Low-latency cache-aware chunk orchestration.

**Clock Domain**: Microblaze system clock (125 MHz or 200 MHz, configured in Vivado)

**Interface**:
- **Microblaze subsystem**: Embedded MicroBlaze CPU + LMB (Local Memory Bus) with L2 cache enabled
- **UART**: Debug/monitoring console
- **DDR4 AXI Slave**: Connects to Versal DDR4 controller
- **AXI Master to orchestrator**: Cache-aware memory operations
- **Status signals**: L2 cache hit/miss, latency metrics

**Responsibilities**:
- Monitor incoming data streams (via orchestrator)
- Detect cache-aligned boundaries for optimal memory operations
- Coordinate zero-latency chunk movement through L2 cache
- UART logging for performance metrics and debug
- Optional: firmware-based adaptive rate control

---

### 3. AXI Bridge Module (`tb3d_axi_bridge_module.v`)

**Purpose**: System integration with NoC, CIP, and DMA.

**Clock Domain**: AXI system clock (200 MHz)

**Interface**:
- **AXI4-Lite Slave**: CSR register access (orchestrator configuration, engine status)
- **AXI4 Slave**: DMA descriptor queue (from NoC or external masters)
- **AXI4 Master**: DMA to system memory (DDR4 via Versal PL-to-PS interconnect)
- **AXI SmartConnect**: Connection to Versal NoC and CIP

**Responsibilities**:
- Expose TB3-D codec configuration registers (enable, mode, lane status)
- Implement DMA command queue and status reporting
- Arbitrate access to shared system resources (DDR4, NoC)
- Implement address decoding for CSR registers (no fragmentation)

---

## Address Space Allocation

All addresses are AXI clock domain (200 MHz). CDC (Clock Domain Crossing) is transparent to software.

```
Address Range          Size      Module        Purpose
────────────────────────────────────────────────────────
0x4000_0000            64 KB     AXI Bridge    CSR Registers
0x4001_0000            64 KB     AXI Bridge    DMA Queue descriptors
0x4100_0000            256 MB    Reserved      Future expansion

0x5000_0000            16 MB     Microblaze    L2 Cache status/control
0x5100_0000            16 MB     Reserved      MB local memory

0x6000_0000            1 MB      GTY Codec     Transceiver status/control
                                               (per-lane reporting)
0x6100_0000            Reserved               Future GTY extensions
```

**Key Property**: Each module's address space is **fully contained** — no overlap, no SmartConnect address assignment conflicts.

---

## Clock Domains & CDC

| Domain | Frequency | Source | Key Notes |
|--------|-----------|--------|-----------|
| `axi_clk` | 200 MHz | Versal clocking wizard | Primary system clock |
| `mb_clk` | 125 MHz* | Microblaze processor clock | *Configurable in Vivado |
| `gty_clk` | 250 MHz (ref) | GTY transceiver refclk | Requires async FIFO CDC |

**CDC Bridges**:
- `axi_clk` ↔ `mb_clk`: Async FIFO for DMA descriptors and cache control
- `axi_clk` ↔ `gty_clk`: Async FIFO for transceiver status, optional payload steering
- `mb_clk` ↔ `gty_clk`: Mediated through orchestrator (no direct crossing)

**CDC Assertion**: All CDC is **verified at runtime**; address space is logically consistent across all domains.

---

## Integration Flow (Vivado Block Design)

1. **Create Versal base design:**
   - Versal clocking wizard (generate `axi_clk` @ 200 MHz)
   - Versal NoC (configured for target bandwidth)
   - Versal CIP (if needed)
   - Microblaze subsystem (with L2 cache, 125 MHz local clock)

2. **Add TB3-D modules** (in order):
   - `tb3d_axi_bridge_module` — AXI anchor
   - `tb3d_microblaze_module` — Microblaze anchor
   - `tb3d_gty_transceiver_codec` — GTY anchor

3. **Instantiate orchestrator**:
   - `tb3d_orchestrator` — ties the three modules together via CDC FIFOs

4. **Connect to system**:
   - AXI Bridge → NoC → CIP, system memory
   - Microblaze → DDR4 (via PL-to-PS if needed)
   - GTY Codec → transceiver pins

5. **Validate**:
   - No address conflicts (constraint checker)
   - Timing closure on CDC arbiters
   - Functional simulation with test vectors

---

## Timing Strategy

**Goal**: Achieve timing closure with minimal slack degradation vs. standalone encode/decode.

**Approach**:
1. Keep codec modules **purely combinational** (encode/decode are 0 latency)
2. **Pipeline GTY lane instantiation** — distribute lane encoder/decoder hardware across multiple cycles
3. **Register** the CDC FIFO inputs/outputs to absorb metastability
4. **Set independent timing constraints** per module (prevents cross-module pessimism)

**Example**: For 512 GTY lanes:
- Rather than instantiate all 512 codec pairs in one hierarchy level
- Instantiate in groups (e.g., 32 lanes per sub-module × 16 sub-modules)
- Distribute through 2-3 levels of hierarchy
- Each sub-module hits timing independently
- Orchestrator coordinates via registered CDC buses

---

## Future Extensibility

The 3-module + orchestrator pattern scales:

**To add a new subsystem** (e.g., PCIe controller):
1. Create `tb3d_pcie_module.v` (owns its own clock domain)
2. Add CDC paths in orchestrator (async FIFO bridges)
3. Add address space allocation (e.g., `0x7000_0000`)
4. Instantiate and wire in top-level block design
5. No changes to existing modules

---

## Verification & Debug

**Runtime Monitoring**:
- All module status registers are readable via AXI4-Lite CSR
- CDC FIFO occupancy/flags are exposed for debug
- Microblaze UART provides real-time performance telemetry

**Simulation**:
- Each module can be simulated **independently** with local clock
- Orchestrator-level simulation validates CDC timing
- System-level testbench verifies full data path

---

## References

- **Transceiver Codec**: See [GTY Codec Wrapper Design](#)
- **CSR Registers**: See [AXI Bridge Module Register Map](#)
- **Microblaze Integration**: See [Microblaze Module Cache Path](#)
- **Architecture Decision Records (ADRs)**: See `docs/adr/` directory
