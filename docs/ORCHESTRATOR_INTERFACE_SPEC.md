# TB3-D Orchestrator Interface Specification

**Project:** TB3-D Platform Driver — Versal VPK180  
**Purpose:** Define the AXI4-Lite master interface for the Orchestrator to control codec and transceiver modules  
**Version:** 1.0  
**Date:** 2026-03-28

---

## Executive Summary

The **Orchestrator** is the system "brain" (MicroBlaze-based) that:
- Boots early in the PMC lifecycle (before ARM processors)
- Controls all TB3-D intercept modules via AXI4-Lite masters
- Manages transceiver DRP (Dynamic Reconfiguration Port) for line-rate/PLL changes
- Returns control to ARM processors only after TB3-D infrastructure is initialized
- Monitors per-lane status (lock, errors) and can dynamically adjust encoding

---

## Architecture Overview

```
PMC (Platform Management Controller)
  │
  └─→ [MicroBlaze Orchestrator]
       │
       ├─→ [M_AXI_GTY: AXI4-Lite Master] → S_AXI_CTRL (GTY Codec)
       ├─→ [M_AXI_PCIe: AXI4-Lite Master] → S_AXI_CTRL (PCIe Codec)
       ├─→ [M_AXI_AEB: AXI4-Lite Master] → S_AXI_CTRL (AEB Codec)
       ├─→ [M_AXI_CSR: AXI4-Lite Master] → CSR Slave (shared config)
       └─→ [UART: RS-232] ← Boot console
       │
       ├─ DRP Controller (for transceiver reconfiguration)
       └─ Status/Interrupt Monitor (for lane lock/error)
```

---

## 1. AXI4-Lite Master Bus Specification

### Clock & Reset
- **Clock:** `axi_clk` @ 200 MHz
- **Reset:** `axi_rst_n` (active-low)
- **Handshake:** Standard AXI4-Lite write and read transactions

### Address Space per Codec Module

Each codec (GTY, PCIe, AEB) exposes the same **control register map** at a different base address:

| Module | Base Address | Notes |
|--------|--------------|-------|
| **GTY Codec** | `0x0000_0000` | GTYP RX/TX in-wire intercept |
| **PCIe Codec** | `0x0000_1000` | PCIe link intercept |
| **AEB Codec** | `0x0000_2000` | AXI Expansion Bridge codec |

---

## 2. Control Register Map (Per-Codec CSR Slave)

All addresses are **byte offsets** within the codec's CSR space.

### Register Layout

```
Offset  Name         R/W   Bits   Description
──────  ────────────────────────────────────────────────────
0x00    CTRL         RW    31:0   Main control register
0x04    STATUS       RO    31:0   Per-lane status (lock, error)
0x08    LANE_EN      RW    31:0   Per-lane enable mask
0x0C    DRP_ADDR     RW    31:0   DRP address for reconfiguration
0x10    DRP_RDATA    RO    31:0   DRP read data (debug)
0x14    STAT_LOCK    RO    31:0   Lane lock counter (debug)
0x18    STAT_ERROR   RO    31:0   Lane error counter (debug)
0x1C    VERSION      RO    31:0   Codec firmware version
```

---

### 2.1 CTRL Register (0x00) — Main Configuration

```
Bit   Name         R/W   Default   Description
───   ──────────────────────────────────────────────
[0]   CODEC_EN     RW    1'b0      Master enable (1=active, 0=pass-through)
[1]   DRP_EN       RW    1'b0      DRP controller enable
[2]   STAT_RST     WO    1'b0      Reset error/lock counters
[3]   BYPASS_MODE  RW    1'b0      Codec data bypass (debug mode)
[4]   IRQ_EN       RW    1'b0      Enable interrupt on lane error
[5]   LP_MODE      RW    1'b0      Low-power mode (reduces switching)
[31:6] RESERVED   RO     26'b0
```

**Example:** Enable GTY codec in normal mode:
```
Write 0x00 with data = 0x00000001
```

---

### 2.2 STATUS Register (0x04) — Read-Only Per-Lane Status

For **NUM_LANES = 8**:

```
Bit Range   Name              Description
──────────  ──────────────────────────────────────────────
[7:0]       LANE_LOCKED[7:0]  Per-lane lock status (1=locked)
[15:8]      LANE_ERROR[7:0]   Per-lane error status (1=error detected)
[23:16]     LANE_STATE[7:0]   Per-lane health state (2-bit per lane)
[31:24]     RESERVED          
```

