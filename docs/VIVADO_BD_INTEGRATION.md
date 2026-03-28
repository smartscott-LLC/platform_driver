# Vivado Block Diagram Integration Guide
## TB3-D Codec as In-Wire Intercept

**Project:** Platform Driver — Versal VPK180  
**Purpose:** Step-by-step wiring of GTY codec in Vivado IP-Integrator  
**Complexity:** Intermediate (CDC/clock domain awareness required)  
**Time estimate:** 20–30 minutes

---

## Overview

This guide shows how to place the `tb3d_gty_transceiver_codec` module **in-wire** between the GTY transceiver bridge's raw TX/RX data ports and the NoC/system interconnect.

**Data flow:**
```
[GTY Transceiver IP]
    TXDATA → [S_AXIS_TX slave]  ┐
    RXDATA ← [M_AXIS_RX master] │ tb3d_gty_transceiver_codec
                                 │ (encoding/decoding happens here)
             [S_AXIS_RX slave]  │
             [M_AXIS_TX master] ┘
                    ↓
                [NoC / System]
```

---

## Prerequisites

1. **Vivado 2023.2+** with Versal support
2. **GTY Transceiver Bridge IP** already instantiated in your BD
   - Raw pass-through mode (not pre-encoded)
   - TXDATA/RXDATA ports exposed at 512-bit (8 lanes × 64-bit)
3. **tb3d_gty_transceiver_codec.v** compiled as an IP or RTL source
4. **Clocking architecture** already defined:
   - `gty_clk` @ 250 MHz (from GTYP TXOUTCLK or external ref)
   - `axi_clk` @ 200 MHz (from CIPS or separate PLL)

---

## Step 1: Add tb3d_gty_transceiver_codec to IP-Integrator

### 1.1 If RTL module (not packaged IP):

1. Right-click in BD canvas → **Add Modules** (or File → Add Sources)
2. Select `rtl/tb3d_gty_transceiver_codec.v`
3. Vivado auto-creates the IP wrapper
4. Module appears as **tb3d_gty_transceiver_codec** (parameterizable)

### 1.2 If pre-packaged as IP (recommended):

1. IP Catalog → Search "tb3d_gty"
2. Drag **tb3d_gty_transceiver_codec** into BD
3. Double-click to configure (usually defaults are fine):
   - `NUM_LANES = 8`
   - `LANE_W = 64`
   - `TOTAL_W = 512`

---

## Step 2: Clock & Reset Connections

The codec operates in **three independent clock domains**:

### 2.1 Data-Path Clocks (gty_clk domain)

**Source:** GTY transceiver reference clock

```
[GTY Transceiver Bridge]
  │
  ├─→ ch0_txoutclk ──→ {BUFG} ──→ gty_clk
  │    (or REFCLK ÷ ratio)
  │
  └─→ ch0_rxoutclk ──→ {same BUFG or mux}
```

Connect to codec:
- `gty_clk`: GTY output clock (250 MHz)
- `gty_rst_n`: Async active-low reset (from PMC or external reset controller)

**In BD:** Use a **Concat** block to invert PMC reset if needed:
```
[PMC rst] → NOT → gty_rst_n
```

### 2.2 Control-Path Clock (axi_clk domain)

**Source:** CIPS or separate PLL (typically 200 MHz)

Connect to codec:
- `axi_clk`: AXI control clock (200 MHz)
- `axi_rst_n`: Sync reset (from CIPS or reset controller)

### 2.3 DRP Clock (drp_clk)

**Most common:** Same as `axi_clk`

Connect to codec:
- `drp_clk`: DRP interface clock (can be `axi_clk` or `gty_clk`)
- `drp_rst_n`: Reset (same as `axi_clk` reset)

**In BD:**
```tcl
# Simple approach: tie DRP to AXI domain
connect_bd_net [get_bd_pins codec/drp_clk] [get_bd_pins axi_clk_source/clk_out1]
connect_bd_net [get_bd_pins codec/drp_rst_n] [get_bd_pins proc_sys_reset/interconnect_aresetn]
```

---

## Step 3: AXIS Data-Path Wiring

