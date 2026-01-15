// 8-bit wide instruction memory, 256 locations
module instr_mem(
    input  [7:0] addr,
    output [7:0] instr
);
    reg [7:0] mem [0:255];

    integer i;
    initial begin
        // Initialize all instructions to NOP-like (0)
        for (i = 0; i < 256; i = i + 1)
            mem[i] = 8'h00;

        // Program:
        // 0: LOAD R0, [0]
        // 1: LOAD R1, [1]
        // 2: SUB  R2, R2   ; R2 = 0
        // 3: ADD  R2, R0   ; R2 = mem[0]
        // 4: SUB  R2, R1   ; R2 = mem[0] - mem[1]
        // 5: JZ   7        ; if equal -> PC = 7
        // 6: JMP  6        ; infinite loop (not equal)
        // 7: JMP  7        ; infinite loop (equal)

        mem[8'h00] = 8'h40; // 0: LOAD R0, [0]
        mem[8'h01] = 8'h51; // 1: LOAD R1, [1]
        mem[8'h02] = 8'h29; // 2: SUB  R2, R2
        mem[8'h03] = 8'h20; // 3: ADD  R2, R0
        mem[8'h04] = 8'h25; // 4: SUB  R2, R1
        mem[8'h05] = 8'hE7; // 5: JZ   7
        mem[8'h06] = 8'hC6; // 6: JMP  6
        mem[8'h07] = 8'hC7; // 7: JMP  7
    end

    assign instr = mem[addr];

endmodule
