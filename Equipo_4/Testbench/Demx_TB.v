module Demx_TB(
);
     reg [3:0] Datos_0;   
     reg [3:0] Datos_1;
     reg [3:0] Datos_2;
     reg [3:0] Datos_3;
     reg [1:0] Sel;
     wire [3:0] Salida;
     Demx DUT(
         .i_Datos_0(Datos_0),  
         .i_Datos_1(Datos_1),
         .i_Datos_2(Datos_2),
         .i_Datos_3(Datos_3),
         .i_Sel(Sel),
         .o_Salida(Salida)
     );
     initial 
     begin
        Datos_0<=4'b0101;
        Datos_1<=4'b0010;
        Datos_2<=4'b0011;
        Datos_3<=4'b0100;
        Sel <= 2'b00; 
        #50;
        Sel <= 2'b01; 
        #50;
        Sel <= 2'b10; 
        #50;
        Sel <= 2'b11; 
        #50;
        Sel <= 2'b00;
     end
endmodule