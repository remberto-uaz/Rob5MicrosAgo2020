module Unidad_de_Control_TB(
);
	reg Clk_tb;
	reg Rst_tb;
    reg [8:0] i_Instricciones_tb;
	reg [7:0] i_Bus_Datos_E_tb;
	wire [7:0] o_Bus_Datos_S_tb;
    wire [7:0] o_Bus_Direccion_Datos_tb;
    wire o_Lectura_Escritura_tb;
	wire [7:0] o_Bus_Direcciones_Instrucciones_tb;
	
	Micro_UAZ_8Bits_2020 DUT(
		.Clk(Clk_tb),
        .Rst(Rst_tb),
        .i_Instricciones(i_Instricciones_tb),
        .i_Bus_Datos_E(i_Bus_Datos_E_tb),
        .o_Bus_Datos_S(o_Bus_Datos_S_tb),
        .o_Bus_Direccion_Datos(o_Bus_Direccion_Datos_tb),
        .o_Lectura_Escritura(o_Lectura_Escritura_tb),
        .o_Bus_Direcciones_Instrucciones(o_Bus_Direcciones_Instrucciones_tb)
    );
    
    initial
    begin
        Clk_tb<=0;
        Rst_tb<=1;
        #10 Rst_tb<=0;
        i_Instricciones_tb <= 9'b000000001;
        i_Bus_Datos_E_tb <= 8'b00001010;
        #10;
        i_Instricciones_tb <= 9'b000011011;
        #10;
        i_Instricciones_tb <= 9'b100000011;
        #15;
        i_Instricciones_tb <= 9'b001010100;
        #10;
        i_Instricciones_tb <= 9'b010010111;
        #10;
        i_Instricciones_tb <= 9'b101011000;
        #20;
        i_Instricciones_tb <= 9'b110010001;
        #10;
    end
    always@(Clk_tb) begin
        #5 Clk_tb<=~Clk_tb;
    end
endmodule