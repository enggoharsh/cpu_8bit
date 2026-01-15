`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.12.2025 17:56:58
// Design Name: 
// Module Name: top_fpga
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


module top_fpga(
    input        clk,
    input        rst,
    // map to board LEDs or pins
    output [7:0] LED_PC,    // show PC
    output [7:0] LED_R0,    // show R0
    output [7:0] LED_R1,    // show R1
    output [7:0] LED_R2,    // show R2
    output [7:0] LED_R3,    // show R3
    output       LED_ZERO   // zero flag
);
    //  wire clkSlow;


   // clk125_10 clkcon (clk,rst,clkSlow);

    // instantiate cpu (modified to expose regs)
    cpu CPU0(
        .clk(clk),                          //slow clock for fpga
        .rst(rst),
        .pc_out(LED_PC),
        .R0(LED_R0),
        .R1(LED_R1),
        .R2(LED_R2),
        .R3(LED_R3),
        .zero_flag_out(LED_ZERO)
    );

endmodule


