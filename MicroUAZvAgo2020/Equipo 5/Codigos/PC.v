`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.11.2020 20:04:03
// Design Name: 
// Module Name: PC
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


module PC(
input [2:0]Ban_PC,
input [7:0] N,
input [1:0] Sel_PC,
input [7:0] x_k,
input Clk,
input Reset,
output [7:0] PC_save,
output [7:0] Adress_Instruction_Bus
    );
    
reg[7:0] Cuenta; 

always@(posedge Clk)   
     if (!Reset)
        Cuenta = Cuenta + 1;
    else
        Cuenta = 0;

assign Adress_Instruction_Bus = Cuenta;
assign PC_save = Cuenta;
endmodule
