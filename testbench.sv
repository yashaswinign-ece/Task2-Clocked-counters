`timescale 1ns / 1ps

module tb_counter;

    // Parameters
    parameter WIDTH = 4;

    // Signals
    reg clk;
    reg rst_n;
    reg enable;
    wire [WIDTH-1:0] count;

    // Instantiate the Unit Under Test (UUT)
    counter_register_block uut (
        .clk(clk),
        .rst_n(rst_n),
        .enable(enable),
        .count(count)
    );

    // Clock Generation: 10ns period (100 MHz)
    always #5 clk = ~clk;

    initial begin
        // Initialize Signals
        clk = 0;
        rst_n = 0;
        enable = 0;

        // Dump waves for EPWave viewer
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_counter);

        // Hold reset active for 20ns
        #20;
        rst_n = 1; // Release reset

        // Test Case 1: Enable high, let counter increment
        #10;
        enable = 1;
        #100;

        // Test Case 2: Disable counter (hold value)
        enable = 0;
        #30;

        // Test Case 3: Re-enable counter
        enable = 1;
        #80;

        // Test Case 4: Assert synchronous reset midway
        rst_n = 0;
        #20;
        rst_n = 1;

        // Run a bit longer and finish simulation
        #50;
        $finish;
    end

endmodule
