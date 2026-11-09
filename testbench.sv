module tb_sync_up_counter;

    parameter WIDTH = 4;

    reg clk;
    reg rst_n;
    reg enable;
    wire [WIDTH-1:0] count;

    // Instantiate Design Under Test (DUT)
    sync_up_counter #(.WIDTH(WIDTH)) uut (
        .clk(clk),
        .rst_n(rst_n),
        .enable(enable),
        .count(count)
    );

    // Generate Clock: 10 time units period
    always #5 clk = ~clk;

    initial begin
        // Dump waveform for EPWave
        $dumpfile("waveform.vcd");
        $dumpvars(0, tb_sync_up_counter);

        // Initialize signals
        clk = 0;
        rst_n = 0;
        enable = 0;

        // Release reset after 20 time units
        #20 rst_n = 1;

        // Enable counting
        #10 enable = 1;
        #100;

        // Disable counting briefly
        enable = 0;
        #30;

        // Re-enable counting
        enable = 1;
        #60;

        // Apply reset mid-operation
        rst_n = 0;
        #20;
        rst_n = 1;
        #40;

        $finish;
    end

    initial begin
        $monitor("Time=%0t | rst_n=%0b enable=%0b count=%0d", $time, rst_n, enable, count);
    end

endmodule
