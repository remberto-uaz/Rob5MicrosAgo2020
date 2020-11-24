module Banco_de_Registros_TB(
    );
    reg Clk_tb;
    reg Rst_tb;
    reg [7:0] Dat_tb;
    reg [5:0] RegXY_tb;
    reg [2:0] R_W_tb;
    reg E_N_tb;
    wire [7:0] RX_tb; 
    wire [7:0] RY_tb;
    
    Banco_de_Registros DUT (
        .Clk(Clk_tb),
        .Rst(Rst_tb),
        .Dat(Dat_tb),
        .RegXY(RegXY_tb),
        .R_W(R_W_tb),
        .E_N(E_N_tb),
        .RX(RX_tb),
        .RY(RY_tb)
    );
    
    initial
    begin
        Clk_tb <= 0;
        Rst_tb <= 1;
        #10 Rst_tb <= 0;
        Dat_tb <= 8'b00000101; // Dato a guardar = 5
        RegXY_tb <= 6'b111110; // Salida registros= Mover = R6, Operanto = R7 
        R_W_tb <= 3'b001;      // Escribir en R1
        E_N_tb <= 1;           // Habilitar la escritura
        #10;                        
        Dat_tb <= 8'b00000110; // Dato a guardar = 6
        RegXY_tb <= 6'b001110; // Salida registros= Mover = R6, Operanto = R1 
        R_W_tb <= 3'b010;      // Escribir en R2
        E_N_tb <= 1;           // Habilitar la escritura
        #10;                        
        Dat_tb <= 8'b00000111; // Dato a guardar = 7
        RegXY_tb <= 6'b010010; // Salida registros= Mover = R2, Operanto = R2 
        R_W_tb <= 3'b100;      // Escribir en R4
        E_N_tb <= 1;           // Habilitar la escritura
        #10;                     
        Dat_tb <= 8'b00000011; // Dato a guardar = 3
        RegXY_tb <= 6'b100101; // Leer R4 Y R5 
        R_W_tb <= 3'b110;      // Escribir en R6
        E_N_tb <= 0;           // Deshabilitar la escritura
        #10;                        
        Dat_tb <= 8'b00000111; // Dato a guardar = 7
        RegXY_tb <= 6'b001010; // Leer R1 y R2
        R_W_tb <= 3'b101;      // Escribir en R5
        E_N_tb <= 0;           // Deshabilitar la escritura
    end
    always@(Clk_tb) begin
        #5 Clk_tb <= ~Clk_tb;
    end
    
endmodule