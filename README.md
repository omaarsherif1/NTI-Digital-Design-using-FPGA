# NTI-Digital-Design-using-FPGA
NTI materials in DIgital Design using Verilog HDL
# Single Perceptron AI Hardware Accelerator

![Perceptron Top-Level Schematic](Images/Screenshot%202026-08-13%20144934.png)
![Perceptron Layer Schematic](Images/Screenshot%202026-08-13%20145814.png)

## Overview

This repository contains the RTL implementation of a **Single Perceptron AI Hardware Accelerator** designed in Verilog HDL. As the fundamental building block of Deep Neural Networks (DNNs), this design translates biological neuron functionality into an efficient, hardware-optimized digital datapath suitable for real-time edge computing applications.

---

## Team Contributions & Project Roles

| Team Member | Module / Role | Key Engineering Contributions |
|---|---|---|
| **Amr Khaled Mohamed Ali** | System Integration & Architecture Lead | • Designed top-level wrappers (`perceptron_top`, `perceptron_layer`).<br>• Implemented spatial parallelism via `generate` loops & dynamic indexing (`+:`).<br>• Designed pipeline registers & sign-extension logic for timing closure. |
| **Omar Sherif Zaki** | Verification & Testing Engineer | • Developed testbenches (`tb_perceptron_layer`) for system verification.<br>• Managed stimulus generation, signal timing checks, and test scenario coverage. |
| **Omar Mohamed Salem** | MAC Unit Designer | • Implemented the Multiply-Accumulate (`mac_unit`) hardware core.<br>• Integrated 2's complement arithmetic & signed accumulation logic. |
| **Mariam Hossam Mohamed** | Control Unit Engineer | • Designed the Finite State Machine (`fsm_controller`).<br>• Managed system handshaking, synchronization signals (`mac_en`, `clear`), and state flow. |
| **Roaa Sheriff Sayed** | Data Post-Processing Engineer | • Designed the `Bias_Add_Unit` with bit-width sign expansion.<br>• Implemented the non-linear `ReLU` activation function module. |

---

## Technical Specifications

* **Input Data Width (`DATA_WIDTH`):** 8-bit Signed Integers ($x_{in}, w_{in}, \text{bias}$)
* **Accumulator Width (`ACC_WIDTH`):** 32-bit Signed Integers (prevents overflow during continuous MAC operations)
* **Input Length ($N$):** Parameterized (default set to 8 inputs)
* **Activation Function:** Rectified Linear Unit (ReLU)
* **Clocking & Control:** Synchronous design with an active-low asynchronous reset (`rst_n`) and a Finite State Machine (FSM) manager

---

## Architecture & Hardware Modules

The datapath routes incoming features and weights sequentially through four main internal sub-modules:
1. **MAC Unit (`mac_unit.v`):** Computes the weighted sum by multiplying streaming 8-bit signed inputs ($x_{in} \times w_{in}$) and accumulating the product into a 32-bit register.
2. **FSM Controller (`fsm_controller.v`):** Coordinates data flow across five operational states (`IDLE`, `MAC`, `ADD`, `ReLU`, `COMPLETED`) using an internal counter to track inputs.
3. **Bias Add Unit (`Bias_Add_Unit.v`):** Extends the 8-bit signed bias to 32 bits and adds it to the accumulator sum.
4. **ReLU Activation (`RelU.v`):** Implements activation logic via an MSB check—passing positive sums directly and clamping negative values to zero.
5. **Top-Level Wrapper (`perceptron_top.v`):** Integrates the FSM, MAC, Bias, and ReLU modules into a single interface.
6. **Perceptron Layer (`perceptron_layer.v`):** Scales single-perceptron processing into parallel layers using flattened input buses and a reduction AND gate (`&done_bus`) for global synchronization.

---

## Design Challenges & Solutions

### 1. Long Critical Path (Timing Violations)
* **Problem:** Chaining the hardware multiplier directly with the adder within a single clock cycle created a long combinational path, severely limiting maximum operational frequency ($f_{max}$).
* **Solution:** Applied **pipelining** by inserting an intermediate register (`mult_pipe_reg`) after multiplication and delaying the enable signal (`mac_en_d`) by one cycle via a D-flip-flop to maintain control alignment.

### 2. Scalability to Synchronized Layers
* **Problem:** Routing multi-dimensional matrix data and monitoring individual completion signals across multiple neurons in parallel presented wiring and timing bottlenecks.
* **Solution:** Flattened weight/bias vectors into 1D buses using bit-slicing (`+:`) inside Verilog `generate` loops, and unified completion signaling using a reduction AND gate (`assign layer_done = &done_bus;`).

---

## Module I/O Specification

| Port Name | Width | Direction | Description |
|---|---|---|---|
| `clk` | 1 | Input | System Clock |
| `rst_n` | 1 | Input | Active-low Asynchronous Reset |
| `start` | 1 | Input | Trigger to begin computation |
| `data_valid` | 1 | Input | Indicates valid input data on the bus |
| `x_in` | `[DATA_WIDTH-1:0]` | Input | Streaming 8-bit signed feature |
| `w_in` | `[DATA_WIDTH-1:0]` | Input | Streaming 8-bit signed weight |
| `bias` | `[DATA_WIDTH-1:0]` | Input | 8-bit signed bias value |
| `final_output`| `[ACC_WIDTH-1:0]` | Output | 32-bit final result post-ReLU |
| `done` | 1 | Output | High-level flag indicating execution completion |

---

## Verification & Test Plan

The system has been verified using ModelSim/Vivado testbenches across several operational scenarios:

* **Test Case 1 (Standard Positives):** Verified baseline accumulation with zero bias ($\Sigma = 71$).
* **Test Case 2 (Async Reset Recovery):** Asserted reset mid-run to confirm clean register clearing.
* **Test Case 3 (Standard Negatives):** Verified signed arithmetic where negative sums correctly clamp to zero post-ReLU ($\Sigma = -76 \rightarrow \text{Output} = 0$).
* **Test Case 4 (Extreme Bounds):** Confirmed stability at boundary multiplication values ($-128 \times 127$).
* **Test Case 5 (Full-Scale Stress Test):** Evaluated max accumulation across all inputs ($127 \times 127 \times 8 = 129,032$).
* **Test Case 6 (Non-Zero Bias Addition):** Verified negative bias incorporation ($\Sigma = -108 \rightarrow \text{Output} = 0$).

---

## Project Structure

```text
.
├── RTL/
│   ├── Bias_Add_Unit.v
│   ├── RelU.v
│   ├── fsm_controller.v
│   ├── mac_unit.v
│   ├── mac_unit_pipelined.v
│   ├── perceptron_layer.v
│   └── perceptron_top.v
├── Testbench/
│   ├── tb_mac_unit.v
│   └── tb_perceptron_top.v
├── images/
│   ├── perceptron_schematic.png
│   └── layer_schematic.png
├── documentation/
│   ├── report.pdf
│   ├── presentation.pptx
│   └── proposal.pdf
└── README.md
