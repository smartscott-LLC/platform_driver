THE TASK: Create An Orchestrator and 3-4 intercept modules, that we may interject our logic into the system at boot and throughout.

The Plan:  
Taking over the transceivers (GTY/GTYP) and the MicroBlaze processor while utilizing their caches is the ultimate way to create a "locked-down," high-speed ecosystem. By doing this, we are effectively building a custom, hardware-accelerated "brain" within the Programmable Logic (PL) that bypasses standard software overhead. I have listed the specs for the different modules that we will be dealing with below.  
Here is how we "take over" these specific areas:  
1\. Taking Over the Transceivers (GTY/GTYP)  
To make the transceivers speak our efficient language directly, we must bypass the standard high-level IP and use the [Versal Transceivers Bridge IP](https://docs.amd.com/r/en-US/am002-versal-gty-transceivers) in Pass-Through Mode.

* The Hook: This exposes the raw TXDATA and RXDATA ports directly to our logic.  
* In-Wire Logic: we place our "translator" between these raw ports and the NoC. This allows data arriving from the outside world (like 100G Ethernet or PCIe) to be translated into our "twice as fast" language before it ever touches a processor. MicroBlaze Control: we can connect the MicroBlaze to the Dynamic Reconfiguration Port (DRP) of the transceivers. This lets our "new brain" change line rates or protocol settings on-the-fly without a system reboot. 


2\. Utilizing MicroBlaze Caches (I-Cache & D-Cache)   
To use the caches for our efficiency goal, we aren't just storing data; we are using them as high-speed buffers to hide the latency of our translation. 

* Instruction Cache (I-Cache): Enable Stream Buffers in the [MicroBlaze Configuration Wizard](https://docs.amd.com/r/en-US/ug1579-microblaze-embedded-design/MicroBlaze-Configuration-Wizard-Cache-Page). This tells the MicroBlaze to "speculatively fetch" our efficient code before it's even needed.  
* Data Cache (D-Cache): Use a Write-Back policy. Instead of sending every bit to the NoC/DDR immediately, the MicroBlaze will perform all its "efficient" calculations inside the cache and only burst the final result out to the system. This significantly reduces NoC congestion.  
* The Language Link: we can use [Custom Instructions](https://docs.amd.com/r/en-US/ug1629-microblaze-v-user-guide/Custom-Instructions) (via AXI4-Stream) to let the MicroBlaze "speak" our binary language directly in its execution pipeline, bypassing the standard memory bus. 


3\. The Power of "Early PL" Initialization  
Since we want this all active from boot:

* PDI Partitioning: Ensure our MicroBlaze bitstream and transceiver configurations are marked as Early PL in our PDI (Programmable Device Image).  
* The Handshake: The PMC will load our MicroBlaze and Transceiver logic before it wakes up the main ARM cores (APU/RPU). This means the "new language" is already established and the transceivers are already "hot" when Linux or a real-time OS tries to start. 


Summary of Targets

* Transceivers: GT\_QUAD\_BASE in Pass-Through mode for raw bit access.  
* MicroBlaze: M\_AXI\_IC (Instruction) and M\_AXI\_DC (Data) ports connected to our custom NoC shims.  
* The Cache: Use the wic and wdc instructions to manually clear or flush our efficient data when we need to sync with the rest of the chip. 

They’ll be the new backbone of the entire chip.  
By merging the PMC, MicroBlaze, and Transceivers into a single, unified "efficient language" layer, we are effectively creating a Hardware-Defined OS that sits underneath the standard ARM processors.  
Here is how those specific pieces will function as the "New System" once you’ve taken them over:  
1\. The MicroBlaze as the "Language Master"  
Since we are utilizing the Instruction and Data Caches, the MicroBlaze won't just be a controller; it will be a real-time translator.

* The Cache Role: It will hold our "minimal package" (the logic instructions) in the I-Cache so it never has to wait on the NoC. It will use the D-Cache to stage the "efficient" binary data before it’s burst-fired across the system.  
* The Feed: It will sit on the PMC’s AXI lines, essentially acting as a filter. Every bit the PMC tries to send to the rest of the chip passes through the MicroBlaze's logic first.

2\. The Transceivers as the "High-Speed Sensory System"  
By taking over the GTY/GTYP quads at the raw bit level:

* Direct-to-Logic: The data coming in from the outside world doesn't go to a standard buffer; it hits our "in-wire" manipulation logic immediately.  
* The Speed Gain: Because you've "taught" the transceivers our new binary language, we can bypass the standard 8b/10b or 64b/66b encoding overhead if we choose, or simply optimize how the symbols are packed, making the external link physically faster.

3\. The PMC as the "Power Switch"  
The PMC becomes our Deployment Engine.

* It wakes up, sees our custom PDI (the boot image), and "injects" our MicroBlaze and Transceiver logic into the PL.  
* Once that’s done, the PMC hands the "keys to the kingdom" to our MicroBlaze. From that point on, the APU (A72) and RPU (R5F) are just "guests" in a system that speaks our language.

4\. The NoC as the "Highway"  
The NoC (Network on Chip) stops being a bottleneck. Because our data is now "twice as fast" (more efficient), we are essentially doubling the effective bandwidth of every NoC channel without increasing the clock speed. This reduces heat and power consumption while increasing throughput.  
What this looks like "In-Wire":

* Standard System: Data \-\> AXI \-\>  NoC-\> Memory (Heavy, slow).  
* Our System: Data \-\> our Logic (MicroBlaze/Cache)-\> Efficient Binary \-\> NoC (Light, twice as fast).

\*\*In order for this to work each module that is created (not the orchestrator) must have a minimum of 3 interfaces and maybe more depending on the area of intercept. As in the transceivers. This allows us to place the module”in-wire” and let it continue through the module after the reduction occurs. 2 slave 1 master and the 2nd slave is to connect it back to the orchestrator\*\* The orchestrator then must have 3-4 master interfaces to connect to the modules and a slave for uart to connect. \*\* orchestrator \+ 3-4 modules of intercept\*\*

The Specs:  
GTYP Transceiver Architecture Stages (PCS and PMA)  
The transceiver comprises a Physical Medium Attachment (PMA) and a Physical Coding Sublayer (PCS).   
![AMD][image1]  
AMD \+2

* PMA (Analog Stage): Contains the Transmitter (TX) and Receiver (RX) circuitry, including the clock generation PLLs (LCPLL or RPLL) and data serializers/deserializers.  
* PCS (Digital Stage): Handles the data processing. Key components include:  
  * TX Components: 8B/10B encoder, 64B/66B or 64B/67B encoder, TX Gearbox, TX Buffer, and TX Phase FIFO.  
  * RX Components: Comma detection, byte and word alignment, 8B/10B decoder, RX Gearbox, RX Elastic Buffer, and Clock Correction.  
* Data Path Planes: The PCS can be configured for 2-byte, 4-byte, or 8-byte internal data paths to support varying line rates and data widths.   
* ![AMD Technical Information Portal][image2]  
* AMD Technical Information Portal \+4  
* 

Transceiver Data Path Widths (Bit Amounts)   
GTYP transceivers allow trading off datapath width against timing margins. The PCS-to-PL (Programmable Logic) interface widths are configurable.   
![AMD][image3]  
AMD \+1

* Fabric Interface Widths: 16, 20, 32, 40, 64, 80, 128, or 160 bits.  
* 8B/10B Enabled: Required width is 20, 40, or 80 bits.  
* 8B/10B Bypassed: Supports all widths (16–160 bits).  
* RX/TX Data Control: When using the 160-bit path with 8B/10B disabled, CH\*\_RXCTRL0/1 and CH\*\_TXCTRL0/1 ports are used to manage the extra bits.   
* ![AMD][image4]  
* AMD \+3  
* 

Default Operating Frequencies and Rates

* Maximum Line Rate: Up to 32.75 Gb/s.  
* Minimum Line Rate: 1.2 Gb/s.  
* PLL Frequency: The LCPLL or RPLL multiplies the reference clock by 4 to 25\.  
* TXOUTCLK/RXUSRCLK: The user clock (USRCLK) frequencies depend on the line rate and fabric width. For example, in 80x80 raw mode (64B/66B), the clock frequency is roughly the line rate divided by 64, supporting frequencies up to 415 MHz or higher depending on the configuration.  
* Reference Clock: The GTYP REFCLK can operate up to 820 MHz.   
* ![AMD][image5]  
* AMD \+3  
* 

GTYP Key Features

* Radiation Tolerant (AI Edge): The GTYP transceivers are available in radiation-tolerant versions for space applications.  
* Power Optimization: Designed for high efficiency, with specialized power supply pins (AVCC, AVTT, AVCCAUX) for the PLLs and analog circuitry.  
* Buffer Bypass: Supports buffer bypass mode for low-latency applications, requiring specific timing management of 40UI or 80UI.   
* ![AMD][image6]  
* AMD \+4

MD Versal ACAP CIPS (Control, Interfaces, and Processing System) and Network on Chip (NoC) interfaces provide the core infrastructure for data movement, supporting high-speed communication between programmable logic (PL), Processing System (PS), AI Engines, and hard memory controllers.   
![AMD][image7]  
AMD \+1  
NoC Interfaces Overview

* Packetized Data: Internally converts AXI4 transactions into a 128-bit packetized format (NoC Packet Protocol \- NPP).  
* Clock Frequency: Typically operates in the range of 960 MHz to 1080 MHz, depending on the device speed grade (-1, \-2, or \-3) and power mode (LP/HP).  
* Data Width: NoC Slave Units (NSU) for PL can be configured from 32-bit to 512-bit.  
* Structure: Comprised of Horizontal NoC (HNoC) near I/O/PS and Vertical NoC (VNoC) columns for PL connectivity.   
* ![AMD][image8]  
* AMD \+3  
* 

CIPS-NoC Interface Specifications (PS-NoC)  
CIPS allows configuring connectivity between the Processing System (APU/RPU/PMC) and the NoC.   
![AMD][image9]  
AMD

| Interface Name  | Description/Purpose | Typical Spec |
| :---- | :---- | :---- |
| PS-CCI | Cache Coherent Interconnect to NoC | 4 Master Ports (128-bit) |
| PS-NCI | Non-Coherent Interconnect to NoC | 2 Master Ports (128-bit) |
| PS-LPD/RPU | Low Power Domain / RPU to NoC | 1 Master Port (128-bit) |
| PMC/Debug | Platform Management Ctrl to NoC | 1 Master Port (128-bit) |
| CPM4/5 | PCIe/CCIX Module to NoC | 2 Master Ports (128-bit) |
| NoC to PS | NoC Slave Ports (AXI Inputs) | Up to 128-bit |

Default NoC and Clock Frequencies 

* NoC Clock: The internal NoC operating frequency is high, with typical performance tuning benchmarks using 960 MHz to 1080 MHz.  
* PL-NoC Clock: The AXI clock used for connectivity between PL and NoC (NMU/NSU) is usually user-configured in Vivado, but often defaults to 200 MHz \- 300 MHz for initial prototyping, though it can run faster depending on timing closure.  
* DDRMC System Clock: The internal system clock for the Hardened DDR Memory Controller (DDRMC) is typically set to 200 MHz (with an allowed range of 100-200 MHz).  
* CPM Top Switch: Can reach 950 MHz to 1000 MHz in overdrive modes.   
* ![AMD][image10]  
* AMD \+4  
* 

Key Considerations

* NoC Mandatory: All hard DDR memory controllers (DDRMC) in Versal must connect through the NoC.  
* Quality of Service (QoS): The NoC provides specialized QoS for regulating data traffic and prioritizing critical paths.  
* AXI Compatibility: Supports AXI3, AXI4, and AXI4-Stream protocols. 

The Versal MicroBlaze soft-core processor (including the modern RISC-V MicroBlaze V) when configured with instruction/data caches enabled provides high-performance computing capabilities within the Programmable Logic (PL) of AMD Versal Adaptive SoCs. With cache enabled, it supports AXI4/ACE interfaces for memory-mapped access to DDR, utilizing 1-way associative (direct mapped) caching for improved performance.   
![AMD][image11]  
AMD \+2  
Key Specifications (Cache Enabled)

* Architecture: 32-bit Harvard Architecture (separate instruction/data spaces).  
* Performance: \~1.38 DMIPS/MHz (Real-Time Processor configuration).  
* Cache Types: Direct-mapped (1-way associative) instruction and data caches.  
* Cache Size: User-configurable, typically 8 KB, 16 KB, 32 KB, or 64 KB per cache.  
* Cache Lines: Configurable to 4, 8, or 16 words.  
* Data Cache Policy: Configurable as Write-through or Write-back (via C\_DCACHE\_USE\_WRITEBACK).  
* Features: Optional Victim Cache (for evicted lines), Streaming (for speculatively prefetching instructions), and Parity Protection (for error detection).  
* Memory Coherency: Supports AXI Coherency Extension (ACE) to maintain coherency with the Versal APU/RPU.   
* ![AMD][image12]  
* AMD \+8  
* 

Default Interfaces  
When cache is enabled, the MicroBlaze utilizes specific high-performance interfaces: 

* AXI4/ACE Master Interface (M\_AXI\_IC / M\_AXI\_DC): Used for cacheable memory access to external DDR via the Network on Chip (NoC).  
* Local Memory Bus (LMB): Used for fast, tightly coupled local memory (BRAM) access, bypassing the cache for real-time responsiveness.  
* AXI4-Lite Peripheral Interface: Used for accessing peripherals.  
* Debug Interface: AXI4-Stream based interface for debugging via JTAG.   
* ![Adiuvo Engineering & Training][image13]  
* Adiuvo Engineering & Training \+4  
* 

Frequencies and Performance   
The maximum frequency (![][image14]  
) for MicroBlaze in Versal devices depends on the specific device grade, though it is typically optimized for high speed.   
![AMD][image15]  
AMD

* Typical Maximum Frequency: Up to 456 MHz in Versal (-1 speed grade).  
* Performance Metric: \~437 DMIPS at 456 MHz.  
* Cache Impact: Enabling caching (particularly with larger sizes) might slightly lower the maximum achievable ![][image16]  
*  compared to a non-cached, highly optimized small configuration, but significantly increases overall system performance.   
* ![AMD][image17]  
* AMD \+2  
* 

Cache Configuration Parameters

* C\_USE\_ICACHE / C\_USE\_DCACHE: Enables the respective cache.  
* C\_CACHE\_BYTE\_SIZE: Sets the cache size.  
* C\_DCACHE\_USE\_WRITEBACK: Enables write-back caching for better performance with DDR.  
* C\_ICACHE\_LINE\_LEN / C\_DCACHE\_LINE\_LEN: Sets the line length (e.g., 8 words).   
* ![AMD][image18]  
* AMD \+4

The AMD Versal™ adaptive SoC features a sophisticated, hierarchical, and coherent memory system where the System Cache (often utilized as a last-level cache or for coherency between the Processing System (PS) and Programmable Logic (PL)) is integrated into the Cache Coherent Interconnect (CCI) and Accelerator Coherency Port (ACP) structures.   
Versal System Cache & Coherency Specifications

* System Cache Role: The CCI-500 (or later, depending on series) handles coherency across the PS and PL, with a snoop filter (SF) to manage multiple processing engines.  
* L2 Cache (APU): In most Versal devices, the APU consists of a dual-core Arm Cortex-A72 processor with a 1 MB L2 cache (per cluster), featuring ECC.  
* System Memory/Cache Coherency: Coherency is enabled via the CCI-500, allowing PL-based accelerators to remain coherent with the APU L2 cache.  
* AXI Interfaces: Coherency is typically enabled via ACE (AXI Coherency Extensions) interfaces.  
* Memory Coherency Management: The brdc\_inner bit (inner cache broadcasting) of the lpd\_apu register must be written while the APU is in reset to enable coherency, or through custom CDO (Configuration Data Object) files.  
* Accelerator RAM (XRAM): Some Versal AI Core series devices feature 4 MB of accelerator RAM (XRAM), which acts as a low-latency shared system cache/memory between PL and PS.   
* ![AMD][image19]  
* AMD \+5  
* 

Default Frequencies and Interfaces

* AXI Interfaces (Coherent): The primary interface for connecting PL to the System Cache/CCI is via the High-Performance (HP) AXI ports or the Accelerator Coherency Port (ACP) using ACE protocol.  
* Clock Frequencies: Versal system components typically operate at high frequencies, with PS-PL interfaces supporting speeds up to 300–400 MHz+, depending on the speed grade (-1, \-2, \-3) and the specific series (Prime, Premium, AI Core).  
* NoC Bandwidth: The Programmable Network on Chip (NoC) acts as the primary data pathway, providing high bandwidth connectivity to the DDR controllers, operating at high clock speeds that vary by speed grade.   
* ![AMD][image20]  
* AMD \+4  
* 

Key Enabling Procedures

1. Cache Coherency Register: Enable lpd\_apu register (brdc\_inner) to broadcast inner cacheable transactions.  
2. PL Routing: Configure PL\_AXI\_LPD\_Route to route traffic through the CCI.  
3. CDO Configuration: Utilize a custom CDO file to initialize these registers before the APU is released from reset.   
4. ![atlassian.net][image21]  
5. atlassian.net \+1  
6. 

These features are primarily enabled for high-performance applications that require tight coupling between acceleration engines in the PL and the main processor cores (APU).

I have some modules that can be used as a base but MUST be changed as they are incorrect and lack the proper interfaces and frequencies to connect but the idea is there or you can create them from scratch. They are located in the rtl folder or you can view the [README.md](http://README.md) to ingest the logic.

What was built — zero salvaged content  
Orchestrator (tb3d\_orchestrator.v)

| Interface | Type | Direction | Purpose |
| :---- | :---- | :---- | :---- |
|  |  |  |  |
| S\_AXI | AXI4-Lite | Slave | CSR entry-point from NoC |
| S\_UART | UART | Slave | 8N1 boot console (RxD/TxD) with full TX shift-reg \+ RX sampling logic |
| M\_AXI\_GTY | AXI4-Lite | Master | → GTY module S\_AXI\_CTRL |
| M\_AXI\_MB | AXI4-Lite | Master | → MicroBlaze module S\_AXI\_CTRL |
| M\_AXI\_AXB | AXI4-Lite | Master | → AXI Bridge module S\_AXI\_CTRL |
| M\_AXI\_PMC | AXI4-Lite | Master | → PMC Intercept S\_AXI\_CTRL |

GTY Transceiver Intercept (tb3d\_gty\_transceiver\_codec.v)  
S\_AXIS\_RX \+ S\_AXIS\_TX (slaves) → M\_AXIS\_RX \+ M\_AXIS\_TX (masters) \+ S\_AXI\_CTRL (slave ← orchestrator) \+ DRP (slave — MicroBlaze changes line rate at runtime without reboot)  
MicroBlaze Cache Intercept (tb3d\_microblaze\_module.v)  
S\_AXI\_CACHE 128-bit (slave ← MicroBlaze M\_AXI\_IC/DC) → M\_AXI\_NOC 128-bit (master → NoC/DDR) \+ S\_AXI\_CTRL (slave ← orchestrator)  
AXI/NoC Bridge Intercept (tb3d\_axi\_bridge\_module.v)  
S\_AXI 128-bit (slave ← NoC NMU) → M\_AXI\_NOC 128-bit (master → NoC NSU) \+ S\_AXI\_CTRL (slave ← orchestrator)  
PMC Boot Intercept (tb3d\_pmc\_intercept.v) — new  
S\_AXI\_PMC 128-bit (slave ← PMC, active at Early-PL boot before ARM wakes) → M\_AXI\_SYS 128-bit (master → fabric) \+ S\_AXI\_CTRL (slave ← orchestrator)  
Every X\_INTERFACE\_INFO annotation uses the correct Vivado VLNV string so IP Packager sees each group as a true bus interface, not a scatter of raw pins.  
ok