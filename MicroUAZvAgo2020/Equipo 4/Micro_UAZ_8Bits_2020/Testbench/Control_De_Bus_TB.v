module Control_de_Bus_TB(
);
    reg Clk_tb;
    reg Rst_tb;
    reg [1:0] Control_Salida_tb;
    reg [7:0] Num8b_tb;
    reg [7:0] RX_tb;
    reg [7:0] RY_tb;
    wire [7:0] o_Bus_Datos_S_tb;
    wire [7:0] o_Bus_Direccion_Datos_tb;
    wire o_Lectura_Escritura_tb;
	Control_de_Bus DUT(
	    .Clk(Clk_tb),
	    .Rst(Rst_tb),
		.Control_Salida(Control_Salida_tb),
		.Num8b(Num8b_tb),
		.RX(RX_tb),
		.RY(RY_tb),
		.o_Bus_Datos_S(o_Bus_Datos_S_tb),
		.o_Bus_Direccion_Datos(o_Bus_Direccion_Datos_tb),
		.o_Lectura_Escritura(o_Lectura_Escritura_tb)
	);
	initial 
	begin
	    Clk_tb <= 0;
        Rst_tb <= 1;
        #10 Rst_tb <= 0;
		Num8b_tb <= 8'b00000011; //Num = 3
		RX_tb <= 8'b00001111; //RX = 15
		RY_tb <= 8'b00000001; //RY = 8
		Control_Salida_tb <= 2'b00; //0 en las salidas
		#10;
        Control_Salida_tb <= 2'b01; //RY como direccion
		#10;
        Control_Salida_tb <= 2'b10; //Escribir Num8b en direccion RX
		#10;
		Control_Salida_tb <= 2'b11; //Escribir RY en direccion RX
		#10;
	end
	always@(Clk_tb) begin
        #5 Clk_tb <= ~Clk_tb;
    end
endmodule