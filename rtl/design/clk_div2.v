`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.12.2025 18:35:17
// Design Name: 
// Module Name: clk_div2
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


module clk_div2(input clk,
input rst,
output reg clk_out

    );
reg [1:0] count ;   
always @(posedge clk)
    begin
        if(rst)
            begin
                clk_out <= 0;
                count <= 0;
            end
        else if (count == 3)
            begin
                clk_out <= ~clk_out;
                count <= 0;
            end
        else
            begin
            count <= count +1;
            clk_out <= clk_out;
            end
    end
endmodule
