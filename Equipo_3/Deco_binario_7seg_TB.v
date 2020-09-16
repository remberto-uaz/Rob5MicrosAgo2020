module Deco_binario_7seg_TB(

);
    reg [3:0] bits;
    wire [6:0] segmentos;
    Deco_binario_7seg DUT (
        .i_bits(bits),
        .o_segmentos (segmentos)
    );
initial begin
    bits<=4'b0000;
    #20;
    bits<=4'b0001;
    #20;
    bits<=4'b0010;
    #20;
    
