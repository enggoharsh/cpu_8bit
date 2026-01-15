`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.12.2025 18:00:57
// Design Name: 
// Module Name: top_fpga_tb
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

`timescale 1ns/1ps

module top_fpga_tb;

    reg clk;
    reg rst;

    wire [7:0] LED_PC;
    wire [7:0] LED_R0;
    wire [7:0] LED_R1;
    wire [7:0] LED_R2;
    wire [7:0] LED_R3;
    wire       LED_ZERO;

    // Instantiate the top FPGA wrapper
    top_fpga DUT (
        .clk(clk),
        .rst(rst),
        .LED_PC(LED_PC),
        .LED_R0(LED_R0),
        .LED_R1(LED_R1),
        .LED_R2(LED_R2),
        .LED_R3(LED_R3),
        .LED_ZERO(LED_ZERO)
    );

    // Clock generation - 10ns period (100 MHz)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Apply reset at beginning
    initial begin
        rst = 1;
        #20;       // hold reset for 20ns
        rst = 0;
    end

    // Monitor internal values
    initial begin
        $display(" TIME | PC  | R0  | R1  | R2  | R3  | ZF ");
        $monitor("%4t | %3d | %3d | %3d | %3d | %3d |  %b",
                 $time,
                 LED_PC,
                 LED_R0, LED_R1, LED_R2, LED_R3,
                 LED_ZERO);
    end

    // Dump VCD for waveform viewing (Icarus/GTKWave)
    initial begin
        $dumpfile("top_fpga_tb.vcd");
        $dumpvars(0, top_fpga_tb);
    end

    // Stop simulation after 500 ns
    initial begin
        #500;
        $display("Simulation complete.");
        $finish;
    end

endmodule

