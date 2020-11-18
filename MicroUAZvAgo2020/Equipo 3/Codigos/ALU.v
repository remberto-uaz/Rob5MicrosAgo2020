`timescale 1ns / 1ps

module ALU(
    input [7:0] RX_DATO,
    input [7:0] R0_DATO,
    input [2:0] RY,
    output reg [2:0] FLAG_IN,
    output [7:0] RESUL
    );

reg [15:0] VALOR;

assign RESUL = VALOR[7:0];
    always@*
        begin
            case(RY)
                3'b000: VALOR <= R0_DATO + RX_DATO;
                3'b001: VALOR <= R0_DATO - RX_DATO;
                3'b010: VALOR <= R0_DATO << RX_DATO;
                3'b011: VALOR <= R0_DATO >> RX_DATO;
                3'b100: VALOR <= ~RX_DATO;
                3'b101: VALOR <= R0_DATO & RX_DATO;
                3'b110: VALOR <= R0_DATO | RX_DATO;
                3'b111: VALOR <= R0_DATO ^ RX_DATO;
                default: VALOR<= 8'b00000000;
            endcase
            if (VALOR[8] == 1) //CARRY
                FLAG_IN[1] <= 1;
            else FLAG_IN[1] <= 0;
            if (VALOR == 9'b000000000)   //ZERO
                FLAG_IN[2] <= 1;
            else FLAG_IN[2] <= 0;
            if (VALOR[7] == 1'b1)       //SIGN
                FLAG_IN[0] <= 1;
            else FLAG_IN[0] <= 0;
        end
endmodule
