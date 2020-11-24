//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.11.2020 15:38:34
// Design Name: 
// Module Name: memoriaRAM
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


module memoriaRAM(
    input Clk,
    input [7:0] Direccion_Dato,
    input [7:0] Entrada_Datos,
    input RW,
    output [7:0] Datos_Salida
 );
    
    
    parameter RAMFILE = "Datos.mem";
    reg [7:0] RAM [0:255];
    wire [7:0] EntradaDatos;
    
    assign EntradaDatos = Entrada_Datos;
   
    always@(posedge Clk)
    begin
      if(RW)
        RAM[Direccion_Dato] <= Entrada_Datos; // escritura
    end
    
    assign  Datos_Salida = (RW == 1'b0) ? RAM[Direccion_Dato]: Datos_Salida;  //lectura
    
    //Se inicializa la memoria RAM
    initial
    begin
        $readmemh(RAMFILE, RAM);
    end
endmodule
