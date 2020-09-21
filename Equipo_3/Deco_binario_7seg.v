module Deco_binario_7seg(                //nombre del módulo
  input [3:0] i_Bits,                    //entrada de 4 bits llamada i_bits
  output reg [6:0] o_Segmentos           //salida de 7 bits llamada o_segmentos
  );
  always@(i_Bits)                        //función que se ejecuta en forma de bucle
  begin                                  //Se engloba el proceso en un bloque
    case(i_Bits)  //catodos     abcdefg  //case para que segun el valor de i_bits se asignará cierto valor a o_segmentos
      4'b0000: o_Segmentos = 7'b1111110; //0
      4'b0001: o_Segmentos = 7'b0110000; //1
      4'b0010: o_Segmentos = 7'b1101101; //2
      4'b0011: o_Segmentos = 7'b1101101; //3
      4'b0100: o_Segmentos = 7'b0110011; //4
      4'b0101: o_Segmentos = 7'b1011011; //5
      4'b0110: o_Segmentos = 7'b1011111; //6
      4'b0111: o_Segmentos = 7'b1110000; //7
      4'b1000: o_Segmentos = 7'b1111111; //8
      4'b1001: o_Segmentos = 7'b1110011; //9
      4'b1010: o_Segmentos = 7'b1110111; //A
      4'b1011: o_Segmentos = 7'b0011111; //b
      4'b1100: o_Segmentos = 7'b1001110; //C
      4'b1101: o_Segmentos = 7'b0111101; //d
      4'b1110: o_Segmentos = 7'b1001111; //E
      4'b1111: o_Segmentos = 7'b1000111; //F
      default: o_Segmentos = 7'b0000000; //Por defecto estén apagados
    endcase                              //se cierra el case
  end                                    //termina el bloque
endmodule                                //termina el módulo
