# 🔧 RTL Workshop – Day 1 Report  

![Banner](https://img.shields.io/badge/RTL-Workshop-blueviolet?style=for-the-badge&logo=verilog&logoColor=white)

<p align="center">
  <img src="https://img.shields.io/badge/Made%20With-Verilog-green?style=flat-square" />
  <img src="https://img.shields.io/badge/Tool-Yosys-orange?style=flat-square" />
  <img src="https://img.shields.io/badge/Simulator-Icarus%20Verilog-blue?style=flat-square" />
  <img src="https://img.shields.io/badge/Waveform-GTKWave-red?style=flat-square" />
  <img src="https://img.shields.io/badge/PDK-Sky130-lightgrey?style=flat-square" />
</p>

---

## 📌 Introduction
This repository documents my learning journey in the **RTL Workshop**.  
**Day 1** focused on the **RTL Design and Synthesis Flow**, exploring how a digital design moves from **Verilog code ➝ simulation ➝ synthesis ➝ netlist**, using fully open-source tools.  

---

## 🛠️ Tools Used
- 🖥 **Icarus Verilog (iverilog)** – for compiling and simulating Verilog designs.  
- 📈 **GTKWave** – for viewing simulation waveforms.  
- ⚙️ **Yosys** – for RTL synthesis and netlist generation.  
- 📂 **Sky130 PDK** – technology library for mapping logic gates.  

---

## 📚 Day 1 Learnings

### 1️⃣ Simulation with Icarus Verilog
Simulation is the **first validation step**. I implemented a **2:1 multiplexer** in Verilog and tested it with a testbench.

#### 🔹 2:1 MUX Design (`mux.v`)
```verilog
module mux (
    input wire a, b, sel,
    output wire y
);
    assign y = sel ? b : a;
endmodule
