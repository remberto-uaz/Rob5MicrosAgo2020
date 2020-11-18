`timescale 1ns / 1ps

module Salidas(
    input [2:0] SELEC,
    input [7:0] RX_DATO,
    input [2:0] RY,
    input [7:0] RY_DATO,
    output reg [7:0] DATO_OUT,
    output reg [7:0] DIR_OUT
    );

always@*
    begin
        case(SELEC)
        3'b011:
            begin
                DIR_OUT <= RY_DATO;
                DATO_OUT <= 8'b00000000;
            end
        3'b101:
            begin
                DIR_OUT <= RX_DATO;
                DATO_OUT <= {5'b00000, RY};
            end
        3'b110:
                begin
                    DIR_OUT <= RX_DATO;
                    DATO_OUT <= RY_DATO;
                end
        default:
            begin
                DIR_OUT <= 8'b00000000;
                DATO_OUT <= 8'b00000000;
            end
        endcase
    end   
endmodule
