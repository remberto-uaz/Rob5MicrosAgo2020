module Deco_binario_7seg(                //nombre del módulo
  input [3:0] i_bits,                    //entrada de 4 bits llamada i_bits
  output reg [6:0] o_segmentos           //salida de 7 bits llamada o_segmentos
  );
  always@(i_bits)                        //función que se ejecuta en forma de bucle
  begin                                  //Se engloba el proceso en un bloque
    case(i_bits)                         //case para que segun el valor de i_bits se asignará cierto valor a o_segmentos
      4'b0000: o_segmentos = 7'b0000001; //0
      4'b0001: o_segmentos = 7'b1001111; //1
      4'b0010: o_segmentos = 7'b0010010; //2
      4'b0011: o_segmentos = 7'b0000110; //3
      4'b0100: o_segmentos = 7'b1001100; //4
      4'b0101: o_segmentos = 7'b0100100; //5
      4'b0110: o_segmentos = 7'b0100000; //6
      4'b0111: o_segmentos = 7'b0001111; //7
      4'b1000: o_segmentos = 7'b0000000; //8
      4'b1001: o_segmentos = 7'b0000100; //9
      4'b1010: o_segmentos = 7'b0001000; //A
      4'b1011: o_segmentos = 7'b1100000; //b
      4'b1100: o_segmentos = 7'b0110001; //C
      4'b1101: o_segmentos = 7'b1000010; //d
      4'b1110: o_segmentos = 7'b0110000; //E
      4'b1111: o_segmentos = 7'b0111000; //F
      default: o_segmentos = 7'b1111111; //Por defecto estén apagados
    endcase                              //se cierra el case
  end                                    //termina el bloque
endmodule                                //termina el módulo
