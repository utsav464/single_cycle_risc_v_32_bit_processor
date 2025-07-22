# 🧠 Single-Cycle RISC-V 32-bit Processor (Verilog – Vivado)

This project is a Verilog-based implementation of a **single-cycle RISC-V CPU**, designed to support a basic subset of instructions. It is built for educational purposes and supports **R-type, I-type, and S-type** instructions only.

---

## ✅ Supported Instruction Types

- **R-type**: `add`, `sub`, `and`, `or`, `sll`, `slt`
- **I-type**: `addi`, `andi`, `ori`, `lw`
- **S-type**: `sw`

❗ Note: Branch (B-type), Jump (J-type), and Upper Immediate (U-type) instructions are **not supported** in this version.

---

## 📁 Project Structure
```
single_cycle_risc_v_32_bit_processor/
│
├── alu.v # Arithmetic Logic Unit
├── alu_decoder.v # ALU control logic
├── control_unit.v # Main control unit
├── datamem.v # Data memory
├── imm_gen.v # Immediate value generator
├── instr_mem.v # Instruction memory
├── muxes.v # Multiplexers
├── reg_file.v # Register file (x0–x31)
├── single_cycle_core.v # Top-level processor module
├── single_cycle_top_tb.v # Testbench for simulation
├── memfile.hex # Sample program (machine code)
└── README.md # Project description


---

## 🧪 How to Simulate

1. Open the project in **Xilinx Vivado**.
2. Add all `.v` files to the design sources.
3. Set `single_cycle_top_tb.v` as the simulation top module.
4. Ensure `memfile.hex` is located in the correct directory (next to instruction memory).
5. Run the behavioral simulation and observe waveforms or outputs.

---

## 🧠 Learning Objectives

- Understand the working of a basic RISC-V processor
- Learn how CPU components interact in a single-cycle datapath
- Study how Verilog modules are integrated to build a processor
- Practice simulation and debugging in Vivado

---

## 📌 Tools Used

- **HDL**: Verilog
- **Simulation**: Xilinx Vivado (XSIM)
- **Assembler**: RISC-V tools or Venus (for generating `memfile.hex`)

---

## 🚧 Future Improvements

- Add support for:
  - **B-type** (e.g., `beq`, `bne`)
  - **J-type** (e.g., `jal`, `jalr`)
  - **U-type** (e.g., `lui`)
- Implement forwarding and hazard detection (for pipelining)
- Synthesize for FPGA boards like Nexys A7 or Basys 3

---

## 🙋 Author

**Utsav Thumar**  
Student of Electronics and Communication Engineering  
[GitHub Profile](https://github.com/utsav464)

---

## 📜 License

This project is open-source and free to use for educational purposes.




