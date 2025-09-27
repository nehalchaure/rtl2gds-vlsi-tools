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

##  What is a Simulator, Design, and Testbench?

### 🖥️ Simulator
A **simulator** is a software tool that checks your digital circuit’s functionality by applying test inputs and observing outputs.  
It helps you **verify your design before hardware implementation**.

### 📝 Design
The **design** is your **Verilog code** describing the intended logic functionality.

### 🧪 Testbench
A **testbench** is a **simulation environment** that applies various inputs to your design and checks whether the outputs are correct.

---

## 1️⃣ Simulation with Icarus Verilog
Simulation is the **first validation step**. I implemented a **2:1 multiplexer** in Verilog and tested it with a testbench.

#### 🔹 2:1 MUX Design (`mux.v`)
```verilog
module mux (
    input wire a, b, sel,
    output wire y
);
    assign y = sel ? b : a;
endmodule

```

## ▶️ Running Simulation
```bash
iverilog -o mux_tb mux.v tb_mux.v
./mux_tb
gtkwave mux.vcd
```

## 2️⃣ Synthesis with Yosys
I synthesized the same 2:1 MUX into gate-level hardware using **Yosys** and the **Sky130 standard cell library**.  

### 🔹 Yosys Script (`mux.ys`)
```tcl
read_liberty -lib sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog mux.v
synth -top mux
dfflibmap -liberty sky130_fd_sc_hd__tt_025C_1v80.lib
abc -liberty sky130_fd_sc_hd__tt_025C_1v80.lib
show
write_verilog mux_synth.v
```

### ▶️ Running Synthesis
```bash
yosys -s mux.ys
```

📄 **Result:** Yosys produced an optimized **gate-level netlist** (`mux_synth.v`) mapped to Sky130 cells.  

---

## 📝 Key Learnings & Takeaways
- 🔁 Always **simulate before synthesis** to catch design issues early.  
- 🛠 **iverilog + GTKWave** workflow is excellent for debugging.  
- 📂 `.lib` files are **critical** for mapping RTL to real hardware cells.  
- 📜 Yosys scripting makes synthesis **repeatable and automated**.  

---

## 🔮 Next Steps
- 🔎 Study **sequential circuits** (flip-flops, registers).  
- ⏱ Learn about **timing equations** (setup/hold checks).  
- ➕ Practice with **larger designs** like adders & ALUs.  

---

## 📂 Repository Structure
```bash
├── mux.v              # 2:1 MUX design
├── tb_mux.v           # Testbench
├── mux.ys             # Yosys synthesis script
├── mux_synth.v        # Synthesized netlist
├── mux.vcd            # Simulation waveform (generated)
└── README.md          # This report







