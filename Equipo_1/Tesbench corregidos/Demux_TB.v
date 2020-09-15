module Demx_TB(
);
  reg [3:0] datos_0;
  reg [3:0] datos_1;
  reg [3:0] datos_2;
  reg [3:0] datos_3;
  reg [1:0] sel;
  wire [3:0] salida;

Demx DUT(
    .i_Datos1(datos_0),
    .i_Datos2(datos_1),
    .i_Datos3(datos_3),
    .i_Datos4(sel),
    .i_Sel(sel),
    .o_Salida(salida)
);

initial begin
    datos_0<=4'b0100;
    datos_1<=4'b1000;
    datos_2<=4'b1100;
    datos_3<=4'b1111;
    sel<=2'b00; #50
    sel <= 2'b00; #50 
    sel <= 2'b01; #50 
    sel <= 2'b10; #50 
    sel <= 2'b11;
  end

endmodule
