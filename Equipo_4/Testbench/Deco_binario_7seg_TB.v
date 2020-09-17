module Deco_binario_7seg_TB(
);
    reg [3:0] bits;
    wire [6:0] segmentos;
    Deco_binario_7seg DUT (
        .i_Bits(bits),
        .o_Segmentos(segmentos)
    );
    initial 
    begin
        bits<=4'b0000;
        #50;
        bits<=4'b0001;
        #50;
        bits<=4'b0010;
        #50;
        bits<=4'b0011;
        #50;
        bits<=4'b0100;
        #50;
        bits<=4'b0101;
        #50;
        bits<=4'b0110;
        #50;
        bits<=4'b0111;
        #50;
        bits<=4'b1000;
        #50;
        bits<=4'b1001;
        #50;
        bits<=4'b1010;
        #50;
        bits<=4'b1011;
        #50;
        bits<=4'b1100;
        #50;
        bits<=4'b1101;
        #50;
        bits<=4'b1110;
        #50;
        bits<=4'b1111;
        #50;
    end
endmodule