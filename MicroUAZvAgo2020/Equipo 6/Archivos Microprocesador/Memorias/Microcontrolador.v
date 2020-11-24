//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.11.2020 16:03:59
// Design Name: 
// Module Name: Microcontrolador
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


module Microcontrolador(
    input Clk,
    input Rst
 );
 
 wire [7:0] DatosM_RAM;
 wire [7:0] DatosRAM_M;
 wire [7:0] DireccionDatos;
 wire RW;
 wire [7:0] DireccionInstrucciones;
 wire [8:0] BusInstrucciones;
 
 ROM Bloque_1 (
    .Clk (Clk),
    .Direccion_Instrucciones (DireccionInstrucciones),
    .Instruccion (BusInstrucciones)
 );
 
 Microprocesador Bloque_2 (
    .Clk (Clk),
    .Rst (Rst),
    .Datos_Entrada (DatosRAM_M),
    .Instrucciones (BusInstrucciones),
    .Direccion_Instrucciones (DireccionInstrucciones),
    .Direccion_Datos (DireccionDatos),
    .Salida_Datos (DatosM_RAM),
    .RW (RW)
 );   
 
 memoriaRAM Bloque_3 (
    .Clk (Clk),
    .Direccion_Dato (DireccionDatos),
    .Entrada_Datos (DatosM_RAM),
    .RW (RW),
    .Datos_Salida (DatosRAM_M)
 ); 
 
endmodule
