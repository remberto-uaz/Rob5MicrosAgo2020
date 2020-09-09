module decodificador_binario_7seg
    (   input [3:0] i_Entrada,
        output [6:0] o_Salida);
    
    wire [6:0] s_i;
   
    @always(i_Entrada)begin
        case (i_Entrada) 
            0: begin
                s_i<=1; //0000001
                end
            1: begin
                s_i<=79;//1001111
                end
            2: begin
                s_i<=18;//0010010
                end
            3: begin
                s_i<=6;//0000110
                end
            4: begin
                s_i<=76;//1001100
                end
            5: begin
                s_i<=36;//0100100
                end
            6: begin
                s_i<=32;//0100000
                end
            7: begin
                s_i<=15;//0001111
                end
            8: begin
                s_i<=0;//0000000
                end
            9: begin
                s_i<=12;//0001100
                end
            10: begin
                s_i<=8;//0001000
                end
            11: begin
                s_i<=96;//1100000
                end
            12: begin
                s_i<=49;//0110001
                end
            13: begin
                s_i<=66;//1000010
                end
            14: begin
                s_i<=48;//0110000
                end
            default: begin
                s_i<=56;//0111000
                 end
        endcase
    end
endmodule