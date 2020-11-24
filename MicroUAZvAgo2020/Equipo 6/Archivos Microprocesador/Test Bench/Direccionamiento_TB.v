//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.11.2020 23:54:46
// Design Name: 
// Module Name: Direccionamiento_TB
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


module Direccionamiento_TB(
    );
 
 reg [4:0] i_Control_Direc;
 reg [15:0] i_DireccionDato;
 wire [7:0] o_Direccion_Datos;
 wire [7:0] o_Salida_Datos;
 wire o_RW;
 
 Direccionamiento DUT(
     .i_Control_Direc (i_Control_Direc),
     .i_DireccionDato (i_DireccionDato),
     .o_Direccion_Datos (o_Direccion_Datos),
     .o_Salida_Datos (o_Salida_Datos),
     .o_RW (o_RW)
  );
  
  initial 
  begin
    i_Control_Direc <= 0;
    i_DireccionDato <= 0;
    #20;
    
    i_Control_Direc <= 5'b01101;
    i_DireccionDato[15:8] <= 8'b10101010;
    i_DireccionDato[7:0] <= 8'b01010101;
    #20;
    i_Control_Direc <= 5'b10111;
    i_DireccionDato[15:8] <= 8'b00111010;
    i_DireccionDato[7:0] <= 8'b01011100;
    #20;
    i_Control_Direc <= 5'b11011;
    i_DireccionDato[15:8] <= 8'b11110000;
    i_DireccionDato[7:0] <= 8'b01111101;
    #20;
    i_Control_Direc <= 5'b00101;
    i_DireccionDato[15:8] <= 8'b00000011;
    i_DireccionDato[7:0] <= 8'b11111000;
    #20;
    i_Control_Direc <= 5'b01000;
    i_DireccionDato[15:8] <= 8'b00011100;
    i_DireccionDato[7:0] <= 8'b00001111;
    #20;
    i_Control_Direc <= 5'b10001;
    i_DireccionDato[15:8] <= 8'b01100111;
    i_DireccionDato[7:0] <= 8'b011010100;
    #20;
  end
endmodule
