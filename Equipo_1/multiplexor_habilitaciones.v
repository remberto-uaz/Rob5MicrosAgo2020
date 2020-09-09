module multiplexor_habilitaciones
    (   input [1:0] i_N_cifra,
        input [3:0] i_Datos1,
        input [3:0] i_Datos2,
        input [3:0] i_Datos3,
        input [3:0] i_Datos4,
        output [3:0] o_Cifra,
        output [3:0] o_Habs);
    @always(i_Ncifra,i_Datos)begin
        case (i_N_cifra) 
            0: begin
                o_Habs<=14;
                o_Cifra<=i_Datos1;
                end
            1: begin
                o_Habs<=13;
                o_Cifra<=i_Datos2;
                end
            2: begin
                o_Habs<=11;
                o_Cifra<=i_Datos3;
                end
            default: begin
                o_Habs<=10;
                o_Cifra<=i_Datos4;
                 end
        endcase
    end
endmodule