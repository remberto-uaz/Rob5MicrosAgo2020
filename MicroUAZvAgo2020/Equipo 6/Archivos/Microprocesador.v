//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.11.2020 02:59:55
// Design Name: 
// Module Name: Microprocesador
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


module Microprocesador(
    input Clk,
    input Rst,
    input [7:0] Datos_Entrada,
    input [8:0] Instrucciones,
    output [7:0] Direccion_Instrucciones,
    output [7:0] Direccion_Datos,
    output [7:0] Salida_Datos,
    output RW
    );
  
  wire Control_PC;
  wire Control_L;
  wire [3:0] Control_ALU;
  wire [4:0] Control_D;
  wire [3:0] Control_Salto;
  wire [15:0] Operandos;
  wire [7:0] Resultado;
  wire [7:0] Direccion;
  wire [15:0] Direccion_Dato;
  wire [2:0] Banderas;
  wire [1:0] Salto_PC;
  wire [7:0] Direccion_PC;
  
  Control Bolque_1 (
    .i_Instrucciones (Instrucciones),
   // .i_Rst (Rst),
   // .i_Clk (Clk),
    .o_Control_PC (Control_PC),
    .o_Control_Registros (Control_L),
    .o_Control_ALU (Control_ALU),
    .o_Control_Direccionamiento (Control_D),
    .o_Control_Saltos (Control_Salto)
  );
  
  Registros Bloque_2 (
    .i_Rst (Rst),
    .i_Clk (Clk),
    .i_Direccion_PC (Direccion_PC),
    .i_Resultado_ALU (Resultado),
    .i_Control_Registros (Control_L),
    .i_Datos_Entrada (Datos_Entrada),
    .i_Instrucciones (Instrucciones),
    .o_Direccion_Salto (Direccion),
    .o_DireccionDato (Direccion_Dato),
    .o_Operandos (Operandos)
  );
  
  ALU Bloque_3 (
    .i_Control_ALU (Control_ALU),
    .i_Operandos (Operandos),
    .o_Resultado (Resultado),
    .o_Banderas_Estado (Banderas)
  );

  Direccionamiento Bloque_4 (
    .i_Control_Direc (Control_D),
    .i_DireccionDato (Direccion_Dato),
    .o_Direccion_Datos (Direccion_Datos),
    .o_Salida_Datos (Salida_Datos),
    .o_RW (RW)
  );  
  
  Saltos Bloque_5 (
    .i_Control_Salto (Control_Salto),
    .i_BanEstado (Banderas),
    .o_Salto_PC (Salto_PC) 
  );
  
  PC Bloque_6 (
    .i_Clk (Clk),
    .i_Rst (Rst),
    .i_Control_PC (Control_PC),    
    .i_Control_Saltos (Salto_PC),
    .i_Direccion_Salto (Direccion),
    .o_Direccion_Instrucciones (Direccion_Instrucciones),
    .o_Direccion_PC (Direccion_PC)  
  );

endmodule
