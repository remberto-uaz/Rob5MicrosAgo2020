//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.11.2020 23:41:06
// Design Name: 
// Module Name: Microcontrolador_TB
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


module Microcontrolador_TB(

    );
    
 reg Clk;
 reg Rst;
 
 Microcontrolador DUT (
    .Clk (Clk),
    .Rst (Rst)
 );
 
 initial
 begin
    Clk <= 0;
    Rst <= 1;
    #10 Rst <= 0;
 end 
 
    always@ (Clk)
        #5 Clk <= ~Clk;
        
endmodule
