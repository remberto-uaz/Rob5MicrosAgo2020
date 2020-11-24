module Unidad_de_Saltos_TB(
    );
    reg Clk_tb;
    reg Rst_tb;
    reg [7:0] Direccion_de_Salto_tb;
    reg [2:0] Banderas_tb;
    reg [3:0] Condicion_tb;
    wire  [7:0] o_Bus_Direcciones_Instrucciones_tb;
    
    Unidad_de_Saltos DUT (
        .Clk(Clk_tb),
        .Rst(Rst_tb),
        .Direccion_de_Salto(Direccion_de_Salto_tb),
        .Banderas(Banderas_tb),
        .Condicion(Condicion_tb),
        .o_Bus_Direcciones_Instrucciones(o_Bus_Direcciones_Instrucciones_tb)  
    );
    initial
    begin
        Clk_tb<=0;
        Rst_tb<=1;
        Direccion_de_Salto_tb <= 8'b00000111;
        Banderas_tb <= 3'b110; //Bandera de N y C activas
        Condicion_tb <= 4'b0000; // Condicion inhabilitada 
        #10; 
        Rst_tb<=0;
        #10;
        Condicion_tb <= 4'b1000; //Evaluar condicion 0
        #10;
        Direccion_de_Salto_tb <= 8'b00000100;
        Condicion_tb <= 4'b1001; //Evaluar condicion 1
        #10;
        Direccion_de_Salto_tb <= 8'b00001000;
        Banderas_tb <= 3'b001; //Bandera Z activa
        Condicion_tb <= 4'b1010; //Evaluar condicion 2
        #10;
        Direccion_de_Salto_tb <= 8'b00000010;
        Condicion_tb <= 4'b1011; //Evaluar condicion 3;
        #10;
        Direccion_de_Salto_tb <= 8'b0001111;
        Banderas_tb <= 3'b010; //Bandera C activa
        Condicion_tb <= 4'b1100; //Evaluar condicion 4;
        #10;
        Direccion_de_Salto_tb <= 8'b00110010;
        Condicion_tb <= 4'b1101; //Evaluar condicion 5;
        #10;
        Condicion_tb <= 4'b1110; //Evaluar condicion 6;
        #10;
        Condicion_tb <= 4'b1111; //Evaluar condicion 7;
        #10;
        Condicion_tb <= 4'b0000; // Condicion inhabilitada 
    end
    always@(Clk_tb) begin
        #5 Clk_tb<=~Clk_tb;
    end        
endmodule