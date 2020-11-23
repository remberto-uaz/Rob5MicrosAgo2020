//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.11.2020 23:24:00
// Design Name: 
// Module Name: Registros_TB
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


module Registros_TB (
	);
	reg Rst;
	reg Clk;
	reg [7:0] PC;
	reg [7:0] ALU;
	reg [7:0] Datos_Entrada;
	reg Control;
	reg [8:0] Instrucciones;
	wire [15:0] Direccionamiento;
	wire [7:0] oPC;
	wire [15:0] oALU;
	
	Registros DUT(
		.i_Rst (Rst),
		.i_Clk (Clk),
		.i_Direccion_PC (PC),
		.i_Resultado_ALU (ALU),
		.i_Control_Registros (Control),
		.i_Datos_Entrada (Datos_Entrada),
		.i_Instrucciones (Instrucciones),
		.o_DireccionDato (Direccionamiento),
		.o_Direccion_Salto (oPC),
		.o_Operandos (oALU)
	);
	
	initial
	begin
		Rst <= 1;
		Clk <= 0;
		PC <= 8'b01010101;
		ALU <= 8'b10101010;
		Control <= 1;
		Datos_Entrada <= 8'b11111111;
		Instrucciones <= 9'b010101011;
		#20 Rst <= 0;
		
		Control <= 3'bx;
		Instrucciones <= 9'b001100111;
		#20;
		Control <= 0;
		Instrucciones <= 9'b010001000;
		#20;
		Control <= 1;
		Instrucciones <= 9'b101011100;
		#20;
		Control <= 0;
		Instrucciones <= 9'b100100101;
		#20;
		Control <= 1;
		Instrucciones <= 9'b110111110;
		#20;
		Control <= 1'bx;
		Instrucciones <= 9'b111101000;
        #20;
	end
	
	always@(Clk) begin
        #5 Clk <= ~Clk;
    end
endmodule