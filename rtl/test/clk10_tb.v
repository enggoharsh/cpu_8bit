`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.12.2025 19:28:43
// Design Name: 
// Module Name: clk10_tb
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


module clk10_tb(

    );
 reg clk,rst;
 wire clk10;
 
 clk125_10 dut (clk,rst,clk10);
 
 initial
     begin
        rst = 1;
        clk = 0;
        forever #5 clk = ~clk;
     end
  initial
     begin
        #5 rst = 0;
     end
endmodule
