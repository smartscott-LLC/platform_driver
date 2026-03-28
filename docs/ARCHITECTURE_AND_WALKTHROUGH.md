# TB3-D Platform Driver — Architecture & Integration Walkthrough

**Target Board**: Versal Premium VP1802 (VPK180 Evaluation Board)  
**Vivado Version**: 2025.2  
**Document Status**: Current as of interface refactor (8-lane GTY, full AXI interface set)

---

## 1. High-Level System Overview

The TB3-D engine is deployed as a **Versal 1802 SoC** design with one master
orchestrator coordinating three independent subsystems across three clock domains.

```
┌──────────────────────────────────────────────────────────────────────────────┐
│                         Versal VP1802 PL (Programmable Logic)                │
│                                                                              │
│  ┌──────────────────────────────────────────────────────────────────────┐    │
│  │               tb3d_orchestrator  (axi_clk: 200 MHz)                 │    │
│  │                                                                      │    │
│  │  S_AXI ◄────── system configuration / status                        │    │
│  │  M_AXI_DMA ──► DDR4 bulk transfers                                  │    │
│  │  M_AXI_GTY_CTRL ──────────────────────────────────────────────────► │    │
│  │  M_AXI_MB_CTRL ───────────────────────────────────────────────────► │    │
│  │  M_AXI_AXB_CTRL ──────────────────────────────────────────────────► │    │
│  │  S_GTY_STATUS ◄──────────────────────────────────────────────────── │    │
│  └────┬──────────────────┬───────────────────────────────────┬─────────┘    │
│       │                  │                                   │              │
│       ▼                  ▼                                   ▼              │
│  ┌──────────┐     ┌────────────┐                   ┌────────────────┐       │
│  │ GTY Codec│     │ Microblaze │                   │  AXI Bridge    │       │
│  │(gty_clk) │     │  Module    │                   │  Module        │       │
│  │250 MHz   │     │ (mb_clk)   │                   │ (axi_clk)      │       │
│  │          │     │ 200 MHz    │                   │ 200 MHz        │       │
│  │S_AXI_CTRL│     │S_AXI_CTRL  │                   │S_AXI  ◄── NoC  │       │
│  │M_AXIS_GTY│     │M_AXI (DDR) │                   │M_AXI_DMA ──►  │       │
│  │S_AXIS_USR│     │UART        │                   │M_ORCH_CTRL     │       │
│  └──────────┘     └────────────┘                   └────────────────┘       │
│       │                                                                      │
│  8×GTYP transceivers                                                        │
│  (64-bit/lane, 512-bit total)                                                │
└──────────────────────────────────────────────────────────────────────────────┘
```

---

## 2. Module Responsibilities

### 2.1 `tb3d_orchestrator.v` — Master Coordinator (200 MHz)

The orchestrator sits in the **primary AXI clock domain** and is the single
point of system-visible configuration.

| Interface | Direction | Purpose |
|-----------|-----------|---------|
| `S_AXI` | Slave | System (NoC/CIPS) configures TB3-D via CSR registers |
| `M_AXI_DMA` | Master | Bulk DMA to/from DDR4 (future full implementation) |
| `M_AXI_GTY_CTRL` | Master | Writes enable/lane-enable to GTY codec CSR |
| `M_AXI_MB_CTRL` | Master | Triggers MB cache operations; reads perf stats |
| `M_AXI_AXB_CTRL` | Master | Writes status into bridge CSR for system readback |
| `S_GTY_STATUS` | Slave | Raw per-lane lock/error from GTY codec (8 bits each) |

**CSR Register Map** (accessed via `S_AXI`):

| Offset | Name | Access | Description |
|--------|------|--------|-------------|
| 0x00 | CONTROL | R/W | `[0]`=global_en, `[1]`=codec_en, `[7:2]`=mode |
| 0x04 | STATUS | R/W | `[0]`=ready, `[1]`=busy, `[2]`=error |
| 0x08 | GTY_LOCK | RO | Per-lane lock status (8 bits → bits[7:0]) |
| 0x0C | GTY_ERROR | RO | Per-lane error flags (8 bits → bits[7:0]) |

---

### 2.2 `tb3d_gty_transceiver_codec.v` — GTY Codec (250 MHz data / 200 MHz ctrl)

