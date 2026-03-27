# Vivado IP Integrator Block Design — TB3D Platform Driver Setup

## Overview

This guide walks you through building the TB3D Versal 1802 block design from scratch using Vivado 2025.2 IP Integrator (IPI). The design comprises:

1. **Versal CIPS** — Platform configuration (CPU, NoC, clock generation)
2. **AXI NoC** — Network-on-Chip for multi-master arbitration
3. **Microblaze Subsystem** — Soft CPU for cache-aware orchestration
4. **TB3D Modules** — Orchestrator + 3 sub-modules (AXI Bridge, MB module, GTY codec)
5. **Clock & Reset Generation** — Multiple clock domains with synchronization
6. **DDR4 Memory** — Accessed via "your" current design

---

## Strategy: "NoC First, Then Build Down"

As you mentioned, your approach is:
1. **Place NoC + CIP (PS) first** ← Foundation
2. **Add Microblaze** with cache enabled (64-bit, frequency-enhanced)
3. **Build bridge in between** ← TB3D modules go here
4. **Run through the gauntlet** (bitstream generation)
5. **Tweak later** once working

This guide follows that exact pattern.

---

## Step 0: Project Setup

```tcl
# In Vivado Tcl Console:
create_project -force tb3d_platform /path/to/project -part xcvp1802-lsvc4072-2MP-e-S
set_property BOARD_PART xilinx.com:vpk180:part0:1.2 [current_project]
create_bd_design tb3d_design
```

Alternatively: Use the existing `design_1.tcl` as a starting point and update it.

---

## Step 1: Add Versal CIPS (Platform Configuration)

**IP → Versal CIPS**

Key Configuration:
```
PS_I2C0_PERIPHERAL     → Enabled (PMC_MIO 46..47)
PS_I2C1_PERIPHERAL     → Enabled (PMC_MIO 44..45)
PS_ENET0_PERIPHERAL    → Enabled (PMC_MIO 0..11) — Ethernet
PS_UART0_PERIPHERAL    → Enabled (PMC_MIO 42..43) — Debug console
PS_USB3_PERIPHERAL     → Enabled if needed
PS_SD1_PERIPHERAL      → Enabled if needed
PS_USE_M_AXI_FPD       → 0 (don't expose PS M_AXI)
PS_USE_S_AXI_FPD       → 0 (don't expose PS S_AXI)
PS_USE_FPD_CCI_NOC     → 1 (connect CSS to NoC)
PS_USE_NOC_LPD_AXI0    → 1 (LPD also to NoC)
PS_PCIE_RESET          → Enable (if using PCIe later)
```

**Clocking**:
- Let Versal CIPS output its native clocks (handled automatically)
- Your clocking wizard will synchronize these

---

## Step 2: Add AXI NoC (Multi-Master Interconnect)

**IP → AXI NoC v1.1**

Key Configuration:
```
Number of AXI Slave Ports     → 6 (S00–S05)
Number of AXI Master Ports    → 1 (M00, optional)
Clock for AXI Slave Ports     → axi_clk (200 MHz from clocking wizard)
AXI Slave Datawidth           → 128-bit (FPD) or 32-bit (LPD)
Memory Interface
  ├─ CH0_LPDDR4_0 → LPDDR4 Channel 0
  └─ CH1_LPDDR4_0 → LPDDR4 Channel 1
sys_clk0                       → LPDDR4 reference clock (800 MHz diff input)
```

