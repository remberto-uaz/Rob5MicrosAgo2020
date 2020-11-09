module Salidas(
    input [2:0] SELEC,
    input [7:0] RX_DATO,
    input [2:0] RY,
    input [7:0] RY_DATO,
    output reg [7:0] DATO_OUT,
    output reg [7:0] DIR_OUT
    );
  reg [2:0] c;
    always@ (SELEC)
    begin
    if(SELEC==3'b101)
    begin
    DIR_OUT<=DATO_OUT;
    c<=DATO_OUT[2:0];
    c<=RY;
    end
    else if(SELEC==3'b110)
    begin
    DATO_OUT<=RY_DATO;
    DIR_OUT<=RX_DATO;
    
 end   
  
 end   
endmodule