Intercepts and transcodes the 8 GTYP transceiver lanes.  Each lane carries
64-bit data; the combined data path is **512 bits wide**.

```
User logic / DMA (512-bit)
        │
S_AXIS_USER_TX ──► [8 lanes × 8 × tb3d_encode] ──► M_AXIS_GTY_TX ──► GTYP serial
        │                                                                     │
M_AXIS_USER_RX ◄── [8 lanes × 8 × tb3d_decode] ◄── S_AXIS_GTY_RX ◄── GTYP serial
```

**Interface Summary**

| Interface | Clock | Width | Purpose |
|-----------|-------|-------|---------|
| `S_AXI_CTRL` | axi_clk | AXI4-Lite 32-bit | Orchestrator control (codec enable, lane enable bank, lane status CSR) |
| `S_AXIS_USER_TX` | gty_clk | 512-bit TDATA | Binary data IN before encoding |
| `M_AXIS_GTY_TX` | gty_clk | 512-bit TDATA | TB3D-encoded data to GTYP TX |
| `S_AXIS_GTY_RX` | gty_clk | 512-bit TDATA | TB3D-encoded data from GTYP RX |
| `M_AXIS_USER_RX` | gty_clk | 512-bit TDATA | Decoded binary data OUT |
| `S_GTY_STATUS` | gty_clk | 8-bit each | Per-lane `LOCKED` and `ERROR` raw outputs |

**S_AXI_CTRL CSR Map** (5-bit word address):

| Offset | Register | Access | Description |
|--------|----------|--------|-------------|
| 0x00 | CTRL | R/W | `[0]`=global codec enable, `[8:1]`=lane enable mirror |
| 0x04 | STATUS | RO | `{lane_err[7:0], lane_lock[7:0]}` |
| 0x08 | LANE_EN | R/W | Per-lane enable bits `[7:0]` |
| 0x0C | LANE_LOCK | RO | Per-lane lock status `[7:0]` |
| 0x10 | LANE_ERR | RO | Per-lane error flags `[7:0]` |

**Clock Domain Crossing (CDC)**:
- `axi_clk → gty_clk`: 2-FF synchronizers on `codec_enable` and `lane_enable[7:0]`
- `gty_clk → axi_clk`: 2-FF synchronizers on `lane_locked[7:0]` and `lane_error[7:0]`

---

### 2.3 `tb3d_microblaze_module.v` — Cache-Aware Orchestration (200 MHz)

Provides low-latency, cache-aware chunk orchestration using an embedded
MicroBlaze CPU with L2 cache.

| Interface | Direction | Purpose |
|-----------|-----------|---------|
| `S_AXI_CTRL` | Slave | Orchestrator configures DDR ops, reads perf counters |
| `M_AXI` | Master | DDR4 reads/writes via Versal PL-to-PS interconnect |
| `UART` | I/O | Debug console (telemetry) |

**S_AXI_CTRL CSR Map** (5-bit word address, `mb_clk` domain):

| Offset | Register | Access | Description |
|--------|----------|--------|-------------|
| 0x00 | CTRL | R/W | `[0]`=start_op (pulse), `[1]`=flush_cache, `[2]`=prefetch_en |
| 0x04 | STATUS | RO | `[0]`=ready, `[1]`=busy, `[31:2]`=cache stats |
| 0x08 | DDR_ADDR_LO | R/W | Lower 32-bit of target DDR address |
| 0x0C | DDR_ADDR_HI | R/W | Upper 32-bit of target DDR address |
| 0x10 | DDR_LEN | R/W | Burst length in bytes (cache-line aligned) |
| 0x14 | PERF_HITS | RO | L2 cache hit counter |
| 0x18 | PERF_MISS | RO | L2 cache miss counter |
| 0x1C | PERF_LAT | RO | Average DDR latency in ns (placeholder) |

---

### 2.4 `tb3d_axi_bridge_module.v` — System Integration (200 MHz)

The AXI bridge connects TB3-D to the Versal NoC and exposes system-visible
CSR registers and a DMA master for system memory access.

