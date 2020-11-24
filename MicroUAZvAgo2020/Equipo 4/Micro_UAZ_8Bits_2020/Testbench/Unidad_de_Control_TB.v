module Unidad_de_Control_TB(
);
	reg [8:0] i_Instricciones_tb;
	wire E_N_tb;
    wire [2:0] R_W_tb;
    wire [2:0] Selec_tb;
    wire [2:0] Num_tb;
    wire [3:0] Condicion_tb;
    wire [3:0] Operacion_tb;
	wire [1:0] Control_Salida_tb;
	wire [5:0] RegXY_tb;
	
	Unidad_de_Control DUT(
        .i_Instricciones(i_Instricciones_tb),
        .E_N(E_N_tb),
        .R_W(R_W_tb),
        .Selec(Selec_tb),
        .Num(Num_tb),
        .Condicion(Condicion_tb),
        .Operacion(Operacion_tb),
        .Control_Salida(Control_Salida_tb),
        .RegXY(RegXY_tb)
    );
    
    initial
    begin
        i_Instricciones_tb <= 9'b000000000; //No operacion
        #10;
        i_Instricciones_tb <= 9'b001010100; // Cargar en R2 el #4
        #10;
        i_Instricciones_tb <= 9'b010011101; // Cargar datos de [R5] en R3
        #10;
        i_Instricciones_tb <= 9'b011110111; // Almacenar en [R6] el #7
        #10;
        i_Instricciones_tb <= 9'b100100101; // Almacenar R5 en [R4] 
        #10;
        i_Instricciones_tb <= 9'b101111001; // Mover R1 a R7
        #10;
        i_Instricciones_tb <= 9'b110011001; // Restar R0 menos R3
        #10;
        i_Instricciones_tb <= 9'b111010000; // Saltar Pc a R2 si condicion 0 es verdadera
        #10;
        i_Instricciones_tb <= 9'b000000000; //No operacion
    end
endmodule