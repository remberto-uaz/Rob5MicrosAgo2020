module Deco_binario_7seg_TB(

);
    reg [3:0] bits;
    wire [6:0] segmentos;
    Deco_binario_7seg DUT (
        .i_bits(bits),
        .o_segmentos (segmentos)
    );
