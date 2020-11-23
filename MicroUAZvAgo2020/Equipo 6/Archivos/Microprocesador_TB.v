//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.11.2020 07:54:49
// Design Name: 
// Module Name: Microprocesador_TB
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


module Microprocesador_TB(
    );
    
    reg Clk;
    reg Rst;
    reg [7:0] Datos_Entrada;
    reg [8:0] Instrucciones;
    wire [7:0] Direccion_Instrucciones;
    wire [7:0] Direccion_Datos;
    wire [7:0] Salida_Datos;
    wire RW;
    
    Microprocesador DUT (
        .Clk (Clk),
        .Rst (Rst),
        .Datos_Entrada (Datos_Entrada),
        .Instrucciones (Instrucciones),
        .Direccion_Instrucciones (Direccion_Instrucciones),
        .Direccion_Datos (Direccion_Datos),
        .Salida_Datos (Salida_Datos),
        .RW (RW)
    );
    
  initial
  begin
    Clk <= 0;
    Rst <= 1;
    Datos_Entrada <= 8'b00001111;
    Instrucciones <= 9'b000101011;
    #20 Rst <= 0;
    
    Datos_Entrada <= 8'b00001110;
    Instrucciones <= 9'b000101111;
    #10;
    Datos_Entrada <= 8'b00001110;
    Instrucciones <= 9'b001111011;
    #10;
    Datos_Entrada <= 8'b00001110;
    Instrucciones <= 9'b010001000;
    #10;
    Datos_Entrada <= 8'b00001110;
    Instrucciones <= 9'b001100101;
    #10;
    Datos_Entrada <= 8'b00001110;
    Instrucciones <= 9'b001011110;
    #10;
    Datos_Entrada <= 8'b00001110;
    Instrucciones <= 9'b110011000;
    #10;
    Datos_Entrada <= 8'b00001110;
    Instrucciones <= 9'b101010000;
    #10;
    Datos_Entrada <= 8'b00001110;
    Instrucciones <= 9'b110111001;
    #10;
    Datos_Entrada <= 8'b00110010;
    Instrucciones <= 9'b010101001;
    #10;
    Datos_Entrada <= 8'b00110010;
    Instrucciones <= 9'b011111010;
    #10;
    Datos_Entrada <= 8'b00110010;
    Instrucciones <= 9'b110001100;
    #10;
    Datos_Entrada <= 8'b00110010;
    Instrucciones <= 9'b111101100;
    #10;
    Datos_Entrada <= 8'b00110010;
    Instrucciones <= 9'b100011000;
    #10;
    Datos_Entrada <= 8'b00110010;
    Instrucciones <= 9'b000111111;
    #10;
    Datos_Entrada <= 8'b11111111;
    Instrucciones <= 9'b010001101;
    #10;
    Datos_Entrada <= 8'b11111111;
    Instrucciones <= 9'b111110001;
    #10;
    Datos_Entrada <= 8'b11111111;
    Instrucciones <= 9'b000111010;
    #10;
  end
  
  always@(Clk) begin
      #5 Clk <= ~Clk;
  end
      
endmodule
