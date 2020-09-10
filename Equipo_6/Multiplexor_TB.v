//`timescale 1ns / 1ps


module Multiplexor_TB(

    );
    
 reg [3:0] Datos_0;   
 reg [3:0] Datos_1;
 reg [3:0] Datos_2;
 reg [3:0] Datos_3;
 reg [1:0] Sel;
 wire [3:0] Salida;
 
 Multiplexor DUT(
     .i_Datos_0(Datos_0),  
     .i_Datos_1(Datos_1),
     .i_Datos_2(Datos_2),
     .i_Datos_3(Datos_3),
     .i_Sel(Sel),
     .Exit(Salida)
 );
 
 initial
begin
  
  Datos_0 <=0;
  Datos_1 <=0;
  Datos_2 <=0;
  Datos_3 <=0;
  Sel <=0;
  #50;
  Datos_0 [0]<=1;
  Datos_1 [1]<=1;
  Datos_2 [2]<=1;
  Datos_3 [3]<=1;
  #50;
  Sel <=0;
  #50;
  Sel [0]<=1;
  Sel [1]<=0;
  #50;
  Sel [0]<=0;
  Sel [1]<=1;
  #50;
  Sel [0]<=1;
  Sel [1]<=1;
  #50;
end
endmodule
