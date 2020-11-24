module Unidad_de_control_TB(
);
    reg clk,reset;
    reg [2:0] bandera,operation_code;
    reg [5:0] operandos;
    wire senal_de_salto,hab;
    wire [1:0] selector_de_entrada_a_registros,lectura_escritura;
    wire [2:0] control_RX,control_RY,seleccion_registro_escritura;
    wire [2:0] seleccion_registro_lectura,senal_de_control,inst_decodificada;

    Unidad_de_control DUT(
        .i_Timming(clk),
        .i_Rst(reset),
        .i_Bandera(bandera),
        .i_Operation_code(operation_code),
        .i_Operandos(operandos),
        .o_Senal_de_salto(senal_de_salto),
        .o_Selector_de_entrada_a_registros(selector_de_entrada_a_registros),
        .o_Lectura_escritura(lectura_escritura),
        .o_Control_RX(control_RX),
        .o_Control_RY(control_RY),
        .o_Seleccion_registro_escritura(seleccion_registro_escritura),
        .o_Seleccion_registro_lectura(seleccion_registro_lectura),
        .o_Senal_de_control(senal_de_control),
        .o_Inst_decodificada(inst_decodificada),
        .o_Hab(hab)
    );

    initial
    begin
        clk<=0;
        reset<=1;
        bandera<=3'b000;
        operation_code<=3'b010;
        operandos<=6'b111101;
        #20 reset<=0;
        #5 clk<=~clk;
        operation_code<=3'b000;
        operandos<=6'b111101;
        #5 clk<=~clk;
        #5 clk<=~clk;
        operation_code<=3'b001;
        operandos<=6'b111101;
        #5 clk<=~clk;
        #5 clk<=~clk;
        operation_code<=3'b010;
        operandos<=6'b111101;
        #5 clk<=~clk;
        #5 clk<=~clk;
        operation_code<=3'b011;
        operandos<=6'b111101;
        #5 clk<=~clk;
        #5 clk<=~clk;
        operation_code<=3'b100;
        operandos<=6'b111101;
        #5 clk<=~clk;
        #5 clk<=~clk;
        operation_code<=3'b101;
        operandos<=6'b111101;
        #5 clk<=~clk;
        #5 clk<=~clk;
        operation_code<=3'b110;
        operandos<=6'b111101;
        #5 clk<=~clk;
        #5 clk<=~clk;
        bandera<=3'b000;
        operation_code<=3'b111;
        operandos<=6'b001101;
        #5 clk<=~clk;
        #5 clk<=~clk;
        bandera<=3'b100;
        operation_code<=3'b111;
        operandos<=6'b001110;
        #5 clk<=~clk;
        #5 clk<=~clk;
    end


endmodule