`timescale 1ns / 1ps

module Salidas_TB(
    );
    reg [2:0] SELEC;
    reg [7:0] RX_DATO;
    reg [2:0] RY;
    reg [7:0] RY_DATO;
    wire [7:0] DATO_OUT;
    wire [7:0] DIR_OUT;
    
    Salidas DUT(
    .SELEC(SELEC),
    .RX_DATO(RX_DATO),
    .RY(RY),
    .RY_DATO(RY_DATO),
    .DATO_OUT(DATO_OUT),
    .DIR_OUT(DIR_OUT)
    );
    initial
        begin
            SELEC <= 3'b000; RX_DATO <= 8'b00000000; RY_DATO <= 8'b00000000; RY <= 3'b000;
            #20 SELEC <= 3'b011; RX_DATO <= 8'b01010101; RY_DATO <= 8'b00110011; RY <= 3'b110;
            #20 SELEC <= 3'b101; RX_DATO <= 8'b10010010; RY_DATO <= 8'b11100011; RY <= 3'b010;
            #20 SELEC <= 3'b110; RX_DATO <= 8'b11001100; RY_DATO <= 8'b00011100; RY <= 3'b001;
        end
endmodule
