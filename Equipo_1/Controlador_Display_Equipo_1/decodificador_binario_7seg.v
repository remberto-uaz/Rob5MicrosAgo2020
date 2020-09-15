module decodificador_binario_7seg
    (   input [3:0] i_Entrada,
        output [6:0] o_Salida);
    
    reg [6:0]o_Salida;
   
    @always(i_Entrada)begin
        case (i_Entrada) 
            4'b0000: begin
                o_Salida<=7'b0000001;
                end
            4'b0001: begin
                o_Salida<=7'b1001111;
                end
            4'b0010: begin
                o_Salida<=7'b0010010;
                end
            4'b0011: begin
                o_Salida<=7'b0000110;
                end
            4'b0100: begin
                o_Salida<=7'b1001100;
                end
            4'b0101: begin
                o_Salida<=7'b0100100;
                end
            4'b0110: begin
                o_Salida<=7'b0100000;
                end
            4'b0111: begin
                o_Salida<=7'b0001111;
                end
            4'b1000: begin
                o_Salida<=7'b0000000;
                end
            4'b1001: begin
                o_Salida<=7'b0001100;
                end
            4'b1010: begin
                o_Salida<=7'b0001000;
                end
            4'b1011: begin
                o_Salida<=7'b1100000;
                end
            4'b1100: begin
                o_Salida<=7'b0110001;
                end
            4'b1101: begin
                o_Salida<=7'b1000010;
                end
            4'b1110: begin
                o_Salida<=7'b0110000;
                end
            default: begin
                o_Salida<=7'b0111000;
                 end
        endcase
    end
endmodule
