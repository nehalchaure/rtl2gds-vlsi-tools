# Week 2 — Fundamentals of SoC Design (Theory Notes)
## 1. Introduction: What is a System-on-Chip (SoC)?
A System-on-Chip (SoC) is an integrated circuit that brings together all essential components of a computing system onto a single chip. Typical SoCs combine:
- A processor (CPU or microcontroller)
- Memory blocks (SRAM, ROM, cache)
- Standard peripherals (UART, GPIO, timers, SPI, I2C, etc.)
- Specialized accelerators (DSP, AI engines, encryption blocks)
- Interconnect logic (buses or networks-on-chip)

The integration enables low power, high performance, compact size, and reduced cost compared to using multiple chips.

---

## 2. Components of a Typical SoC
- **CPU**: The control unit that fetches instructions and executes them.
- **Memory**: 
  - On-chip SRAM for fast access.
  - Non-volatile ROM or Flash for storing boot code.
- **Peripherals**: Interfaces for communication with the external world (UART, SPI, I2C, timers).
- **Interconnect/Bus**:
  - Connects CPU, memory, and peripherals.
  - Examples: AMBA (AHB/APB), Wishbone, AXI.
- **Special IPs**: Optional hardware accelerators for AI, DSP, or crypto.

---

## 3. Why BabySoC?
The VSDBabySoC project is a **simplified educational SoC model** designed for learning:
- How modules interact in an SoC environment.
- How reset and clock signals propagate across the design.
- Dataflow between CPU, memory, and peripherals.
- Simulation and synthesis concepts without overwhelming complexity.

It removes unnecessary details and focuses on the core concepts of SoC integration.

---

## 4. Role of Functional Modelling
Functional modelling allows early verification of the SoC:
- Uses **RTL code and testbenches** to validate behavior.
- Ensures correct functionality before synthesis and tapeout.
- Captures timing relations between clock, reset, and data signals.
- Helps debug integration errors at the design stage.

Flow:  
**RTL (design) + Testbench → Simulator (Icarus Verilog) → VCD → GTKWave Analysis**

---

## 5. Summary
- SoC = CPU + memory + peripherals + interconnect integrated onto one chip.
- BabySoC = simplified learning platform for SoC fundamentals.
- Functional modelling = simulate + analyze before physical design.
- Understanding reset, clock, and dataflow is essential for reliable SoC design.
