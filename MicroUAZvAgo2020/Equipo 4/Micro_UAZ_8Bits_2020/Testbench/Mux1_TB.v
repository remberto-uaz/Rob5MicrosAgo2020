module Mux1_TB(
);
	reg [7:0] Datos_0;   
	reg [7:0] Datos_1;
	reg [7:0] Datos_2;
	reg [7:0] Datos_3;
	reg [7:0] Datos_4;
	reg [2:0] Sel;
	wire [7:0] Salida;
	Mux1 DUT(
		.Resultado(Datos_3),  
		.Num8b(Datos_2),
		.i_Bus_Datos_E(Datos_1),
		.Guardar_PC(Datos_0),
		.Mover(Datos_4),
		.Selec(Sel),
		.Dat(Salida)
	);
	initial 
	begin
		Datos_0<=8'b00010000; //Guardar_PC = 16
		Datos_1<=8'b00100000; //i_Bus_Datos_E = 32
		Datos_2<=8'b00000011; //Num8b = 3
		Datos_3<=8'b11000000; //Resultado = 192
		Datos_4<=8'b11110000; //Mover = 240
		Sel <= 3'b000; //Direcciona Guardar_PC a la salida
		#50;
		Sel <= 3'b001; //Direcciona i_Bus_Datos_E a la salida
		#50;
		Sel <= 3'b010; //Direcciona Num8b a la salida
		#50;
		Sel <= 3'b011; //Direcciona Resultado a la salida
		#50;
		Sel <= 3'b100; //Direcciona Mover a la salida
		#50;
        Sel <= 3'b101; //Direcciona un 0 a la salida
        #50;
        Sel <= 3'b110; //Direcciona un 0 a la salida
        #50;
        Sel <= 3'b001; //Direcciona i_Bus_Datos_E a la salida
                
	end
endmodule