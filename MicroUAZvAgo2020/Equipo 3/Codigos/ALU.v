`timescale 1ns / 1ps

module ALU(
    input [7:0] RX_DATO,
    input [7:0] R0_DATO,
    input [2:0] RY,
    output reg [2:0] FLAG_IN,
    output [7:0] RESUL
    );
reg [8:0] VALOR;
wire BIT;
assign RESUL = VALOR[7:0];
assign BIT = VALOR[8];
    always@(RX_DATO, R0_DATO, RY)
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
            if (BIT ==1)
                FLAG_IN <= FLAG_IN | 010;
            if (RESUL == 00000000)
                FLAG_IN <= FLAG_IN | 100;
            if (RESUL < 00000000)
                FLAG_IN <= FLAG_IN | 001;
        end
endmodule