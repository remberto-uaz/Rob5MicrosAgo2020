module Deco_binario_7seg_TB(
);
    reg [3:0] bits;
    wire [6:0] segmentos;
    Deco_binario_7seg DUT (
        .i_Bits(bits),
        .o_Segmentos (segmentos)
    );
initial begin
    bits<=4'b0000;
    #20;
    bits<=4'b0001;
    #20;
    bits<=4'b0010;
    #20;
    bits<=4'b0011;
    #20;
    bits<=4'b0100;
    #20;
    bits<=4'b0101;
    #20;
    bits<=4'b0110;
    #20;
    bits<=4'b0111;
    #20;
    bits<=4'b1000;
    #20;
    bits<=4'b1001;
    #20; 
    bits<=4'b1010;
    #20;
    bits<=4'b1011;
    #20;
    bits<=4'b1100;
    #20;
    bits<=4'b1101;
    #20;
    bits<=4'b1110;
    #20;
    bits<=4'b1111;
    #20;
    end
endmodule