**Example:** Read GTY codec status:
```
Read 0x04 → returns 0xAA55_00FF
  LANE_LOCKED[7:0] = 8'b1111_1111 (all lanes locked)
  LANE_ERROR[7:0]  = 8'b0101_0101 (lanes 0,2,4,6 have errors)
```

---

### 2.3 LANE_EN Register (0x08) — Per-Lane Enable Mask

```
Bit Range   Name              Description
──────────  ───────────────────────────────────────
[7:0]       EN[7:0]           Enable mask (1=active, 0=disabled)
[31:8]      RESERVED
```

Use this to selectively activate/deactivate lanes (e.g., for dynamic reconfiguration):

```
Write 0x08 with data = 0x0000_00FF  // Enable lanes 0-7
Write 0x08 with data = 0x0000_00F0  // Disable lanes 0-3, keep 4-7
```

---

### 2.4 DRP_ADDR Register (0x0C) — Transceiver Reconfiguration Address

```
Bit Range   Name              Description
──────────  ───────────────────────────────────────
[9:0]       ADDR[9:0]         DRP address (GTYP spec)
[31:10]     RESERVED
```

The DRP port is driven by the codec's internal DRP controller. The Orchestrator can:
- Set this address to read/write transceiver configuration
- Use to change PLL multiplier, line rate, or encoding mode at runtime

**Example:** Address the RX equalizer register:
```
Write 0x0C with data = 0x0000_0091  // GTYP RX_EYEMASK3 register
```

---

### 2.5 DRP_RDATA Register (0x10) — DRP Read Data (Debug)

```
Bit Range   Name              Description
──────────  ───────────────────────────────────────
[15:0]      RDATA[15:0]       Last DRP read result
[31:16]     RESERVED
```

Read-only. Updated by the codec's internal DRP FSM. Use to verify transceiver state.

---

## 3. AXI4-Lite Write Transaction Sequence

To **enable the GTY codec remotely from the Orchestrator**:

```c
// Pseudo-code: Write CTRL register
axi4lite_write(
    awaddr = 0x0000_0000,      // CTRL register
    wdata  = 0x0000_0001,      // CODEC_EN = 1
    awprot = 3'b010,           // Non-privileged, non-secure
    wstrb  = 4'b1111           // All 4 bytes valid
);
// Transaction completes when bvalid asserts
```

---

## 4. AXI4-Lite Read Transaction Sequence

To **monitor lane status remotely**:

```c
// Pseudo-code: Read STATUS register
axi4lite_read(
    araddr = 0x0000_0004,      // STATUS register
    arprot = 3'b010
);
// Response arrives when rvalid asserts
// rdata contains per-lane lock/error bits
```

---

## 5. Orchestrator Master Port Specifications

The Orchestrator exposes **independent AXI4-Lite master ports** for each codec:

### Per-Codec Master Interface

| Port Name | Direction | Width | Notes |
|-----------|-----------|-------|-------|
| `m_axi_gty_awaddr[11:0]` | OUT | 12-bit | Write address (4K CSR space) |
| `m_axi_gty_awprot[2:0]` | OUT | 3-bit | Write protection |
| `m_axi_gty_awvalid` | OUT | 1-bit | Write addr valid |
| `m_axi_gty_awready` | IN | 1-bit | Codec ready for write addr |
| `m_axi_gty_wdata[31:0]` | OUT | 32-bit | Write data |
| `m_axi_gty_wstrb[3:0]` | OUT | 4-bit | Write strobes (byte enables) |
| `m_axi_gty_wvalid` | OUT | 1-bit | Write data valid |
| `m_axi_gty_wready` | IN | 1-bit | Codec ready for write data |
| `m_axi_gty_bresp[1:0]` | IN | 2-bit | Write response (0=OK) |
| `m_axi_gty_bvalid` | IN | 1-bit | Write response valid |
| `m_axi_gty_bready` | OUT | 1-bit | Orchestrator ready for response |
| `m_axi_gty_araddr[11:0]` | OUT | 12-bit | Read address |
| `m_axi_gty_arprot[2:0]` | OUT | 3-bit | Read protection |
| `m_axi_gty_arvalid` | OUT | 1-bit | Read addr valid |
| `m_axi_gty_arready` | IN | 1-bit | Codec ready for read addr |
| `m_axi_gty_rdata[31:0]` | IN | 32-bit | Read data |
| `m_axi_gty_rresp[1:0]` | IN | 2-bit | Read response |
| `m_axi_gty_rvalid` | IN | 1-bit | Read data valid |
| `m_axi_gty_rready` | OUT | 1-bit | Orchestrator ready for read data |