**Address Configuration** (in IP Integrator Address Editor):
- Leave auto-assignment off for now (we'll manually assign NoC slaves)

---

## Step 3: Add Clocking Wizard

**IP → Clocking Wizard**

Generate:
- **Input**: 100 MHz (from board)
- **Output clk_out1**: 200 MHz (for axi_clk)
- **Output clk_out2** (optional): 125 MHz (if MB needs separate clock)

Lock the output frequencies via HDL instantiation or IP GUI.

---

## Step 4: Add Reset Synchronizers

**IP → Processor System Reset (×2)**

**rst_clk_wiz_200m**:
```
Slowest sync clk → clk_out1 (200 MHz from clocking wizard)
Ext reset input   → System reset button (active-low)
Output: peripheral_aresetn → axi_clk reset domain
```

**rst_noc_clk_gen_300m**:
```
Slowest sync clk → noc_clk_gen.axi_clk_0
Ext reset input   → MDM debug reset or system reset
Output: bus_struct_reset → Microblaze and hierarchies
Output: mb_reset → Microblaze CPU reset
```

---

## Step 5: Add Microblaze Subsystem

**IP → Microblaze (choose preset: "no cache" or "with L2 cache")**

Configuration:
```
Processor
  ├─ Frequency           → 200 MHz (same as AXI can fine-tune later)
  ├─ Data Cache Depth    → 32 KB (or higher for more throughput)
  ├─ Instr Cache Depth   → 32 KB
  ├─ L2 Cache            → ENABLED (critical for zero-latency goal)
  ├─ L2 Cache Size       → 64 KB (default, sufficient)
  ├─ Use MMU             → Optional (for OS support, skip for bare-metal)
  └─ Write Back Cache    → ON (default, matches your preference)

Local Memory Bus (LMB)
  ├─ Instruction LMB     → 32 KB BRAM
  ├─ Data LMB            → 32 KB BRAM
  └─ Cache Enable        → Yes

Debug Module             → Include MDM (Management Direct access)
```

**Important**: The wizard will generate:
- `microblaze_0` — CPU
- `microblaze_0_local_memory` — Hierarchical cell with DLMB/ILMB + BRAM
- `mdm_0` — Debug interface (for probe signals)

---

## Step 6: Add TB3D Custom Modules

### Import RTL Sources

```tcl
# Add RTL to project
add_files [glob /path/to/rtl/tb3d_*.v]
update_compile_order -fileset sources_1
```

**Add to Block Design** (manually, via IP Catalog → Add RTL Module):

1. **tb3d_orchestrator** (top, instantiate once)
   ```
   Inputs:  axi_clk, mb_clk, gty_clk + resets
   Output:  s_axi_* (slave interface for SmartConnect)
   Output:  m_axi_dma_* (master, for system ops)
   I/O:     gty_* pins (GTY transceiver connections)
   ```

2. **tb3d_gty_transceiver_codec** (instantiate once, 512 lanes)
   ```
   Input:   gty_clk (250 MHz ref)
   I/O:     gty_rx_serial, gty_tx_serial (to GTY primitives)
   Output:  user_tx_ready, user_rx_valid, etc.
   ```

3. **tb3d_microblaze_module** (instantiate once)
   ```
   Input:   mb_clk
   Output:  m_axi_* (DDR4 interface)
   CSR in:  csr_* signals (from orchestrator)
   I/O:     uart_tx, uart_rx (debug console)
   ```

4. **tb3d_axi_bridge_module** (instantiate once)
   ```
   Input:   s_axi_* (from SmartConnect)
   Output:  csr_* (to orchestrator + sub-modules)
   CSR in:  status_* (from orchestrator)
   ```

---

## Step 7: Wiring (The Critical Part)

### Clock Tree

```
clk_100MHz (port input)
    ↓
[Clocking Wizard]
    ├─→ clk_out1 @ 200MHz
    │   ├→ [Versal CIPS] (axi_clk domain)
    │   ├→ [AXI NoC] (aclk0–aclk8 = all 200 MHz for simplicity)
    │   ├→ [tb3d_orchestrator.axi_clk]
    │   ├→ [tb3d_axi_bridge_module.axi_clk]
    │   └→ [rst_clk_wiz_200m.slowest_sync_clk]
    │
    └─→ clk_out2 @ 200MHz (or 125 MHz, your choice)
        └→ [Microblaze] + [tb3d_microblaze_module.mb_clk]
```

### Reset Tree

```
reset_rtl (port, active-low)
    ↓
[Processor System Reset]
    ├→ mb_reset             → microblaze_0.Reset
    ├→ bus_struct_reset     → LMB BRAM + hierarchies
    └→ peripheral_aresetn   → tb3d_orchestrator.axi_rst_n
```

### AXI Connectivity

```
Versal CIPS Outputs:
  ├─ FPD_CCI_NOC_0 → AXI NoC S00_AXI
  ├─ FPD_CCI_NOC_1 → AXI NoC S01_AXI
  ├─ FPD_CCI_NOC_2 → AXI NoC S02_AXI
  ├─ FPD_CCI_NOC_3 → AXI NoC S03_AXI
  ├─ LPD_AXI_NOC_0 → AXI NoC S04_AXI
  └─ PMC_NOC_AXI_0 → AXI NoC S05_AXI

AXI NoC:
  └─ M00_AXI → (future: tie to external DMA master, or leave unconnected)

Microblaze DDR:
  ├─ AXI M_AXI (from Microblaze) → can tie to separate DDR controller
  │  Or route through architecture like:
  │    Microblaze → [AXI SmartConnect] → Versal CIPS.M_AXI_FPD → DDR

TB3D Integration:
  └─ [tb3d_axi_bridge_module.s_axi_*] ← Must connect to AXI NoC
     └─ tb3d_orchestrator propagates all CSR + clock signals internally
```

---

## Step 8: Address Allocation (Critical!)

In **Vivado Address Editor** (`Window → Address Editor`):

```
tb3d_axi_bridge_module/csr_slave_inst:
  Base Address:      0x4000_0000
  Range:             0x0001_0000 (64 KB)
  Status:            (should show no conflicts)

Versal CIPS:
  PS7 LPD:           0x1000_0000
  PS7 FPD:           0x8000_0000
  ... (auto-assigned, don't touch)

Microblaze M_AXI:    0x0000_0000 (full 4 GB addressable)
```

**Key Check**: No overlapping ranges. If you see "Excluded" addresses, there's a conflict → fix address assignments.

---

## Step 9: Validate & Generate

**Vivado Flow:**

```tcl
# In Vivado Tcl:
validate_bd_design

# Check for warnings/errors
# Expected: Some warnings about unconnected optional ports (OK)
# Expected: Some CDC warnings if crossing clocks unsynchronously (check)

# Generate synthesis/sim files
regenerate_bd_design
write_bd_tcl -force tb3d_design_script.tcl
```

**Resolution**: If errors occur:
- Check clock domain assignments (should be clear from step 7)
- Verify AXI address ranges (no overlaps)
- Ensure all required interface connections made

---

## Step 10: Constraint File

Create `tb3d_constraints.xdc`:

```xdc
# Clock inputs
create_clock -period 10.0 -name clk_100MHz [get_ports clk_100MHz]

# LPDDR4 clock (example, adjust for your board)
create_clock -period 2.5 -name lpddr4_clk_p [get_ports lpddr4_clk1_p]

# GTY reference clock (if using external clock)
create_clock -period 4.0 -name gty_ref_clk [get_ports gty_ref_clk_p]

# I/O pin locations (example for Versal VPK180 eval board)
# Adjust based on your actual pinout mapping
set_property PACKAGE_PIN <loc> [get_ports clk_100MHz]
set_property PACKAGE_PIN <loc> [get_ports reset_rtl]
set_property PACKAGE_PIN <loc> [get_ports uart_tx]
set_property PACKAGE_PIN <loc> [get_ports uart_rx]
```

---

## Step 11: RTL Synthesis & Implementation

```tcl
# Launch flow
launch_runs synth_1 -jobs 4
wait_on_run synth_1

launch_runs impl_1 -jobs 4
wait_on_run impl_1

# Check timing
open_run impl_1
report_timing_summary
```

**Timing Expected**:
- **Slack**: > 0 ns everywhere (negative slack = timing violation)
- **Critical Path**: Likely through orchestra→GTY codec or AXI arbitration
- **If fails**: Add pipeline stages in orchestrator CDC FIFOs or reduce mb_clk frequency

---

## Step 12: Bitstream Generation

```tcl
launch_runs impl_1 -to_step write_bitstream -jobs 4
```

Output: `tb3d_design.bit` (ready to load on board)

---

## Troubleshooting Checklist

| Issue | Cause | Fix |
|-------|-------|-----|
| "AXI address conflicts" | Multiple slaves auto-assigned overlapping ranges | Use orchestrator as single slave (already done) |
| "CDC metastability warnings" | Clock crossing not synchronized | Check async FIFO CDC in orchestrator (verify during simulation) |
| "Timing failed" | Critical path too long | Reduce frequency or add pipeline stages |
| "Microblaze won't respond" | Clock not connected or reset asserted | Check clock tree (step 7) |
| "GTY lanes not locking" | Transceiver config wrong | Ensure GTY wizard config matches bandwidth |

---

## Next: Functional Verification

Once bitstream loads:

1. **Load firmware** to Microblaze (bare-metal or XSDK app)
2. **Enumerate CSR registers** (read VERSION @ 0x4000_0008)
3. **Check GTY lock status** (read GTY_LOCK registers)
4. **Run test vectors** (encode/decode through CSR)
5. **Monitor performance** (UART debug console from Microblaze)

---

## Files You'll Need

```
/home/smartscott/platform_driver/
├── rtl/
│   ├── tb3d_orchestrator.v
│   ├── tb3d_axi_csr_slave.v
│   ├── tb3d_microblaze_module.v
│   ├── tb3d_axi_bridge_module.v
│   ├── tb3d_gty_transceiver_codec.v
│   ├── tb3d_encode.v
│   ├── tb3d_decode.v
│   └── tb3d_transcoder.v
├── docs/
│   ├── VERSAL_ARCHITECTURE.md (reference)
│   ├── ADDRESS_SPACE_SOLUTION.md (reference)
│   └── PHASE_1_SUMMARY.md (reference)
└── constraints/
    └── tb3d_constraints.xdc (create this)
```

---

## Decision Points (Scott, Final Confirmation Needed)

Before you start in Vivado:

1. **GTY Transceiver Protocol**: Confirmed → **NRZ** (not PAM4) ✓
2. **Microblaze Clock**: Confirmed → **200 MHz** (same as AXI, default) ✓
3. **L2 Cache Write Policy**: Confirmed → **Write-Back** (default) ✓
4. **LPDDR4 Frequency**: Do you want default board speed, or override?
5. **GTY Lanes**: Confirmed → **512 GTYP lanes**, organized in 16 groups of 32 ✓

---

**Status**: Ready to build in Vivado. This guide will be your step-by-step reference as you assemble the block design. All RTL is ready. All architecture is locked.

Let me know when you're ready to start the Vivado flow! 🚀
