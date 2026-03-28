## TB3D ARM Driver — Integration and Usage Guide

**Document:** TB3D Codec Runtime Driver for ARM Processors  
**Target Processors:** ARM A72 (Versal), ARM R5F (Versal)  
**OS Support:** Linux (5.10+), RTOS (FreeRTOS)  
**Version:** 1.0  

---

## Contents

1. [Overview](#overview)
2. [Architecture](#architecture)
3. [API Reference](#api-reference)
4. [Compilation](#compilation)
5. [Integration Steps](#integration-steps)
6. [Usage Examples](#usage-examples)
7. [Troubleshooting](#troubleshooting)
8. [Best Practices](#best-practices)

---

## Overview

The **ARM Driver Library** (`tb3d_codec_arm_driver.h`) provides user-space access to TB3D codec hardware registers on the Versal VPK180 platform. It complements the MicroBlaze boot firmware (Phase 1–4 initialization) by enabling runtime monitoring, health checking, and configuration adjustments after ARM processor boots.

### Key Capabilities

- **Status Monitoring:** Read live codec lock state, error counters, lane status
- **Health Alerting:** Detect error thresholds and issue alerts via syslog
- **Runtime Configuration:** Enable/disable codecs, adjust lane masks without reboot
- **Cross-Platform:** Works with both A72 (Linux) and R5F (RTOS) via memory-mapped I/O
- **Zero Overhead:** Memory-mapped register access; no kernel module required (initially)

### Design Philosophy

> **"Complete board sovereignty"** requires the ARM to have **observability** into codec status without the ability to **alter the core TB3D security model**. The ARM driver is **read-heavy** (status monitoring) with **limited write capability** (configuration knobs only, not full register access).

---

## Architecture

### Three Codec Instances

Each codec is independently accessible via its **physical base address**:

```
GTY  Codec:  0x0000_0000  (512-bit AXIS @ 250 MHz)
PCIe Codec:  0x0001_0000  (TLP @ 250 MHz)
AEB  Codec:  0x0002_0000  (256-bit AXIS @ 250 MHz)
```

### Memory Map (Per Codec)

```
Offset   Register Name      Width   Mode       Purpose
------   ----------------   -----   ----       ----------
0x00     CTRL               32-bit  R/W        Enable/disable codec
0x04     STATUS             32-bit  RO         Lock + error flags
0x08     LANE_EN            32-bit  R/W        Per-lane enable mask
0x0C     DRP_ADDR           32-bit  R/W        Dynamic reconfig address
0x10     DRP_RDATA          32-bit  RO         DRP read data
0x14     STAT_LOCK          32-bit  RO         Lock counter (optional)
0x18     STAT_ERROR         32-bit  RO         Error counter (optional)
0x1C     VERSION            32-bit  RO         Codec version (0xDEADBEEF)
```

### Register Bit Encoding

#### CTRL Register (0x00)
```
Bit 0:     CODEC_EN      - 1=codec enabled, 0=disabled
Bits 7-1:  RESERVED      - Tied to 0
Bits 31-8: MODE          - Encoding mode (per codec, see RTL)
```

#### STATUS Register (0x04)
```
Bits 7-0:    LANE_LOCKED  - Bit i = lane i lock state (1=locked, 0=pending)
Bits 15-8:   LANE_ERROR   - Bit i = lane i error (1=error, 0=ok)
Bits 31-16:  RESERVED     - Tied to 0
```

### Dual-Clock Domain Design

```
MicroBlaze Boot          ARM Runtime
     |                        |
     v                        v
[CTRL @ 200 MHz AXI]   [CTRL @ 200 MHz Reader]
     |                        |
     +--- CDC Stage --->    (Synchronized)
     |                        |
     v                        v
[Codec CSR]           [Status Query via mmap]
  (RW at 200 MHz)       (RO polling @ ARM freq)
  |
  +--- 250 MHz Clock Domain ----> [Data Path: AXIS @ 250 MHz]
```

**Key Point:** ARM reads STATUS register directly (no CDC needed for reads; STATUS already synchronized by hardware).

---

## API Reference

### Handle Management

#### `tb3d_arm_open(uint32_t phys_base, tb3d_arm_handle_t *handle)`

**Purpose:** Open a codec instance and map its CSR space into virtual memory.

**Parameters:**
- `phys_base`: Physical base address (e.g., `TB3D_GTY_BASE_PHYS`)
- `handle`: Pointer to handle struct (filled on success)

**Returns:**
- `0` on success
- `-1` on failure (perror() for details)

**Side Effects:**
- Opens `/dev/mem` (requires root or `CAP_SYS_RAWIO`)
- Calls `mmap()` to create virtual-to-physical mapping
- Reads VERSION register to verify codec presence

**Example:**
```c
tb3d_arm_handle_t gty_codec;
if (tb3d_arm_open(TB3D_GTY_BASE_PHYS, &gty_codec) != 0) {
    perror("Failed to open GTY codec");
    return -1;
}
```

#### `tb3d_arm_close(tb3d_arm_handle_t *handle)`

**Purpose:** Close codec instance and unmap memory.

**Parameters:**
- `handle`: Codec handle

**Returns:**
- `0` on success

**Side Effects:**
- Unmaps virtual memory
- Closes `/dev/mem` file descriptor
- Invalidates handle (`initialized = false`)

---

### Status Reading

#### `tb3d_arm_read_status(tb3d_arm_handle_t *handle, tb3d_arm_status_t *status)`

**Purpose:** Poll codec status (non-blocking, snapshot).

**Parameters:**
- `handle`: Codec handle
- `status`: Pointer to status struct (filled on return)

**Returns:**
- `0` on success
- `-1` on invalid handle

**Output Structure:**
```c
typedef struct {
    uint8_t     lane_locked[TB3D_NUM_LANES];  // Per-lane: 0=pending, 1=locked
    uint8_t     lane_error[TB3D_NUM_LANES];   // Per-lane: 0=ok, 1=error
    uint32_t    ctrl_reg;                     // Raw CTRL register
    uint32_t    status_reg;                   // Raw STATUS register
    bool        codec_enabled;                // Derived: CTRL[0]
    bool        all_locked;                   // Derived: all lanes locked
    bool        has_errors;                   // Derived: any lane error
} tb3d_arm_status_t;
```

**Example:**
```c
tb3d_arm_status_t status;
if (tb3d_arm_read_status(&gty_codec, &status) == 0) {
    if (status.all_locked) {
        printf("All lanes locked!\n");
    }
}
```

#### `tb3d_arm_monitor_health(tb3d_arm_handle_t *handle, tb3d_arm_status_t *status, bool *alert_out)`

**Purpose:** Check health and detect alarm conditions.

**Parameters:**
- `handle`: Codec handle
- `status`: Output status
- `alert_out`: Pointer to alert flag (set if error threshold exceeded)

**Returns:**
- `0` on success

**Behavior:**
- Reads STATUS register
- Accumulates error count
- Sets `alert_out = true` if current cycle errors > `TB3D_ERROR_THRESHOLD` (default: 5)

**Example:**
```c
bool alert;
tb3d_arm_monitor_health(&gty_codec, &status, &alert);
if (alert) {
    syslog(LOG_WARNING, "GTY codec error threshold exceeded!");
}
```

#### `tb3d_arm_print_status(const tb3d_arm_status_t *status)`

**Purpose:** Pretty-print status to stdout.

**Parameters:**
- `status`: Status struct

**Output Example:**
```
TB3D Codec Status:
  ├─ Codec Enabled: YES
  ├─ All Lanes Locked: YES
  ├─ Error Detected: NO
  ├─ CTRL register: 0x00000001
  ├─ STATUS register: 0x0000FF00
  └─ Per-Lane Status:
      Lane 0: [✓] (locked=1, error=0)
      Lane 1: [✓] (locked=1, error=0)
      ...
```

---

### Control Functions

#### `tb3d_arm_enable(tb3d_arm_handle_t *handle)`

**Purpose:** Enable codec (set `CTRL[0] = 1`).

**Parameters:**
- `handle`: Codec handle

**Returns:**
- `0` on success

**Preconditions:**
- MicroBlaze must have completed Phase 2 initialization (codec probed)
- All codecs start in disabled state; ARM can enable selectively at runtime

**Example:**
```c
tb3d_arm_enable(&gty_codec);  // Activate GTY codec
```

#### `tb3d_arm_disable(tb3d_arm_handle_t *handle)`

**Purpose:** Disable codec (clear `CTRL[0] = 0`).

**Parameters:**
- `handle`: Codec handle

**Returns:**
- `0` on success

**Behavior:**
- Stops codec from processing new AXIS transactions
- Existing in-flight data may complete; new data is blocked

**Example:**
```c
tb3d_arm_disable(&pcie_codec);  // Pause PCIe codec
```

---

## Compilation

### Standalone Tools (Apps)

#### Compile `tb3d_monitor.c` (monitoring app):

```bash
# For ARM Linux A72
arm-linux-gnueabihf-gcc -Wall -O2 -lpthread \
    -I./src \
    -o tb3d_monitor \
    apps/tb3d_monitor.c src/tb3d_codec_arm_driver.h

# For ARM Linux R5F (single-threaded variant needed; see RTOS section)
```

**Requirements:**
- `arm-linux-gnueabihf-gcc` (Linaro or similar cross-compiler)
- libpthread (for threading)
- `-I./src` to find header file

#### Compile `tb3d_config.c` (config app):

```bash
arm-linux-gnueabihf-gcc -Wall -O2 \
    -I./src \
    -o tb3d_config \
    apps/tb3d_config.c src/tb3d_codec_arm_driver.h
```

### Link Against Driver Library

If you want to link your own application:

```bash
# Compile your app that includes tb3d_codec_arm_driver.h
arm-linux-gnueabihf-gcc -Wall -O2 \
    -I./src \
    -c my_app.c -o my_app.o

# Link (no separate library; header is inline implementation)
arm-linux-gnueabihf-gcc -o my_app my_app.o -lpthread
```

**Note:** The driver is **header-only** (implementation inlined); you don't need separate `.o` files or shared libraries.

---

## Integration Steps

### Step 1: Copy Files to ARM Linux Filesystem

```bash
# On build host
scp src/tb3d_codec_arm_driver.h root@<arm-board>:/opt/tb3d/include/

scp apps/tb3d_monitor root@<arm-board>:/opt/tb3d/bin/
scp apps/tb3d_config  root@<arm-board>:/opt/tb3d/bin/

# Make runnable
ssh root@<arm-board> chmod +x /opt/tb3d/bin/tb3d_*
```

### Step 2: Boot Verify

After Linux boots on ARM:

```bash
# Check board is online
ping <arm-board>

# Verify /dev/mem is accessible (required for mmap)
ssh root@<arm-board> ls -l /dev/mem
# Output: crw-r----- 1 root kmem 1, 1 Jan 1 00:00 /dev/mem

# Grant user-space access (if running as non-root)
ssh root@<arm-board> 'echo 1 > /proc/sys/dev/mem/allow_mmap_min_addr'
```

### Step 3: Test Codec Access

```bash
ssh root@<arm-board> /opt/tb3d/bin/tb3d_config status gty
```

**Expected Output (if GTY codec is present):**
```
=== GTY Codec Status ===
Enabled: YES
All Locked: YES
Has Errors: NO
CTRL Register: 0x00000001
STATUS Register: 0x0000FF00

Per-Lane Status:
  Lane 0: LOCKED | OK
  Lane 1: LOCKED | OK
  Lane 2: LOCKED | OK
  ...
  Lane 7: LOCKED | OK
```

**If codec not found:**
```
ERROR: Failed to open GTY codec
```
→ Check physical address, ensure MicroBlaze completed Phase 2.

### Step 4: Start Runtime Monitor

```bash
# Foreground (interactive)
ssh root@<arm-board> /opt/tb3d/bin/tb3d_monitor 1000

# Background (daemon)
ssh root@<arm-board> nohup /opt/tb3d/bin/tb3d_monitor 1000 /var/log/tb3d.log &
```

### Step 5: Integrate into Linux Init Scripts (Optional)

Create `/etc/init.d/tb3d_monitor`:

```bash
#!/bin/bash
# TB3D codec monitor daemon

case "$1" in
  start)
    echo "Starting TB3D codec monitor..."
    /opt/tb3d/bin/tb3d_monitor 500 /var/log/tb3d.log &
    ;;
  stop)
    echo "Stopping TB3D codec monitor..."
    pkill -f tb3d_monitor
    ;;
  *)
    echo "Usage: $0 {start|stop}"
    exit 1
    ;;
esac
```

Enable at boot:
```bash
ssh root@<arm-board> '/etc/init.d/tb3d_monitor start'
```

---

## Usage Examples

### Example 1: Check All Codecs

```bash
$ sudo /opt/tb3d/bin/tb3d_config status all

=== GTY Codec Status ===
Enabled: YES
All Locked: YES
...

=== PCIe Codec Status ===
Enabled: YES
All Locked: YES
...

=== AEB Codec Status ===
Enabled: YES
All Locked: YES
...
```

### Example 2: Selective Lane Activation

Disable lanes 4–7 on GTY (keep only 0–3):

```bash
sudo /opt/tb3d/bin/tb3d_config lanes gty 0x0F
```

Verify:
```bash
$ sudo /opt/tb3d/bin/tb3d_config status gty
...
Per-Lane Status:
  Lane 0: LOCKED | OK
  Lane 1: LOCKED | OK
  Lane 2: LOCKED | OK
  Lane 3: LOCKED | OK
  Lane 4: PENDING | OK
  Lane 5: PENDING | OK
  Lane 6: PENDING | OK
  Lane 7: PENDING | OK
```

### Example 3: Monitor with Real-Time Alerts

```bash
# Poll every 500 ms, log to file
sudo /opt/tb3d/bin/tb3d_monitor 500 /var/log/tb3d.log

# In another terminal, tail the log
tail -f /var/log/tb3d.log
```

Output:
```
[2024-01-15 10:23:45] Cycle 1
  GTY:  ENABLED  | ALL_LOCKED
  PCIe: ENABLED  | ALL_LOCKED
  AEB:  ENABLED  | ALL_LOCKED

[2024-01-15 10:23:46] Cycle 2
  GTY:  ENABLED  | ALL_LOCKED
  PCIe: ENABLED  | ALL_LOCKED [ALERT]
  AEB:  ENABLED  | ALL_LOCKED
```

### Example 4: Programmatic Usage (Custom App)

```c
#include "tb3d_codec_arm_driver.h"

int main() {
    tb3d_arm_handle_t gty;
    tb3d_arm_status_t status;

    // Open codec
    if (tb3d_arm_open(TB3D_GTY_BASE_PHYS, &gty) != 0) {
        return 1;
    }

    // Poll until all locked
    for (int i = 0; i < 50; i++) {
        tb3d_arm_read_status(&gty, &status);
        if (status.all_locked) {
            printf("Lock achieved in %d ms\n", i * 10);
            break;
        }
        usleep(10000);  // 10 ms
    }

    // Cleanup
    tb3d_arm_close(&gty);
    return 0;
}
```

---

## Troubleshooting

### Issue: "Failed to open /dev/mem"

**Cause:** Insufficient permissions.

**Solution:**
```bash
sudo /opt/tb3d/bin/tb3d_config status gty
```

Or grant user-space access:
```bash
sudo setcap cap_sys_rawio=ep /opt/tb3d/bin/tb3d_monitor
sudo /opt/tb3d/bin/tb3d_monitor 1000  # Now works without sudo
```

### Issue: "Codec not found at 0x00000000"

**Cause:** GTY codec base address mismatch, or MicroBlaze Phase 2 not completed.

**Solution:**
1. Verify Vivado address map: GTY codec should be at `0x0000_0000`
2. Check MicroBlaze boot log (UART): Phase 2 should print "GTY codec enabled"
3. If MicroBlaze hung, reflash FPGA

### Issue: Lane Errors Detected

**Symptom:** `Has Errors: YES`, `lane_error[i] = 1`

**Diagnosis:**
```bash
# Check which lanes have errors
sudo /opt/tb3d/bin/tb3d_config status gty
# Look for "ERROR" in per-lane status

# Check error counter (if VERSION > 0x0001)
sudo /opt/tb3d/bin/tb3d_monitor 100 | grep ALERT
```

**Solutions:**
- Lower lane mask to exclude problematic lanes: `tb3d_config lanes gty 0xCF` (skip lane 4)
- Verify physical GTY connections (oscilloscope)
- Check encode/decode logic for correctness
- Reset codec: `tb3d_config disable gty` + wait 1s + `tb3d_config enable gty`

### Issue: Memory Map Fails ("mmap: Invalid argument")

**Cause:** Physical address not aligned to page boundary (4 KB).

**Check:** In `tb3d_codec_arm_driver.h`:
```c
/* Must be 4 KB aligned: 0x0000_0000, 0x0001_0000, 0x0002_0000 */
#define TB3D_GTY_BASE_PHYS      0x0000_0000
```

If Vivado assigned `0x0100_1234` (misaligned), adjust address in header and regenerate BD.

---

## Best Practices

### 1. Always Check Handle Validity

```c
if (tb3d_arm_open(...) != 0) {
    // Handle error immediately
    return -1;
}
// Use handle safely
tb3d_arm_close(&handle);  // Always cleanup
```

### 2. Use Timeout in Polling Loops

```c
#define LOCK_TIMEOUT_MS 100
time_t start = time(NULL);
while (!status.all_locked) {
    if (difftime(time(NULL), start) > LOCK_TIMEOUT_MS / 1000.0) {
        fprintf(stderr, "Lock timeout\n");
        return -1;
    }
    tb3d_arm_read_status(&handle, &status);
    usleep(10000);  // 10 ms per cycle
}
```

### 3. Monitor Continuously, React Gradually

✗ **Don't:** 
```c
if (error_detected) {
    disable_codec();  // Too aggressive
}
```

✓ **Do:**
```c
if (error_count > THRESHOLD) {
    reduce_lane_mask();  // Graceful degradation
    // Still operational with fewer lanes
}
```

### 4. Log Status Regularly for Diagnostics

```bash
# Capture 1-day trace (1440 samples @ 1 Hz)
sudo /opt/tb3d/bin/tb3d_monitor 1000 /var/log/tb3d_24h.log &

# Later: analyze patterns
grep ALERT /var/log/tb3d_24h.log | wc -l  # Count alerts
```

### 5. Handle CDC Safely

Although STATUS register is hardware-synchronized, acknowledge that:

```
ARM read @ 200 MHz clock domain
         ↓
  (synchronized by HW)
         ↓
Codec register @ 250 MHz clock domain
```

**Implication:** First read after codec enable may show transitional state. **Always poll until stable**:

```c
tb3d_arm_enable(&codec);
usleep(100000);  // Wait 100 ms for transient to settle
// Now status is reliable
tb3d_arm_read_status(&codec, &status);
```

### 6. Rate-Limit Monitor Thread

```c
// Good: 1 Hz polling (1000 ms)
tb3d_monitor 1000 /var/log/tb3d.log

// Okay: 10 Hz polling (100 ms)
tb3d_monitor 100 /var/log/tb3d.log

// Risky: >100 Hz (10 ms) — excessive /dev/mem traffic
tb3d_monitor 10 /var/log/tb3d.log  # Avoid
```

---

## RTOS Integration (FreeRTOS Example)

If running FreeRTOS instead of Linux:

1. Replace `/dev/mem` access with direct pointer (RTOS has linear heap):
```c
// FreeRTOS (no mmap needed)
#ifdef FREERTOS
    handle->base_virt = (volatile uint32_t *)TB3D_GTY_BASE_PHYS;
#else
    // Linux: use mmap as shown above
#endif
```

2. Replace `pthread` with FreeRTOS tasks:
```c
// Instead of pthread_create()
xTaskCreate(monitor_thread_func, "tb3d_mon", 4096, NULL, 1, NULL);
```

3. Replace `usleep()` with `osDelay()`:
```c
// Instead of usleep(1000000)
osDelay(1000);  // FreeRTOS 1 sec
```

---

## Summary

| Aspect | Detail |
|--------|--------|
| **Files** | `tb3d_codec_arm_driver.h` (driver), `tb3d_monitor.c` (monitor), `tb3d_config.c` (config tool) |
| **Entry Point** | `tb3d_arm_open()` → read/control loop → `tb3d_arm_close()` |
| **Memory Access** | `/dev/mem` + `mmap()` (Linux), direct pointer (RTOS) |
| **Permissions** | Root or `CAP_SYS_RAWIO` |
| **Polling Pattern** | Read STATUS every 100–1000 ms; react to thresholds |
| **Clock Domain** | STATUS register already synchronized (HW CDC); reads safe |
| **Extensibility** | Easy to add DRP reconfiguration, per-lane callbacks, sysfs interfaces |

---

**Next Steps:**

1. Copy files to ARM board
2. Test with `tb3d_config status all`
3. Run `tb3d_monitor` continuously
4. Integrate into production system (init scripts, monitoring dashboards)
5. Optional: Develop custom alerts/automation based on codec state
