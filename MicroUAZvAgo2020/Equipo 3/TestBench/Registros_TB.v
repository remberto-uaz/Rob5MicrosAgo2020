`timescale 1ns / 1ps

module Registros_TB(
    );
    reg reset;
    reg clk;
    reg [2:0] HAB;
    reg [2:0] RX;
    reg [2:0] RY;
    reg [7:0] DATO;
    reg [7:0] RESUL;
    reg [7:0] PC_VAL;
    wire [7:0] RY_DATO;
    wire [7:0] RX_DATO;
    wire [7:0] R0_DATO;
    
    Registros DUT(
    .reset(reset),
    .clk(clk),
    .HAB(HAB),
    .RX(RX),
    .RY(RY),
    .DATO(DATO),
    .RESUL(RESUL),
    .PC_VAL(PC_VAL),
    .RY_DATO(RY_DATO),
    .RX_DATO(RX_DATO),
    .R0_DATO(R0_DATO)
    );
    initial
            begin
                clk<=0;
                reset<=1;
                HAB <= 3'b000; RX <= 3'b000; RY <= 3'b000; DATO <= 8'b00000000; RESUL <= 8'b00000000; PC_VAL <= 8'b00000000;
                #20 reset<=0;
                #20 HAB <= 3'b100; RX <= 3'b111; RY <= 3'b100; DATO <= 8'b01010101; RESUL <= 8'b00000000; PC_VAL <= 8'b00000000;
                #20 HAB <= 3'b100; RX <= 3'b001; RY <= 3'b110; DATO <= 8'b10101010; RESUL <= 8'b00000000; PC_VAL <= 8'b00000000;
                #20 HAB <= 3'b100; RX <= 3'b100; RY <= 3'b111; DATO <= 8'b00110011; RESUL <= 8'b00000000; PC_VAL <= 8'b00000000;
                #20 HAB <= 3'b001; RX <= 3'b011; RY <= 3'b100; DATO <= 8'b00000000; RESUL <= 8'b11110000; PC_VAL <= 8'b00000000;
                #20 HAB <= 3'b011; RX <= 3'b011; RY <= 3'b100; DATO <= 8'b00000000; RESUL <= 8'b00000000; PC_VAL <= 8'b00001111;
            end
    
    always@(clk)
        #5 clk <= ~clk; 
endmodule
