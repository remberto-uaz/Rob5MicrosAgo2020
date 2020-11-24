module Micro_UAZ_8Bits_2020(
	input Clk,
	input Rst,
    input [8:0] i_Instricciones,
	input [7:0] i_Bus_Datos_E,
	output [7:0] o_Bus_Datos_S,
    output [7:0] o_Bus_Direccion_Datos,
    output  o_Lectura_Escritura,
	output [7:0] o_Bus_Direcciones_Instrucciones
    );
        
    wire [1:0] Control_Salida;
    wire [2:0] Num;
    wire [2:0] Selec;
    wire [5:0] RegXY;
    wire [2:0]R_W;
    wire E_N;
    wire [3:0] Operacion;
    wire [3:0] Condicion;
    
    wire [7:0] Num8b;
    
    wire [7:0] Resultado;
    wire [7:0] Dat;
    
    wire [7:0] RX;
    wire [7:0] RY;
    
    wire [2:0] Banderas;
    
    
    
    Unidad_de_Control Bloque_1(
        .i_Instricciones(i_Instricciones),
        .Control_Salida(Control_Salida),
        .Num(Num),
        .Selec(Selec),
        .RegXY(RegXY),
        .R_W(R_W),
        .E_N(E_N),
        .Operacion(Operacion),
        .Condicion(Condicion)
    );

    ConNum Bloque_2 (
        .Num(Num),
        .Num8b(Num8b)
    );
    
    Mux1 Bloque_3(
        .Resultado(Resultado),
        .Num8b(Num8b),
        .i_Bus_Datos_E(i_Bus_Datos_E),
        .Guardar_PC(o_Bus_Direcciones_Instrucciones),
        .Mover(RY),
        .Selec(Selec),
        .Dat(Dat)
    );
    
    Banco_de_Registros Bloque_4 (
        .Clk(Clk),
        .Rst(Rst),
        .Dat(Dat),
        .RegXY(RegXY),
        .R_W(R_W),
        .E_N(E_N),
        .RX(RX), 
        .RY(RY)
    );
    
    ALU Bloque_5 (
        .R0(RY),
        .RX(RX),
        .Operacion(Operacion),
        .Resultado(Resultado),
        .Banderas(Banderas)
    );
    
    Unidad_de_Saltos Bloque_6(
        .Clk(Clk),
        .Rst(Rst),
        .Direccion_de_Salto(RX),
        .Banderas(Banderas),
        .Condicion(Condicion),
        .o_Bus_Direcciones_Instrucciones(o_Bus_Direcciones_Instrucciones)
    );
    
    Control_de_Bus Bloque_7 (
        .Clk(Clk),
        .Rst(Rst),
        .Num8b(Num8b),
        .Control_Salida(Control_Salida),
        .RY(RY),
        .RX(RX),
        .o_Bus_Datos_S(o_Bus_Datos_S),
        .o_Bus_Direccion_Datos(o_Bus_Direccion_Datos),
        .o_Lectura_Escritura(o_Lectura_Escritura)
    );
    
endmodule