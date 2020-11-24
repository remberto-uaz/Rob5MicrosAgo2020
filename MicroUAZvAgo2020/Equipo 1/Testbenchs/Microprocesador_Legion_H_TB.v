module Microprocesador_Legion_H_TB(
);
    reg clk,reset;
    reg [8:0] instrucciones;
    reg [7:0] bus_Datos;
    reg [31:0] frec_de_trabajo;
    wire [7:0] direcciones_Instrucciones;
    wire [7:0] direcciones_Datos;
    wire [7:0] bus_Datos_salida;
    wire lectura_Escritura;

    Microprocesador_Legion_H DUT(
        .i_Clk(clk),
        .i_Rst(reset),
        .i_Instrucciones(instrucciones),
        .i_Bus_Datos(bus_Datos),
        .i_Frec_de_trabajo(frec_de_trabajo),
        .o_Direcciones_Instrucciones(direcciones_Instrucciones),
        .o_Direcciones_Datos(direcciones_Datos),
        .o_Bus_Datos(bus_Datos_salida),
        .o_Lectura_Escritura(lectura_Escritura)
    );

    initial
    begin
        clk<=0;
        reset<=1;
        instrucciones<=9'b000101111;//LOAD 1,[101],111
        bus_Datos<=8'b00000011;
        frec_de_trabajo<=2;
        #20 reset<=0;
        #5 clk<=~clk;
        #5 clk<=~clk;
        #5 clk<=~clk;
        instrucciones<=9'b000100100;//LOAD 1,[100],100
        #5 clk<=~clk;
        #5 clk<=~clk;
        instrucciones<=9'b001010100;//LOAD 2,010,[100]
        #5 clk<=~clk;
        #5 clk<=~clk;
        instrucciones<=9'b100000010;//MOVE,000,010
        #5 clk<=~clk;
        #5 clk<=~clk;
        instrucciones<=9'b101101000;//MATH,101,000<-SUMA
        #5 clk<=~clk;
        #5 clk<=~clk;
        instrucciones<=9'b110101001;//JUMP 1,[101],001<-SAVE PC IN R7
        #5 clk<=~clk;
        #5 clk<=~clk;
        instrucciones<=9'b010101111;//STORE 2,[010],111
        #5 clk<=~clk;
    end

    always@(clk) begin
        #5 clk<=~clk;
    end

endmodule