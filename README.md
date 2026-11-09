# Task 2: Clocked Counters and Registers

## Overview
Designed, simulated, and verified an N-bit parameterized synchronous up-counter using Verilog HDL. The design incorporates an active-low synchronous reset (`rst_n`) and a count enable signal (`enable`).

## Features & Verification
* **Synchronous Reset:** Resets counter value to 0 on the positive clock edge when `rst_n` is low.
* **Enable Control:** Increments counter only when `enable` is high; holds value when low.
* **Overflow Handling:** Automatically rolls over to 0 upon reaching maximum value.

## Repository Contents
* `counter.sv` - RTL implementation of the parameterized synchronous counter.
* `tb_counter.sv` - Testbench applying clock generation, reset sequence, and enable control.
* `counter_waveform.png` - EPWave output screenshot verifying counting logic.

## Tools Used
* **Simulator:** Icarus Verilog (via EDA Playground)
* **Waveform Viewer:** EPWave

## Waveform Proof
![Counter Waveform](counter_waveform.png)
