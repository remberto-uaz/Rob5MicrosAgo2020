//Este componente permitira pasar la cadena de datos entrante de un formato
//binario al formato de 7 segmentos que es el que maneja el display haciendo
//uso de las equivalencias de una tabla de conversiones s fromato 7 seg de 
//anodo comun. Es un componente meramente combinacional
module Deco_binario_7seg(
    input [3:0] i_Bits,
    output reg [6:0] o_Segmentos//Se establece como registro
                                //para poder trabajar con 
                                //ella en el always
  );

    //La unica señal en la lista de sensitividad es la entrada
    //i_Bits
    always@(i_Bits)
    begin
    //Dependiendo del valor de i_Bits sera la conversion que se 
    //pasara a la salida
        case(i_Bits)
            4'b0000: o_Segmentos <= 7'b0000001;//0
            4'b0001: o_Segmentos <= 7'b1001111;//1
            4'b0010: o_Segmentos <= 7'b0010010;//2
            4'b0011: o_Segmentos <= 7'b0000110;//3
            4'b0100: o_Segmentos <= 7'b1001100;//4
            4'b0101: o_Segmentos <= 7'b0100100;//5
            4'b0110: o_Segmentos <= 7'b0100000;//6
            4'b0111: o_Segmentos <= 7'b0001111;//7
            4'b1000: o_Segmentos <= 7'b0000000;//8
            4'b1001: o_Segmentos <= 7'b0001100;//9
            4'b1010: o_Segmentos <= 7'b0001000;//a
            4'b1011: o_Segmentos <= 7'b1100000;//b
            4'b1100: o_Segmentos <= 7'b0110001;//c
            4'b1101: o_Segmentos <= 7'b1000010;//d
            4'b1110: o_Segmentos <= 7'b0110000;//e
            4'b1111: o_Segmentos <= 7'b0111000;//f
            default: o_Segmentos <= 7'b0000000;//0
        endcase
    end
endmodule