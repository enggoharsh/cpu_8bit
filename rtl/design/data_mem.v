module data_mem(
    input        clk,
    input        memread,
    input        memwrite,
    input  [3:0] addr,
    input  [7:0] din,
    output reg [7:0] dout
);
    reg [7:0] mem [0:15];
    integer i;

    initial begin
        for (i = 0; i < 16; i = i + 1)
            mem[i] = 8'd0;

        // Test data
        mem[4'd0] = 8'd10; // mem[0]
        mem[4'd1] = 8'd10; // mem[1]
        // If mem[0] == mem[1], JZ will be taken.
    end

    always @(posedge clk) begin
        if (memwrite)
            mem[addr] <= din;
    end

    always @(*) begin
        if (memread)
            dout = mem[addr];
        else
            dout = 8'd0;
    end

endmodule
