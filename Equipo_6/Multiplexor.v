module demx
    (   input [3:0] i_Datos_0,
        input [3:0] i_Datos_1,
        input [3:0] i_Datos_2,
		input [3:0] i_Datos_3,
		input [1:0] i_Sel,
        output [3:0] o_Salida);
		
	always@(i_Sel) begin
        case (i_Sel)
		2'00: o_Salida <= i_Datos_0;
		2'01: o_Salida <= i_Datos_1;
		2'10: o_Salida <= i_Datos_2;
		default : o_Salida <= i_Datos_3;
     end case 
     end 
    
endmodule 