The codec sits **in-wire** on both RX and TX paths. Each AXIS interface handles 512 bits @ 250 MHz.

### 3.1 RX Data Path (GTY → Codec → System)

**GTY Transceiver Bridge output:**
```
ch0_rxdata[127:0]   (Quad 0, 2 lanes @ 64-bit each)
ch0_rxctrl[15:0]    (status/control bits)
ch0_rxvalid         (data valid)
ch0_rxready         (backpressure)
```

**Aggregate all lanes (0–7) into 512-bit stream:**

Use **Concat** blocks to combine:
```
[ch0_rxdata, ch1_rxdata, ..., ch7_rxdata] → 512 bits → codec.s_axis_rx_tdata
[ch0_rxvalid | ch1_rxvalid | ...] → codec.s_axis_rx_tvalid
codec.s_axis_rx_tready ← GTY backpressure
```

**Handshake:**
```
if (s_axis_rx_tvalid && s_axis_rx_tready) {
    // Codec accepts one 512-bit beat
    // Equivalent to 8× 64-bit lane transfers
}
```

**In BD:** 
```tcl
# Example: assume ch0–ch7 are the GTY quad outputs
create_bd_cell -type module Concat_RX concat_rx_data
set_property -dict [list CONFIG.IN0_WIDTH 64 CONFIG.IN1_WIDTH 64 ...] [get_bd_cells concat_rx_data]

connect_bd_net [get_bd_pins gty_tx0/ch0_rxdata[127:0]] [get_bd_pins concat_rx_data/In0]
# ... repeat for ch1–ch7
connect_bd_net [get_bd_pins concat_rx_data/dout[511:0]] [get_bd_pins codec/s_axis_rx_tdata]

# Handshake
connect_bd_net [get_bd_pins gty_quad/ch0_rxvalid] [get_bd_pins codec/s_axis_rx_tvalid]
connect_bd_net [get_bd_pins codec/s_axis_rx_tready] [get_bd_pins gty_quad/ch0_rxready]
```

### 3.2 RX Decoded Output → NoC

The codec's **decoded output** goes to the system NoC:

```
codec.m_axis_rx_tdata[511:0]  → NoC slave port (512-bit AXI4 or AXI4-Stream)
codec.m_axis_rx_tvalid        → NoC tvalid
codec.m_axis_rx_tready ←      ← NoC tready (backpressure)
```

**In BD:**
```tcl
# Route to NoC input
connect_bd_net [get_bd_pins codec/m_axis_rx_tdata] [get_bd_pins noc/s0_axis_tdata]
connect_bd_net [get_bd_pins codec/m_axis_rx_tvalid] [get_bd_pins noc/s0_axis_tvalid]
connect_bd_net [get_bd_pins noc/s0_axis_tready] [get_bd_pins codec/m_axis_rx_tready]
```

### 3.3 TX Data Path (System → Codec → GTY)

**Reverse direction for transmit:**

```
[System/NoC] 
  → codec.s_axis_tx_tdata[511:0]  (512-bit data in)
  → codec.s_axis_tx_tvalid        (valid flag)
  ← codec.s_axis_tx_tready        (backpressure)

[Codec after encoding]
  → codec.m_axis_tx_tdata[511:0]
  → codec.m_axis_tx_tvalid

[Split 512 bits → 8 lanes]
  → [ch0_txdata, ch1_txdata, ..., ch7_txdata]
  → GTY TX inputs
```

**In BD:**
```tcl
# NoC → Codec TX input
connect_bd_net [get_bd_pins noc/m0_axis_tdata] [get_bd_pins codec/s_axis_tx_tdata]
connect_bd_net [get_bd_pins noc/m0_axis_tvalid] [get_bd_pins codec/s_axis_tx_tvalid]
connect_bd_net [get_bd_pins codec/s_axis_tx_tready] [get_bd_pins noc/m0_axis_tready]

# Codec TX output → GTY (split 512 → 8 lanes)
create_bd_cell -type module Slice_TX_CH0 slice_tx_ch0
set_property -dict [list CONFIG.LEFT_BIT 63 CONFIG.RIGHT_BIT 0] [get_bd_cells slice_tx_ch0]
connect_bd_net [get_bd_pins codec/m_axis_tx_tdata[63:0]] [get_bd_pins slice_tx_ch0/Din]
connect_bd_net [get_bd_pins slice_tx_ch0/Dout] [get_bd_pins gty_quad/ch0_txdata[63:0]]
# ... repeat for ch1–ch7
```