| Interface | Direction | Purpose |
|-----------|-----------|---------|
| `S_AXI` | Slave | NoC → CSR register access (system reads TB3-D status) |
| `M_AXI_DMA` | Master | DMA operations to DDR4 via Versal interconnect |
| `M_ORCH_CTRL` | Output | CSR config values pushed to orchestrator |
| `M_ORCH_CTRL` | Input | Status from orchestrator stored in CSR for system read |

---

## 3. Clock Domains & CDC

| Domain | Freq | Source | Modules |
|--------|------|--------|---------|
| `axi_clk` | 200 MHz | Clocking Wizard | Orchestrator, AXI Bridge, GTY Codec (ctrl) |
| `mb_clk` | 200 MHz | Same or dedicated output | Microblaze Module |
| `gty_clk` | 250 MHz | GTY REFCLK | GTY Codec (data path) |

**CDC Crossings:**

| Crossing | Method | Signals |
|----------|--------|---------|
| `axi_clk → gty_clk` | 2-FF sync (inside GTY codec) | codec_enable, lane_enable[7:0] |
| `gty_clk → axi_clk` | 2-FF sync (inside GTY codec) | lane_locked[7:0], lane_error[7:0] |
| `axi_clk → mb_clk` | AXI Clock Converter (Vivado IP) | M_AXI_MB_CTRL interface bus |
| `mb_clk → axi_clk` | AXI Clock Converter (Vivado IP) | M_AXI_MB_CTRL response bus |

> **Note**: Because `M_AXI_MB_CTRL` (orchestrator, axi_clk) connects to
> `S_AXI_CTRL` (MB module, mb_clk) across clock domains, insert a Vivado
> **AXI4-Lite Clock Converter** between them in the block design.

---

## 4. Address Space

| Base Address | Size | Module | Interface | Purpose |
|-------------|------|--------|-----------|---------|
| `0x4000_0000` | 64 KB | AXI Bridge | `S_AXI` | CSR registers (codec config & status) |
| `0x4001_0000` | 64 KB | AXI Bridge | `S_AXI` | DMA descriptor queue (reserved) |
| `0x5000_0000` | 16 MB | Microblaze Module | `M_AXI` | DDR access window + L2 cache |
| `0x6000_0000` | 64 KB | GTY Codec | `S_AXI_CTRL` | Per-lane codec control/status |

---

## 5. Interface Connection Map (Vivado Block Design)

```
                ┌─────────────────────────────────────────────────────────────┐
Versal CIPS     │  FPD_CCI_NOC[0:3] ──► AXI NoC ──► AXI Bridge (S_AXI)      │
                │  LPD_AXI_NOC_0    ──► AXI NoC                               │
                └─────────────────────────────────────────────────────────────┘

AXI Bridge ──► M_ORCH_CTRL ──► orchestrator (as raw bundle, axi_clk)
AXI Bridge     M_AXI_DMA   ──► AXI SmartConnect / NoC ──► DDR4

Orchestrator   S_AXI        ◄── AXI SmartConnect ◄── AXI NoC (config path)
Orchestrator   M_AXI_DMA    ──► AXI SmartConnect ──► DDR4
Orchestrator   M_AXI_GTY_CTRL ──► GTY Codec (S_AXI_CTRL)  [same axi_clk]
Orchestrator   M_AXI_MB_CTRL  ──► [AXI CLK CONVERTER] ──► MB Module (S_AXI_CTRL)
Orchestrator   M_AXI_AXB_CTRL ──► AXI Bridge (reserved / future status push)
Orchestrator   S_GTY_STATUS   ◄── GTY Codec (lane_locked, lane_error)

GTY Codec      S_AXIS_USER_TX ◄── user logic / DMA MM2S (512-bit)
GTY Codec      M_AXIS_GTY_TX  ──► GTYP TX (8 × 64-bit lanes)
GTY Codec      S_AXIS_GTY_RX  ◄── GTYP RX (8 × 64-bit lanes)
GTY Codec      M_AXIS_USER_RX ──► user logic / DMA S2MM (512-bit)

MB Module      M_AXI           ──► AXI SmartConnect ──► DDR4
MB Module      UART            ──► UART0 (debug console)
```

---

## 6. Step-by-Step Vivado Block Design Walkthrough

### Step 0 — Project Setup

