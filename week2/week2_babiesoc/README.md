# Lab: BabySoC — Functional Modelling
**Lab name:** BabySoC Functional Modelling (Week 2)  
**Date:** 2025-09-28  <!-- replace with actual date -->  


---

## 1. Aim
**To perform a complete functional modelling exercise of the BabySoC educational SoC: compile, simulate, view waveforms, capture evidence (VCD, screenshots, logs) and analyze clock/reset/dataflow. This verifies the functional correctness of BabySoC before any synthesis/layout steps.**

---

## 2. Objectives
- Clone and inspect the BabySoC project source.  
- Compile the design and its testbench using **Icarus Verilog (iverilog)**.  
- Run simulation (`vvp`), generate `.vcd` waveform files.  
- View and analyze waveforms with **GTKWave** and capture screenshots showing reset, clock, and data movement.  
- Save console logs and wave dumps into the project folder.  
- (Optional) Synthesize the design using **Yosys** and verify netlist equivalence with a testbench.

---

## 3. Tools & Environment
- OS: Ubuntu (VirtualBox VM)  
- Icarus Verilog (`iverilog`) — check: `iverilog -V`  
- GTKWave (`gtkwave`) — check: `gtkwave --version`  
- Git (`git`) — check: `git --version`  
- (Optional) Yosys — check: `yosys -V`  
- Workspace (this repo): `~/rtl2gds-vlsi-tools/week2/week2.1_babiesoc`

**Note:** If any tool is missing:
```bash
sudo apt update
sudo apt install iverilog gtkwave git -y
# optionally:
sudo apt install yosys -y
```

## 4. File / Folder Layout (expected)

After finishing this lab, this folder should look like:

```bash
week2_babiesoc/
├─ src/                  # Verilog source files you used
├─ vcd/                  # generated .vcd waveform files
├─ screenshots/          # GTKWave screenshots (reset, clock, dataflow)
├─ logs/                 # sim logs, stdout/stderr captures
├─ run_babiesoc.sh       # run script (provided below)
├─ tb_run.v              # (if created) testbench file
└─ README.md             # this file
```



---

## 5. Procedure (Step-by-Step)
Start in your VM terminal. Commands assume your repo is cloned at ~/rtl2gds-vlsi-tools. Adjust paths if different.

### Step 1 — Prepare Workspace
The SFAL repo contains the BabySoC materials. If you already have extracted sources, copy them into src/ instead.
```bash
# go to repo
cd ~/rtl2gds-vlsi-tools

# create lab folder and subfolders
mkdir -p week2/week2.1_babiesoc
cd week2/week2.1_babiesoc

# create directories for deliverables
mkdir -p src vcd screenshots logs

```

### Step 2 — Clone BabySoC Source
```bash
git clone https://github.com/hemanthkumardm/SFAL-VSD-SoC-Journey.git temp_sf
# locate the BabySoC project inside the cloned repo (folder name may vary)
# use tab-complete or ls to find it, then copy .v files to src/
cp temp_sf/*/*BabySoC*/*.v src/ 2>/dev/null || cp -r temp_sf/*/*/12.* src/ 2>/dev/null
# if the above doesn't copy, manually open the folder and copy the .v files into src/

```
### Step 3 — Inspect Files
```bash
cd src
ls -lh
# find potential testbench files
find . -maxdepth 2 -type f -iname "*tb*.v" -o -iname "*test*.v"
# try to identify the top-level module name
grep -R "module " *.v | sed -n '1,200p'

```
### Step 4 — Compile Design + Testbench with Icarus Verilog
```bash
# example (replace tb_babiesoc.v with actual testbench filename)
cd ~/rtl2gds-vlsi-tools/week2/week2.1_babiesoc/src
iverilog -o ../babiesoc_sim tb_babiesoc.v $(find . -name "*.v")
# if tb_babiesoc.v is inside src and there are dependencies, the command above compiles all .v files

```
