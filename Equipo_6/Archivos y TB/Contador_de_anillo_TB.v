//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.09.2020 02:18:04
// Design Name: 
// Module Name: Contador_de_anillo_TB
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


module Contador_de_anillo_TB(
);
    reg clk;
    reg rst;
    wire [3:0] anodo;
    wire [1:0] sel;

    Contador_de_anillo DUT (
        .i_Clk(clk),
        .i_Rst(rst),
        .o_Anodo(anodo),
        .o_Sel(sel)
    );

    initial begin
        clk<=0;
        rst<=1;
        #20 rst<=0;
    end

    always@(clk) begin
        #5 clk <= ~clk;
    end

endmodule