```tcl
create_project -force tb3d_vp1802 /path/to/project -part xcvp1802-lsvc4072-2MP-e-S
set_property BOARD_PART xilinx.com:vpk180:part0:1.2 [current_project]
add_files [glob /path/to/rtl/tb3d_*.v]
update_compile_order -fileset sources_1
create_bd_design tb3d_design
```

---

### Step 1 — Add Versal CIPS

**IP → Versal CIPS**

Key settings:
```
PS_USE_FPD_CCI_NOC  → 1   (connect PS to NoC)
PS_USE_NOC_LPD_AXI0 → 1
PS_UART0_PERIPHERAL → Enabled (PMC_MIO 42:43) ← debug UART
PS_I2C0_PERIPHERAL  → Enabled (if used)
```

---

### Step 2 — Add AXI NoC

**IP → AXI NoC v1.1**

```
Number of AXI Slave Ports  → 6  (S00–S05 from CIPS FPD/LPD + DMA masters)
Number of AXI Master Ports → 1  (optional, for CIPS M_AXI)
Memory Controller          → LPDDR4 × 2 channels
```

Assign memory address: `0x0000_0000 – 0x7FFF_FFFF` (2 GB LPDDR4)

---

### Step 3 — Clocking Wizard

**IP → Clocking Wizard**

| Output | Frequency | Purpose |
|--------|-----------|---------|
| `clk_out1` | 200 MHz | `axi_clk` (orchestrator, bridge, GTY ctrl) |
| `clk_out2` | 200 MHz | `mb_clk` (Microblaze module) — can match axi_clk |

- Input: board 100 MHz reference
- Connect `locked` to reset synchronizer `dcm_locked`

---

### Step 4 — Processor System Reset (×2)

**IP → Processor System Reset**

**rst_axi_200m:**
- `slowest_sync_clk` → clk_out1 (200 MHz)
- `ext_reset_in` → reset button (active-low)
- `peripheral_aresetn` → `axi_rst_n` for orchestrator, bridge, GTY codec ctrl

**rst_mb_200m:**
- `slowest_sync_clk` → clk_out2 (200 MHz)
- `ext_reset_in` → reset button
- `peripheral_aresetn` → `mb_rst_n` for MB module

---

### Step 5 — Add TB3-D Custom Modules

In the block design, **Add Module** for each of the four RTL files:

#### 5a. `tb3d_orchestrator`

Vivado will expose all annotated interfaces as bubble ports:

| Port visible in BD | Connect to |
|--------------------|------------|
| `S_AXI` | AXI SmartConnect → AXI NoC slave |
| `M_AXI_DMA` | AXI SmartConnect → NoC → DDR4 |
| `M_AXI_GTY_CTRL` | `tb3d_gty_transceiver_codec.S_AXI_CTRL` |
| `M_AXI_MB_CTRL` | AXI4-Lite Clock Converter → `tb3d_microblaze_module.S_AXI_CTRL` |
| `M_AXI_AXB_CTRL` | `tb3d_axi_bridge_module` (future, tie-off for now) |
| `S_GTY_STATUS` | `tb3d_gty_transceiver_codec.S_GTY_STATUS` |
| `axi_clk` | clk_out1 (200 MHz) |
| `axi_rst_n` | rst_axi_200m.peripheral_aresetn |
| `mb_clk` | clk_out2 (200 MHz) |
| `mb_rst_n` | rst_mb_200m.peripheral_aresetn |
| `gty_clk` | GTY REFCLK (250 MHz external input) |
| `gty_rst_n` | rst_axi_200m.peripheral_aresetn (or dedicated GTY reset) |

#### 5b. `tb3d_gty_transceiver_codec`

| Port visible in BD | Connect to |
|--------------------|------------|
| `S_AXI_CTRL` | `tb3d_orchestrator.M_AXI_GTY_CTRL` |
| `S_AXIS_USER_TX` | User logic or DMA MM2S output (512-bit) |
| `M_AXIS_GTY_TX` | Versal GTYP TX data input (8 × 64-bit mux) |
| `S_AXIS_GTY_RX` | Versal GTYP RX data output (8 × 64-bit mux) |
| `M_AXIS_USER_RX` | User logic or DMA S2MM input (512-bit) |
| `S_GTY_STATUS` | `tb3d_orchestrator.S_GTY_STATUS` |
| `gty_clk` | GTY REFCLK / RXUSRCLK |
| `gty_rst_n` | GTY reset |
| `axi_clk` | clk_out1 (200 MHz) |
| `axi_rst_n` | rst_axi_200m.peripheral_aresetn |

