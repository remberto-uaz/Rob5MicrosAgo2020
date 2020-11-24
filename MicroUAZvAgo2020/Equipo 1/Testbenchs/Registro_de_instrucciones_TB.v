module Registro_de_instrucciones_TB(
);
    reg clk,reset;
    reg [8:0] instrucciones;
    wire [2:0] instruccion;
    wire [5:0] operandos;
    wire [7:0] direccionamiento_inmediato;

    Registro_de_instrucciones DUT(
        .i_Timming(clk),
        .i_Rst(reset),
        .i_Instrucciones(instrucciones),
        .o_Instruccion(instruccion),
        .o_Operandos(operandos),
        .o_Direccionamiento_inmediato(direccionamiento_inmediato)
    );

    initial
    begin
        clk<=0;
        reset<=1;
        instrucciones<=9'b111001110;
        #20 reset<=0;
        #5 clk<=~clk;
        #5 clk<=~clk;
        instrucciones<=9'b011001100;
        #5 clk<=~clk;
        #5 clk<=~clk;
        instrucciones<=9'b010001110;
        #5 clk<=~clk;
        #5 clk<=~clk;
        instrucciones<=9'b100001111;
        #5 clk<=~clk;
        #5 clk<=~clk;
        instrucciones<=9'b000110110;
        #5 clk<=~clk;
        #5 clk<=~clk;
        instrucciones<=9'b001110110;
        #5 clk<=~clk;
        #5 clk<=~clk;
    end



endmodule