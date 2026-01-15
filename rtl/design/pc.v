`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.12.2025 17:38:30
// Design Name: 
// Module Name: pc
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


// 8-bit Program Counter
module pc(
    input        clk,
    input        rst,
    input  [7:0] pc_in,
    output reg [7:0] pc_out
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            pc_out <= 8'd0;
        else
            pc_out <= pc_in;
    end
endmodule