#### 5c. `tb3d_microblaze_module`

| Port visible in BD | Connect to |
|--------------------|------------|
| `S_AXI_CTRL` | AXI4-Lite Clock Converter ← `tb3d_orchestrator.M_AXI_MB_CTRL` |
| `M_AXI` | AXI SmartConnect → NoC → DDR4 (address: `0x5000_0000`) |
| `UART` | UART IO (board UART pins) |
| `mb_clk` | clk_out2 (200 MHz) |
| `mb_rst_n` | rst_mb_200m.peripheral_aresetn |

> **Important**: Insert **IP → AXI4-Lite Clock Converter** between
> `orchestrator.M_AXI_MB_CTRL` and `microblaze_module.S_AXI_CTRL` only
> if `mb_clk ≠ axi_clk`.  If both run at 200 MHz from the same PLL output,
> a clock converter is not needed.

#### 5d. `tb3d_axi_bridge_module`

| Port visible in BD | Connect to |
|--------------------|------------|
| `S_AXI` | AXI SmartConnect ← AXI NoC (system CSR path, `0x4000_0000`) |
| `M_AXI_DMA` | AXI SmartConnect → NoC → DDR4 |
| `M_ORCH_CTRL` | `tb3d_orchestrator` raw bundle (connect matching signals) |
| `axi_clk` | clk_out1 (200 MHz) |
| `axi_rst_n` | rst_axi_200m.peripheral_aresetn |

---

### Step 6 — AXI Clock Converter (if mb_clk ≠ axi_clk)

**IP → AXI4-Lite Clock Converter**

```
M_AXI_CLK   → clk_out1 (axi_clk, orchestrator domain)
S_AXI_CLK   → clk_out2 (mb_clk, MB module domain)
```

Connect:
- Left side (M): `orchestrator.M_AXI_MB_CTRL`
- Right side (S): `microblaze_module.S_AXI_CTRL`

---

### Step 7 — Address Editor

Open **Window → Address Editor** and assign:

| Module / Slave | Base Address | Range |
|----------------|-------------|-------|
| `axi_bridge.S_AXI` | `0x4000_0000` | 128 KB |
| `orchestrator.S_AXI` | (optional direct access) | 64 KB |
| `microblaze_module.M_AXI` | `0x5000_0000` | 256 MB |
| `axi_bridge.M_AXI_DMA` | `0x0000_0000` | 2 GB |
| `orchestrator.M_AXI_DMA` | `0x0000_0000` | 2 GB |
| `orchestrator.M_AXI_GTY_CTRL` | auto (local, small) | 64 B |
| `orchestrator.M_AXI_MB_CTRL` | auto (local, small) | 64 B |

---

### Step 8 — Constraints

Create `constraints/tb3d_vp1802.xdc`:

```xdc
# System clock (100 MHz board reference)
create_clock -period 10.000 -name sys_clk_100 [get_ports sys_clk_p]

# GTY reference clock (250 MHz differential)
create_clock -period 4.000  -name gty_ref_clk [get_ports gty_refclk_p]

# False paths on GTY status (2-FF synchronized in RTL, Vivado can ignore)
set_false_path -through [get_nets -hierarchical *lane_locked_sync*]
set_false_path -through [get_nets -hierarchical *lane_error_sync*]
set_false_path -through [get_nets -hierarchical *codec_en_sync*]
set_false_path -through [get_nets -hierarchical *lane_en_sync*]

# UART (adjust package pin for your board)
# set_property PACKAGE_PIN <loc> [get_ports uart_tx]
```

---

### Step 9 — Validate & Generate

```tcl
validate_bd_design
regenerate_bd_design
write_bd_tcl -force tb3d_design_script.tcl
```

**Expected validation result**: Warnings about undriven optional ports are
acceptable (e.g., `M_AXI_AXB_CTRL` is tied off).  Errors about missing clocks
or unconnected required interfaces must be resolved.

---

### Step 10 — Synthesis & Implementation

