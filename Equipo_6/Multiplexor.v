module Multiplexor
    (   input [3:0] i_Datos_1,
	input [3:0] i_Datos_2,
	input [3:0] i_Datos_3,
	input [3:0] i_Datos_4,
	input [1:0] i_Sel,
        output reg [3:0] o_Salida);
		
	always@(i_Sel,i_Datos_1,i_Datos_2,i_Datos_3,i_Datos_4) begin
		case (i_Sel)
			2'b00: o_Salida <= i_Datos_1;
			2'b01: o_Salida <= i_Datos_2;
			2'b10: o_Salida <= i_Datos_3;
			default : o_Salida <= i_Datos_4;
		endcase 
     	end 
    
endmodule 
