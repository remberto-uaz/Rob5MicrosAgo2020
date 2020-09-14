module multiplexor_habilitaciones
    (   input [1:0] i_N_cifra,
        input [3:0] i_Datos1,
        input [3:0] i_Datos2,
        input [3:0] i_Datos3,
        input [3:0] i_Datos4,
        output [3:0] o_Cifra,
        output [3:0] o_Habs);

    reg [3:0] o_Cifra;
    reg [3:0] o_Habs 
      
    @always(i_Ncifra,i_Datos)begin
        case (i_N_cifra) 
            2'b00: begin
                o_Habs<=4'b1110;
                o_Cifra<=i_Datos1;
                end
            2'b01: begin
                o_Habs<=4'b1101;
                o_Cifra<=i_Datos2;
                end
            2'b10: begin
                o_Habs<=4'b1011;
                o_Cifra<=i_Datos3;
                end
            default: begin
                o_Habs<=4'b0111;
                o_Cifra<=i_Datos4;
                end
        endcase
    end
endmodule