**Repeat for each codec:** `m_axi_pcie_*`, `m_axi_aeb_*`, etc.

---

## 6. Clock Domain Crossing

All codec CSR slaves operate in `axi_clk` (200 MHz). The Orchestrator also runs in `axi_clk`.

For data-plane signals (e.g., lane_locked, lane_error), the codec uses **2-FF synchronizers**:
```c
// Codec internally: gty_clk → axi_clk
reg [NUM_LANES-1:0] lk_s1, lk_s;  // 2-FF chain
always @(posedge axi_clk)
    { lk_s, lk_s1 } <= { lk_s1, lane_locked };
```

This ensures safe reads of per-lane status from the control domain.

---

## 7. Boot-Time Initialization Sequence

The **PMC wakes MicroBlaze early** (before ARM). The Orchestrator firmware should:

### Phase 1: Module Discovery (T0 + 100 ms)
```
1. Read VERSION register (0x1C) from each codec module
   - Confirms module presence and version
   - GTY codec → 0x0000_0001
   - PCIe codec → 0x0000_0002
   - AEB codec → 0x0000_0003
```

### Phase 2: Codec Initialization (T0 + 200 ms)
```
2. Clear any error counters
   Write CTRL[2]=1 (STAT_RST) to reset

3. Enable per-lane monitoring
   Write LANE_EN = 0xFF (all lanes active)

4. Enable codec in normal mode
   Write CTRL = 0x00000001 (CODEC_EN=1, DRP_EN=0)

5. Verify lock within 50 ms
   Poll STATUS register until LANE_LOCKED[7:0] == 0xFF
```

### Phase 3: Optional DRP Reconfiguration (T0 + 250 ms)
```
6. If custom line rate needed:
   Set CTRL[1]=1 (DRP_EN)
   Write DRP_ADDR with target register
   Codec DRP FSM drives the transceiver
   Monitor DRP_RDATA for completion
```

### Phase 4: Hand Over to ARM (T0 + 300 ms)
```
7. Once all codecs locked:
   Leave CTRL=0x00000001 (codecs stay active)
   Release MicroBlaze, wake ARM processors
   TB3-D language is now live on all intercept points
```

---

## 8. Error Handling

If a codec fails to lock within timeout:

```c
// Orchestrator firmware pseudo-code
if (LANE_LOCKED != 0xFF && timeout_ms > 50) {
    // Option 1: Retry with DRP reconfiguration
    // Option 2: Disable failed lanes (LANE_EN &= ~failed_mask)
    // Option 3: Fall back to pass-through (CTRL[3]=1, BYPASS_MODE)
}
```

---

## 9. Vivado IP-Integrator Integration

### Creating the Orchestrator Wrapper

In Vivado **IP-Integrator / Block Diagram**:

```
[MicroBlaze + AXI interconnect]
    |
    ├─→ M_AXI_GTY (200 MHz AXI4-Lite master)
    │    └─→ [GTY Codec S_AXI_CTRL slave]
    │         └─→ [AXIS RX/TX to GTY transceiver]
    │
    ├─→ M_AXI_PCIe (200 MHz AXI4-Lite master)
    │    └─→ [PCIe Codec S_AXI_CTRL slave]
    │
    └─→ M_AXI_AEB (200 MHz AXI4-Lite master)
         └─→ [AEB Codec S_AXI_CTRL slave]
```

**AXI Interconnect settings:**
- All slaves: AXI4-Lite mode
- Data width: 32-bit (not 64)
- Address width: 12-bit (4 KB per CSR space)
- Clock: axi_clk (200 MHz)

---

## 10. Verification Checklist

- [ ] Codec S_AXI_CTRL responds to reads/writes at correct addresses
- [ ] Per-lane lock bits assert within 50 ms of CODEC_EN
- [ ] Codec passes AXIS data unchanged when BYPASS_MODE=1
- [ ] DRP transactions can change PLL settings without system reset
- [ ] All interfaces follow AXI4-Lite handshake protocol (valid/ready)
- [ ] Clock domain crossings (gty_clk ↔ axi_clk) are glitch-free

---

## References

- Xilinx Versal ACAP GTYP Transceiver Data Sheet (AM009)
- Xilinx AXI4-Lite Slave Interface Specification
- Xilinx MicroBlaze Embedded Design Handbook (UG1579)
- TB3-D Codec RTL (rtl/tb3d_gty_transceiver_codec.v)
