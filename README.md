
 #  SAP-2 Based CPU: RTL to ASIC Implementation

This repository contains the complete design and implementation of a SAP-2 based 8-bit CPU, developed using Verilog HDL and taken through the entire RTL to ASIC design flow.

The project includes functional verification via simulation and FPGA, followed by physical design and layout generation using the QFlow ASIC toolchain.

# 📌 Project Overview

- Architecture: SAP-2 based 8-bit single-cycle CPU
- Design Language: Verilog HDL
- Verification Platforms: Simulation + FPGA (PYNQ-Z2)
- ASIC Backend Flow: QFlow (open-source)
- Final Output: DRC/LVS-clean ASIC layout

This project demonstrates an end-to-end digital design workflow, starting from RTL design and concluding with a fabrication-ready layout.

#  CPU Features

8-bit single-cycle processor

Custom instruction set (ALU, Load/Store, Branch)
Core modules:
-Program Counter (PC)
- Instruction Memory
- Register File (R0–R3)
- Arithmetic Logic Unit (ADD, SUB, AND, OR)
- Data Memory
- Control Unit
- Zero flag–based conditional branching

# Designed for both FPGA and ASIC targets

- Verification Flow
- RTL Simulation
- Functional correctness verified using test programs
- Instruction execution and control flow validated

✔ FPGA Validation
- Implemented on PYNQ-Z2 FPGA
- Verified using:
- On-board and external LEDs (2.5 mm LEDs)
- Slowed-down clock via clock divider (12 MHz → 1 Hz)

Internal signals observed:
- Program Counter
- Register contents
- Zero flag

# ASIC Backend Flow (QFlow)

The verified RTL design was taken through a complete ASIC backend flow using QFlow:

- RTL Synthesis – Yosys
- Clean hierarchy
- Technology-mapped netlist
- Placement – GrayWolf
- Standard-cell placement completed successfully
- Routing – QRouter
- All nets routed with zero failures
- Layout & DRC – Magic
- Initial minor DRC errors manually fixed

Final layout is DRC clean
- LVS – Netgen
- Layout vs Schematic: Circuits Match

# Author 

[enggoharsh](https://github.com/enggoharsh)
