`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.12.2025 19:05:21
// Design Name: 
// Module Name: clk_div2_tb
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


module clk_div2_tb;

reg clk, rst;
wire clk_out;

clk_div2 dut (clk, rst, clk_out);

initial begin
    clk = 0;
    forever #5 clk = ~clk;   // 10ns clock period
end

initial begin
    rst = 1;
    #12 rst = 0;             // release reset AFTER a rising edge
end

endmodule

