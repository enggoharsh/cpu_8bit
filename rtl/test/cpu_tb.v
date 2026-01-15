`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.12.2025 17:40:30
// Design Name: 
// Module Name: cpu_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module cpu_tb;
    reg clk;
    reg rst;
    wire [7:0] pc;

    cpu uut (
        .clk(clk),
        .rst(rst),
        .pc_out(pc)
    );

    // Clock: 10ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Reset
    initial begin
        rst = 1;
        #12;
        rst = 0;
    end
    initial begin
    #1;
    $display("instr[5] = %h", uut.IM.mem[5]);
    $display("instr[6] = %h", uut.IM.mem[6]);
    $display("instr[7] = %h", uut.IM.mem[7]);
end


  initial begin
    $display("Time\tPC\tInstr\tOpcode isALU isLOAD isSTORE isJUMP isJZ isJMP Zero R0 R1 R2 R3 nextPC");

    $monitor("%0t\t%0d\t%h\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%d\t%d\t%d\t%d\t%d",
             $time,
             pc,
             uut.instr,
             uut.opcode,
             uut.is_alu,
             uut.is_load,
             uut.is_store,
             uut.is_jump,
             uut.is_jz,
             uut.is_jmp,
             uut.zero_flag,
             uut.RF.R[0],
             uut.RF.R[1],
             uut.RF.R[2],
             uut.RF.R[3],
             uut.next_pc
    );

    #300 $finish;
end


endmodule

