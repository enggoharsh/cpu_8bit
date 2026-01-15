// ALU: ADD, SUB, AND, OR
module alu(
    input  [7:0] A,
    input  [7:0] B,
    input  [1:0] sel,   // ALUop
    output reg [7:0] Y,
    output      zero
);
    always @(*) begin
        case (sel)
            2'b00: Y = A + B;   // ADD
            2'b01: Y = A - B;   // SUB
            2'b10: Y = A & B;   // AND
            2'b11: Y = A | B;   // OR
            default: Y = 8'd0;
        endcase
    end

    assign zero = (Y == 8'd0);

endmodule
