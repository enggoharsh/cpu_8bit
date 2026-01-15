`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.12.2025 19:22:14
// Design Name: 
// Module Name: clk125_10
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


module clk125_10(input clk,
input rst,
output reg clk_10

    );
 reg [30:0] count;
 always @(posedge clk or posedge rst)
     begin
        if (rst)
            begin
                count <= 0;
                clk_10 <= 0;
            end
         else if (count == 31'd62499999)
            begin
                count <= 0;
                clk_10 <= ~clk_10;
            end
          else
            begin
                count <= count + 1;
                clk_10 <= clk_10; 
            end
     end
         
endmodule
