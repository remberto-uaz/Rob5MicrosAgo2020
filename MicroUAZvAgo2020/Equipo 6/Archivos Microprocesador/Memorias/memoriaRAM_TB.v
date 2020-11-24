//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.11.2020 16:27:05
// Design Name: 
// Module Name: memoriaRAM_TB
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


module memoriaRAM_TB(
    );
    
    parameter RAMFILE = "Datos.mem";
    reg Clk;
    reg [7:0] Direccion_Dato;
    reg [7:0] Entrada_Datos;
    reg RW;
    wire [7:0] Datos_Salida;
    
    memoriaRAM #(.RAMFILE(RAMFILE)) DUT(
        .Clk (Clk),
        .Direccion_Dato (Direccion_Dato),
        .Entrada_Datos (Entrada_Datos),
        .RW (RW),
        .Datos_Salida (Datos_Salida)
    );
    
//    always #5 Clk <= ~Clk;

initial 
begin
    Clk <= 0;
    Direccion_Dato <= 8'b00000001;
    RW = 0;
    Entrada_Datos <= 8'b11111111;
    #20;
    Direccion_Dato <= 8'b00000010;
    RW = 0;
    Entrada_Datos <= 8'b11100010;
    #20;
    Direccion_Dato <= 8'b00000011;
    RW = 1;
    Entrada_Datos <= 8'b11100011;
    #20;
    Direccion_Dato <= 8'b00000011;
    RW = 0;
    Entrada_Datos <= 8'b000000011;
    #20;
    Direccion_Dato <= 8'b00000101;
    RW = 1;
    Entrada_Datos <= 8'b11111000;
    #20;
    Direccion_Dato <= 8'b00000110;
    RW = 0;
    Entrada_Datos <= 8'b11110000;
    #20;
 end
 initial begin
      //-- Fichero donde almacenar los resultados
      $dumpfile("memoriaRAM_TB.vcd");
      $dumpvars(0, memoriaRAM_TB);
  //    # 100 $display("FIN de la simulacion");
 // $finish;
end

    always@(Clk) 
        #5 Clk <= ~Clk;
 
endmodule
