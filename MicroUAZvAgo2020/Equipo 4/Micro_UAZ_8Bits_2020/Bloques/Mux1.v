module Mux1 (  
    input [7:0] Resultado,
    input [7:0] Num8b,
    input [7:0] i_Bus_Datos_E,
    input [7:0] Guardar_PC,
    input [7:0] Mover,
    input [2:0] Selec,
    output reg[7:0] Dat); 
		
    always@(Selec,Resultado,Num8b,i_Bus_Datos_E,Guardar_PC,Mover) 
	begin
		case (Selec)
			3'b000: Dat <= Guardar_PC;
			3'b001: Dat <= i_Bus_Datos_E;
			3'b010: Dat <= Num8b;
			3'b011: Dat <= Resultado;
			3'b100: Dat <= Mover;
			default : Dat <= 0;
		endcase 
    end 
endmodule 