---

## Step 4: AXI-Lite Control-Path Wiring

The Orchestrator (MicroBlaze) configures the codec via `s_axi_ctrl`.

### 4.1 Connect Orchestrator Master → Codec Slave

**MicroBlaze M_AXI_GTY (AXI4-Lite master) → codec.s_axi_ctrl (AXI4-Lite slave)**

**In Vivado:** Right-click on codec, select **Connect to AXI Interconnect** (or manual):

```tcl
# Use AXI SmartConnect for clock-domain bridging
create_bd_cell -type ip xilinx.com:ip:axi_interconnect smartconnect_codec
set_property -dict [list CONFIG.NUM_MI 1 CONFIG.NUM_SI 1] [get_bd_cells smartconnect_codec]

# Connect MicroBlaze master
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins microblaze/M_AXI_GTY] \
                                          [get_bd_intf_pins smartconnect_codec/S00_AXI]

# Connect codec slave
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins smartconnect_codec/M00_AXI] \
                                          [get_bd_intf_pins codec/s_axi_ctrl]

# Clocking for interconnect
connect_bd_net [get_bd_pins smartconnect_codec/aclk] [get_bd_pins axi_clk_source/clk_out1]
connect_bd_net [get_bd_pins smartconnect_codec/aresetn] [get_bd_pins proc_sys_reset/interconnect_aresetn]
```

**Key settings:**
- Interconnect clock: `axi_clk` (200 MHz)
- Protocol: AXI4-Lite
- Data width: 32-bit (matches codec CSR interface)

### 4.2 Address Mapping

If multiple codecs, use address decoder in the interconnect:

| Codec | Base Address | Top Address | Range |
|-------|--------------|-------------|-------|
| GTY | `0x0000_0000` | `0x0000_0FFF` | 4 KB |
| PCIe | `0x0001_0000` | `0x0001_0FFF` | 4 KB |
| AEB | `0x0002_0000` | `0x0002_0FFF` | 4 KB |

**In BD:** Use **Address Editor** tab:
1. Select interconnect
2. Expand **gt_codec > S_AXI_CTRL**
3. Set range to desired base address

---

## Step 5: Optional DRP Interface

If **dynamic transceiver reconfiguration** is needed, connect the DRP slave:

```
codec.drp_den  ← [Orchestrator DRP logic or tied to codec internally]
codec.drp_dwe  ← 
codec.drp_daddr[9:0] ←
codec.drp_di[15:0]   ←
codec.drp_do[15:0]   →
codec.drp_drdy       →
```

Usually, **leave DRP unconnected** initially (codec has internal DRP FSM for simple cases).

If you need external control:
```tcl
# Optional: tie DRP signals to orchestrator logic
connect_bd_net [get_bd_pins microblaze_drp_controller/dout[15:0]] [get_bd_pins codec/drp_di]
connect_bd_net [get_bd_pins codec/drp_do] [get_bd_pins microblaze_drp_controller/din]
```

---

## Step 6: Status & Monitoring (Optional)

The codec outputs per-lane status:

```
codec.lane_locked[7:0]  → system monitoring (LED, interrupt, etc.)
codec.lane_error[7:0]   →
```

**In BD:** Route to debug outputs or orchestrator:

```tcl
# For ILA (in-circuit logic analyzer)
connect_bd_net [get_bd_pins codec/lane_locked] [get_bd_pins ila/probe2]
connect_bd_net [get_bd_pins codec/lane_error] [get_bd_pins ila/probe3]

# Or feed back to MicroBlaze GPIO
connect_bd_net [get_bd_pins codec/lane_locked] [get_bd_pins gpio_status/din[7:0]]
```

---

## Step 7: Validate Connections

### Tcl Script for Automatic Verification

