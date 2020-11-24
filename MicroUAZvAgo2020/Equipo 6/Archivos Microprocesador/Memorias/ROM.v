//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.11.2020 02:46:20
// Design Name: 
// Module Name: ROM
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


module ROM(
    input Clk,
    input [7:0] Direccion_Instrucciones,
    output [8:0] Instruccion
    );
 
 parameter ROMFILE = "Instruccion.mem";
 reg [8:0] ROM [0:255];
 reg [8:0] Instrucciones;
 
 assign Instruccion = Instrucciones;
 
    always@(negedge Clk)
 begin
    Instrucciones <= ROM[Direccion_Instrucciones];
 end
 
 //Se inicializa la memoria ROM
 initial
 begin
    $readmemb(ROMFILE, ROM);
  /*   ROM[0] = 9'h0; 
     ROM[1] = 9'h1;
     ROM[2] = 9'h2;
     ROM[3] = 9'h3;
     ROM[4] = 9'h4; 
     ROM[5] = 9'h5;
     ROM[6] = 9'h6;
     ROM[7] = 9'h7; */
 end

endmodule
