module ALU_TB(
);
	reg [7:0] R0_tb; 
	reg [7:0] RX_tb;
    reg [3:0] Operacion_tb;
    wire [7:0] Resultado_tb;
    wire [2:0] Banderas_tb;
	ALU DUT(
		.RX(RX_tb),  
		.R0(R0_tb), 
		.Operacion(Operacion_tb),
		.Resultado(Resultado_tb),
		.Banderas(Banderas_tb)
	);
	initial 
	begin
	    RX_tb <= 8'b00000011; // 3
	    R0_tb <= 8'b00000101; // 5
		Operacion_tb <= 4'b0000; //NO OPERACION
		#50; //50ns
		Operacion_tb <= 4'b1000; //SUMA R0 + RX
		#50; //50ns
		Operacion_tb <= 4'b1001; //RESTA R0 - RX
		#50; //50ns
		Operacion_tb <= 4'b1010; //DESPLAZAMIENTO IZQUIERDA R0 << RX
		#50; //50ns
		Operacion_tb <= 4'b1011; //DESPLAZAMIENTO DERECHA R0 >> RX
		#50; //50ns
        Operacion_tb <= 4'b1100; //NOT ~RX
        #50; //50ns
        Operacion_tb <= 4'b1101; //AND RO&RX
        #50; //50ns
        Operacion_tb <= 4'b1110; //OR R0|RX 
        #50; //50ns
        Operacion_tb <= 4'b1111; //XOR R0^RX       
	end
endmodule