```tcl
# Verify all codec connections
proc verify_codec_bd {} {
    set codec [get_bd_cells codec]
    set errors 0
    
    # Check clocks
    if {[llength [get_bd_nets -of_objects [get_bd_pins $codec/gty_clk]]] != 1} {
        puts "ERROR: gty_clk not connected"
        incr errors
    }
    
    # Check AXIS data paths
    foreach axis_port {s_axis_rx s_axis_tx m_axis_rx m_axis_tx} {
        set port [get_bd_pins $codec/${axis_port}_tdata]
        if {[llength [get_bd_nets -of_objects $port]] != 1} {
            puts "ERROR: ${axis_port}_tdata not connected"
            incr errors
        }
    }
    
    # Check AXIS handshake
    foreach axis_port {s_axis_rx s_axis_tx m_axis_rx m_axis_tx} {
        set valid [get_bd_pins $codec/${axis_port}_tvalid]
        set ready [get_bd_pins $codec/${axis_port}_tready]
        if {[llength [get_bd_nets -of_objects $valid]] != 1 || \
            [llength [get_bd_nets -of_objects $ready]] != 1} {
            puts "ERROR: ${axis_port} handshake incomplete"
            incr errors
        }
    }
    
    # Check control plane
    set s_axi [get_bd_pins $codec/s_axi_ctrl]
    if {[llength [get_bd_intf_nets -of_objects $s_axi]] != 1} {
        puts "ERROR: s_axi_ctrl not connected to interconnect"
        incr errors
    }
    
    if {$errors == 0} {
        puts "✓ All codec connections verified!"
    } else {
        puts "✗ $errors errors found"
    }
    return $errors
}

# Run verification
verify_codec_bd
```

---

## Step 8: Generate Bitstream & Test

1. **Validate Design:** Right-click BD → **Validate Design**
2. **Generate HDL:** Vivado → Generate Output Products (or let design flow auto-generate)
3. **Open Synthesized Design:** Check for warnings on clock crossings, undriven pins
4. **Create Constraints:** Add timing constraints for gty_clk vs. axi_clk (CDC)
5. **Run Implementation:** Implement → Generate Bitstream

---

## Troubleshooting

| Issue | Cause | Solution |
|-------|-------|----------|
| **GTY clock warnings** | gty_clk not marked as clock | Right-click net → Mark as Clock |
| **CDC timing violations** | Inadequate synchronizer delay budget | Add CDC crossover constraints or increase sync FIFO depth |
| **AXIS handshake deadlock** | tvalid/tready not wired | Verify every AXIS interface has both signals connected |
| **Codec data mismatch** | Byte ordering on lane concatenation | Check endianness in Concat blocks (LSB first vs. MSB first) |
| **AXI-Lite timeout** | Codec CSR not responding | Verify axi_clk/axi_rst_n connected and codec reset released |

---

## Checklist

- [ ] `tb3d_gty_transceiver_codec` instantiated in BD
- [ ] `gty_clk` connected (250 MHz, marked as clock)
- [ ] `axi_clk` connected (200 MHz, marked as clock)
- [ ] `gty_rst_n` and `axi_rst_n` connected (active-low)
- [ ] Codec S_AXIS_RX/TX connected to GTY quad outputs (512-bit, 8 lanes)
- [ ] Codec M_AXIS_RX/TX connected to NoC or downstream logic
- [ ] S_AXI_CTRL connected to Orchestrator (MicroBlaze) via AXI interconnect
- [ ] Address map entered in Address Editor (codec @ correct base address)
- [ ] Lane status outputs (lane_locked, lane_error) routed to monitoring logic
- [ ] Vivado **Validate Design** reports no critical errors
- [ ] Timing analysis passes (especially gty_clk → axi_clk CDC)
- [ ] Bitstream generated and tested on hardware

---

## Next Steps

1. **Compile & Program:** Load bitstream to Versal board
2. **Boot Orchestrator:** MicroBlaze firmware initializes codec via AXI-Lite writes
3. **Monitor Status:** Read lane_locked / lane_error via S_AXI_CTRL STATUS register
4. **Verify DataFlow:** Use ILA or protocol analyzer to confirm TB3D encoding on serial lines
