// 4 general-purpose 8-bit registers: R0..R3
module regfile(
    input        clk,
    input        we,
    input  [1:0] rd,       // destination register
    input  [1:0] rs,       // source register
    input  [7:0] din,      // write data

    output [7:0] A,        // read port for Rd
    output [7:0] B,        // read port for Rs

    // Debug outputs for FPGA
    output [7:0] R0_out,
    output [7:0] R1_out,
    output [7:0] R2_out,
    output [7:0] R3_out
);
    reg [7:0] R [0:3];
    integer i;

    // Initialize registers to zero
    initial begin
        for (i = 0; i < 4; i = i + 1)
            R[i] = 8'd0;
    end

    // Combinational read ports
    assign A = R[rd];
    assign B = R[rs];

    // Debug outputs
    assign R0_out = R[0];
    assign R1_out = R[1];
    assign R2_out = R[2];
    assign R3_out = R[3];

    // Synchronous write port
    always @(posedge clk) begin
        if (we)
            R[rd] <= din;
    end

endmodule


