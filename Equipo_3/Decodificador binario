module Deco_binario_7seg(
  input [3:0] i_bits,
  output reg [6:0] o_segmentos
  );
always@(i_bits)
  begin
    case(i_bits)
      0000: o_segmentos = 0000001;
      0001: o_segmentos = 1001111:
      0010: o_segmentos = 0010010;
      0011: o_segmentos = 0000110;
      0100: o_segmentos = 1001100;
      0101: o_segmentos = 0100100;
      0110: o_segmentos = 0100000;
      0111: o_segmentos = 0001111;
      1000: o_segmentos = 0000000;
      1001: o_segmentos = 0001100;
      1010: o_segmentos = 0001000;
      1011: o_segmentos = 0000011;
      1100: o_segmentos = 1000110;
      1101: o_segmentos = 0100001;
      1110: o_segmentos = 0000110;
      1111: o_segmentos = 0001110;
      default: o_segmentos = 1111111;
    end case;
  end;
endmodule;
