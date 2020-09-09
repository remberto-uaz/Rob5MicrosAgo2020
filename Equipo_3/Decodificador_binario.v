module Deco_binario_7seg(
  input [3:0] i_bits,
  output reg [6:0] o_segmentos
  );
always@(i_bits)
  begin
    case(i_bits)
      4'b0000: o_segmentos = 7'b0000001;
      4'b0001: o_segmentos = 7'b1001111:
      4'b0010: o_segmentos = 7'b0010010;
      4'b0011: o_segmentos = 7'b0000110;
      4'b0100: o_segmentos = 7'b1001100;
      4'b0101: o_segmentos = 7'b0100100;
      4'b0110: o_segmentos = 7'b0100000;
      4'b0111: o_segmentos = 7'b0001111;
      4'b1000: o_segmentos = 7'b0000000;
      4'b1001: o_segmentos = 7'b0001100;
      4'b1010: o_segmentos = 7'b0001000;
      4'b1011: o_segmentos = 7'b0000011;
      4'b1100: o_segmentos = 7'b1000110;
      4'b1101: o_segmentos = 7'b0100001;
      4'b1110: o_segmentos = 7'b0000110;
      4'b1111: o_segmentos = 7'b0001110;
      default: o_segmentos = 7'b1111111;
    end case;
  end;
endmodule;