```tcl
launch_runs synth_1 -jobs 4
wait_on_run synth_1

launch_runs impl_1 -jobs 4
wait_on_run impl_1

open_run impl_1
report_timing_summary -file timing_summary.rpt
```

Expected timing:
- **WNS > 0** across all clock domains
- Critical path likely through orchestrator AXI master FSM → GTY codec

If timing fails, try:
1. Reduce mb_clk or gty_clk frequencies slightly
2. Add pipeline stage to GTY AXI-Stream interface

---

### Step 11 — Bitstream & Programming

```tcl
launch_runs impl_1 -to_step write_bitstream -jobs 4
wait_on_run impl_1
# Output: tb3d_design.bit
```

---

## 7. Functional Verification Sequence

Once the bitstream loads on the VPK180:

1. **Check GTY lock** — Read orchestrator CSR `GTY_LOCK` (offset 0x08):  
   All 8 bits should be `1` after transceivers come online.

2. **Enable codec** — Write orchestrator CSR `CONTROL` (offset 0x00):  
   `0x0000_0003` → global_en=1, codec_en=1

3. **Verify orchestrator propagates enable** — The AXI master FSM inside
   `tb3d_orchestrator` will detect `csr_control[1]` changed and issue a write
   to `M_AXI_GTY_CTRL` (GTY codec CTRL register, 0x00) setting bit[0]=1.

4. **Inject a test vector** — Push 512-bit data to `S_AXIS_USER_TX`.
   Read back from `M_AXIS_USER_RX` and verify TB3-D encode→decode round-trip.

5. **Read MB performance counters** — Via orchestrator `M_AXI_MB_CTRL` read
   (AR path): read PERF_HITS (0x14) and PERF_MISS (0x18).

6. **UART telemetry** — Connect to the VPK180 USB-UART and observe MB debug
   output at the configured baud rate.

---

## 8. File Reference

```
platform_driver/
├── rtl/
│   ├── tb3d_orchestrator.v           ← Master coordinator; all 3 AXI masters + S_AXI + M_AXI_DMA
│   ├── tb3d_gty_transceiver_codec.v  ← 8-lane × 64-bit GTY codec; S_AXI_CTRL + 4 AXIS ports
│   ├── tb3d_microblaze_module.v      ← MB subsystem; S_AXI_CTRL + M_AXI (DDR) + UART
│   ├── tb3d_axi_bridge_module.v      ← NoC bridge; S_AXI + M_AXI_DMA + M_ORCH_CTRL
│   ├── tb3d_axi_csr_slave.v          ← AXI4-Lite CSR register bank (used inside bridge)
│   ├── tb3d_encode.v                 ← TB3-D nibble encoder (combinational)
│   ├── tb3d_decode.v                 ← TB3-D nibble decoder (combinational)
│   └── tb3d_transcoder.v             ← Combined encode/decode wrapper
├── docs/
│   ├── ARCHITECTURE_AND_WALKTHROUGH.md  ← This file
│   ├── VERSAL_ARCHITECTURE.md           ← Platform reference
│   ├── ADDRESS_SPACE_SOLUTION.md        ← Address map details
│   └── VIVADO_INTEGRATION_GUIDE.md      ← Legacy guide (see this file for current)
├── constraints/
│   └── tb3d_vp1802.xdc              ← Timing + pin constraints (create this)
└── design_1.tcl                     ← Existing block design TCL (update as needed)
```

---

## 9. Known Limitations & Next Steps

| Area | Current State | Next Step |
|------|--------------|-----------|
| `M_AXI_AXB_CTRL` | Tied off (no drive logic) | Implement status push to bridge CSR |
| `M_AXI_DMA` (orchestrator) | Tied off | Connect TB3-D bulk data engine |
| `M_AXI_DMA` (bridge) | Tied off | Implement DMA descriptor queue |
| GTY physical pins | Status tied to constants | Connect to Vivado GT Wizard IP |
| CDC FIFOs | Placeholder comments | Instantiate Xilinx FIFO Generator in async mode |
| MB UART | Stub (idle) | Instantiate AXI UART16550 IP |

---

*Document generated from source as of interface refactor: 8-lane × 64-bit GTY path, full S_AXI_CTRL on all sub-modules, M_AXI_GTY_CTRL / M_AXI_MB_CTRL / M_AXI_AXB_CTRL on orchestrator.*
