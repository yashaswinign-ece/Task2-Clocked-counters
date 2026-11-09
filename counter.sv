module sync_up_counter #(
    parameter WIDTH = 4
)(
    input wire clk,
    input wire rst_n,      // Active-low synchronous reset
    input wire enable,     // Count enable
    output reg [WIDTH-1:0] count
);

    always @(posedge clk) begin
        if (!rst_n) begin
            count <= {WIDTH{1'b0}};
        end else if (enable) begin
            count <= count + 1'b1;
        end
    end

endmodule
