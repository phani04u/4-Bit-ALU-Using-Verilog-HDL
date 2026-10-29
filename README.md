# 4-Bit Arithmetic Logic Unit (ALU) Using Verilog HDL

## 1. Project Overview

This project implements a 4-Bit Arithmetic Logic Unit (ALU) using Verilog HDL in Xilinx Vivado. The ALU performs arithmetic and bitwise logical operations on two 4-bit inputs, A and B. A 3-bit select signal determines which operation is performed.

The project demonstrates combinational logic design, operation selection using a `case` statement, testbench development, simulation waveform analysis, and RTL schematic verification.

## 2. Aim

To design and simulate a 4-bit Arithmetic Logic Unit using Verilog HDL and verify all eight arithmetic and logical operations using a testbench in Xilinx Vivado.

## 3. Introduction

An Arithmetic Logic Unit (ALU) is a digital circuit that performs arithmetic and logical operations on binary data. It is an essential component of processors, microcontrollers, and digital computing systems.

A 4-bit ALU accepts two 4-bit input operands, A and B, and produces a 4-bit output, Y. The required operation is selected using a 3-bit control signal.

Since the select signal has three bits, it can represent eight different binary combinations, from `000` to `111`. Each combination corresponds to a specific operation.

## 4. Inputs and Outputs

### Inputs

- **A [3:0]:** First 4-bit input operand.
- **B [3:0]:** Second 4-bit input operand.
- **Select [2:0]:** Three-bit control signal used to choose the operation.

### Output

- **Y [3:0]:** Four-bit output containing the result of the selected operation.

## 5. Operations and Select Lines

The ALU supports eight operations selected by the 3-bit control signal.

| Select | Operation | Symbol |
|---|---|---|
| `000` | Addition | `A + B` |
| `001` | Subtraction | `A - B` |
| `010` | Multiplication | `A * B` |
| `011` | Division | `A / B` |
| `100` | Bitwise AND | `A & B` |
| `101` | Bitwise OR | `A \| B` |
| `110` | Bitwise XOR | `A ^ B` |
| `111` | Bitwise XNOR | `~(A ^ B)` |

## 6. Detailed Explanation of Operations

### 6.1 Addition — `A + B`

When the select signal is `000`, the ALU adds the two input operands.

**Example:**

- A = `0011` (3)
- B = `0010` (2)
- Y = `0101` (5)

The output contains the sum of A and B.

### 6.2 Subtraction — `A - B`

When the select signal is `001`, the ALU subtracts B from A.

**Example:**

- A = `0110` (6)
- B = `0010` (2)
- Y = `0100` (4)

The output contains the difference between the two operands.

### 6.3 Multiplication — `A * B`

When the select signal is `010`, the ALU multiplies A by B.

**Example:**

- A = `0011` (3)
- B = `0010` (2)
- Full product = 6 (`0110`)
- Y = `0110`

Because Y is four bits wide, any product exceeding the representable four-bit range is truncated to its lowest four bits.

### 6.4 Division — `A / B`

When the select signal is `011`, the ALU divides A by B.

**Example:**

- A = `1000` (8)
- B = `0010` (2)
- Y = `0100` (4)

For integer operands, Verilog division produces an integer quotient. Avoid division by zero during simulation.

### 6.5 Bitwise AND — `A & B`

When the select signal is `100`, the ALU performs a bitwise AND operation. An output bit is 1 only when the corresponding bits of both inputs are 1.

**Example:**

```text
A = 1100
B = 1010
    ----
Y = 1000
```

### 6.6 Bitwise OR — `A | B`

When the select signal is `101`, the ALU performs a bitwise OR operation. An output bit is 1 when at least one corresponding input bit is 1.

**Example:**

```text
A = 1100
B = 1010
    ----
Y = 1110
```

### 6.7 Bitwise XOR — `A ^ B`

When the select signal is `110`, the ALU performs a bitwise XOR operation. An output bit is 1 when the corresponding input bits are different.

**Example:**

```text
A = 1100
B = 1010
    ----
Y = 0110
```

### 6.8 Bitwise XNOR — `~(A ^ B)`

When the select signal is `111`, the ALU performs a bitwise XNOR operation. It produces the complement of the XOR result. An output bit is 1 when the corresponding input bits are equal.

**Example:**

```text
A       = 1100
B       = 1010
A ^ B   = 0110
~(A ^ B)= 1001
```

The result is four bits wide because the operands are four bits wide.

## 7. Design Methodology

The ALU is implemented using Verilog HDL. A `case` statement selects the required operation according to the three-bit control signal.

The design follows these basic steps:

1. Declare the input operands A and B.
2. Declare the three-bit select signal.
3. Declare the four-bit output Y.
4. Use the select signal to choose one of the eight operations.
5. Assign the calculated result to Y.
6. Use a default case to assign `4'b0000` when no other case matches.

The design is combinational because the output depends on the current inputs and select signal, rather than a clock edge or stored state.

## 8. Testbench

A testbench is used to verify the functionality of the ALU without requiring physical hardware.

The testbench applies different values to A and B and changes the select signal to test all eight operations.

The following cases should be checked:

- Addition
- Subtraction
- Multiplication
- Division with a nonzero divisor
- Bitwise AND
- Bitwise OR
- Bitwise XOR
- Bitwise XNOR

The testbench can also include boundary cases, such as zero inputs and arithmetic results that exceed four bits.

## 9. Simulation Waveform

The simulation waveform displays the values of A, B, the select signal, and output Y over simulation time.

By changing the select signal, the waveform can demonstrate how the ALU performs different operations.

The waveform should be checked against the expected results for each test case.

## 10. RTL Schematic

The RTL schematic in Xilinx Vivado shows the structure inferred from the Verilog design.

It helps visualize the input signals, operation-selection logic, and output connections.

The schematic can be viewed after elaborating the design in Vivado.

## 11. Expected Results

The ALU is expected to produce the result corresponding to the selected operation.

- `000`: Addition
- `001`: Subtraction
- `010`: Multiplication
- `011`: Division
- `100`: Bitwise AND
- `101`: Bitwise OR
- `110`: Bitwise XOR
- `111`: Bitwise XNOR

The default case assigns zero to Y.

## 12. Important Design Notes

- The output Y is only four bits wide, so arithmetic results may be truncated.
- Division by zero should be avoided or explicitly handled.
- A four-bit unsigned input represents values from 0 to 15.
- The design uses combinational logic and does not require a clock.
- The actual simulation results should be verified using the testbench and waveform.

## 13. Applications

ALU concepts are used in:

- Central Processing Units (CPUs)
- Microcontrollers
- Digital signal processing systems
- Embedded systems
- Arithmetic and logic processing circuits

## 14. Conclusion

The 4-Bit ALU was designed using Verilog HDL and Xilinx Vivado to perform four arithmetic operations and four bitwise logical operations. The select signal determines the operation, while the testbench and simulation waveform help verify the output.

This project provides practical experience in combinational logic design, Verilog HDL coding, testbench development, and RTL schematic analysis.

## 15. Tools and Technologies

- Verilog HDL
- Xilinx Vivado
- RTL Design
- Testbench Simulation
- Waveform Analysis

## 16. Tags

`Verilog HDL` `4-Bit ALU` `VLSI` `RTL Design` `Digital Electronics` `Xilinx Vivado` `FPGA` `Combinational Logic`
