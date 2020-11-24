//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.11.2020 18:26:45
// Design Name: 
// Module Name: memooriaROM_TB
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


module memooriaROM_TB(
    );
    
    parameter ROMFILE = "Instrucciones.mem";
    reg Clk;
    reg [7:0] Direccion_Instrucciones;
    wire [8:0] Instruccion;
    
    ROM #(.ROMFILE(ROMFILE)) DUT(
        .Clk (Clk),
        .Direccion_Instrucciones (Direccion_Instrucciones),
        .Instruccion (Instruccion)
    );
    
//    always #5 Clk <= ~Clk;

initial 
begin
    Clk <= 0;
    Direccion_Instrucciones <= 8'b00000001;
    #20;
    Direccion_Instrucciones <= 8'b00000010;
    #20;
    Direccion_Instrucciones <= 8'b00000011;
    #20;
    Direccion_Instrucciones <= 8'b00000100;
    #20;
    Direccion_Instrucciones <= 8'b00000101;
    #20;
    Direccion_Instrucciones <= 8'b00000110;
    #20;
 end
 initial begin
      //-- Fichero donde almacenar los resultados
      $dumpfile("memooriaROM_TB.vcd");
      $dumpvars(0, memooriaROM_TB);
  //    # 100 $display("FIN de la simulacion");
 // $finish;
end

    always@(Clk) 
        #5 Clk <= ~Clk;

endmodule
