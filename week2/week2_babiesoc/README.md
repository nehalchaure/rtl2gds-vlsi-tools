# Week 2.1 — BabySoC Functional Modelling (Lab Notes)

## 1. Objective
To perform **functional modelling of BabySoC** using open-source tools (Icarus Verilog + GTKWave).  
The goal is to:
- Understand clock, reset, and dataflow in BabySoC.
- Simulate BabySoC and generate waveforms.
- Capture evidence (screenshots, logs, .vcd files).

---

## 2. Tools Used
- **Icarus Verilog (iverilog)** → Compile and simulate Verilog code.
- **GTKWave** → View simulation waveforms.
- **GitHub** → Store results, reports, and screenshots.

---

## 3. Steps Performed

### Step 1: Setup
```bash
# Install if not done earlier
sudo apt install iverilog gtkwave -y

# Create folder inside repo
cd ~/rtl2gds-vlsi-tools
mkdir -p week2/week2.1_babiesoc
cd week2/week2.1_babiesoc

# Clone BabySoC project
git clone https://github.com/hemanthkumardm/SFAL-VSD-SoC-Journey.git
cd SFAL-VSD-SoC-Journey/"12. VSDBabySoC Project"
