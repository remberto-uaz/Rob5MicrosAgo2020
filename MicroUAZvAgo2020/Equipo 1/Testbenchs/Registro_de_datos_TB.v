module Registro_de_datos_TB(
);
    reg clk,reset;
    reg [7:0] datos;
    reg [1:0] lectura_escritura;
    reg [2:0] control_RX,control_RY,seleccion_registro_escritura;
    reg [2:0] seleccion_registro_lectura;
    wire [7:0] RX,RY;

    Registro_de_datos DUT(
        .i_Timming(clk),
        .i_Rst(reset),
        .i_Datos(datos),
        .i_Lectura_escritura(lectura_escritura),
        .i_Control_RX(control_RX),
        .i_Control_RY(control_RY),
        .i_Seleccion_registro_escritura(seleccion_registro_escritura),
        .i_Seleccion_registro_lectura(seleccion_registro_lectura),
        .o_RX(RX),
        .o_RY(RY)
    );

    initial
    begin
        clk<=0;
        reset<=1;
        datos<=8'b11100111;
        lectura_escritura<=2'b00;
        control_RX<=3'b001;
        control_RY<=3'b101;
        seleccion_registro_escritura<=3'b111;
        seleccion_registro_lectura<=3'b100;
        #20 reset<=0;
        #5 clk<=~clk;
        lectura_escritura<=2'b01;
        seleccion_registro_escritura<=3'b001;
        #5 clk<=~clk;
        #5 clk<=~clk;
        datos<=8'b11111111;
        seleccion_registro_escritura<=3'b101;
        lectura_escritura<=2'b01;
        #5 clk<=~clk;
        #5 clk<=~clk;
        lectura_escritura<=2'b00;
        #5 clk<=~clk;
        #5 clk<=~clk;
        lectura_escritura<=2'b10;
        seleccion_registro_lectura<=3'b001;
        seleccion_registro_escritura<=3'b111;
        #5 clk<=~clk;
        #5 clk<=~clk;
        lectura_escritura<=2'b11;
        control_RX<=3'b101;
        control_RY<=3'b111;
        datos<=8'b11111111;
        seleccion_registro_escritura<=3'b010;
    end



endmodule