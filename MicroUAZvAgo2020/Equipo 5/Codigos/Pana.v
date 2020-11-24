`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.11.2020 20:04:03
// Design Name: 
// Module Name: Pana
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


module Pana(
input [7:0] DataIn_Bus,
input [8:0] Instruction,
input Clk,
input Reset,
output [7:0] DataOut_Bus,
output [7:0] Adress_Data_Bus,
output [7:0] Adress_Instruction_Bus
    );
    
 wire Move;
 wire Math;
 wire Write;
 wire [2:0] k;
 wire [2:0] i;
 wire [2:0] j;
 wire Sel_out;
 wire [7:0] N;
 wire [1:0] Sel_PC;
 wire [2:0] f;
 wire [7:0] Resultado;
 wire [7:0] x_k;
 wire [7:0] x_i;
 wire [2:0] Ban_PC;
 wire [7:0] PC_save;
 
Decodificador_de_instrucciones M1(
.Instruction(Instruction),
.Move(Move),
.Write(Write),
.j(j),
.i(i),
.k(k),
.Math(Math),
.Sel_out(Sel_out),
.N(N),
.Sel_PC(Sel_PC),
.f(f)
);

Banco_de_registros M2(
.Resultado(Resultado),
.DataIn_Bus(DataIn_Bus),
.Move(Move),
.Write(Write),
.j(j),
.i(i),
.k(k),
.Reset(Reset),
.Clk(Clk),
.PC_save(PC_save),
.x_k(x_k),
.x_i(x_i)
);

ALU M3(
.Math(Math),
.x_k(x_k),
.x_i(x_i),
.f(f),
.Resultado(Resultado),
.Ban_PC(Ban_PC)
);

Selector_de_salidas M4(
.x_i(x_i),
.k(k),
.Sel_out(Sel_out),
.Clk(Clk),
.Reset(Reset),
.DataOut_Bus(DataOut_Bus),
.Adress_Data_Bus(Adress_Data_Bus)
);

PC M5(
.N(N),
.Sel_PC(Sel_PC),
.x_k(x_k),
.Clk(Clk),
.Reset(Reset),
.Ban_PC(Ban_PC),
.PC_save(PC_save),
.Adress_Instruction_Bus(Adress_Instruction_Bus)
);

endmodule
