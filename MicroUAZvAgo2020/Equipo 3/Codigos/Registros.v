`timescale 1ns / 1ps

module Registros(
    input reset,
    input clk,
    input [2:0] HAB,
    input [2:0] RX,
    input [2:0] RY,
    input [7:0] DATO,
    input [7:0] RESUL,
    input [7:0] PC_VAL,
    output [7:0] RY_DATO,
    output [7:0] RX_DATO,
    output [7:0] R0_DATO
    );
    
    reg [7:0] R[0:7];
    
    assign R0_DATO = R[0];
    assign RX_DATO = R[RX];
    assign RY_DATO = R[RY];

    always@(posedge clk, posedge reset)
        begin
            if(reset == 1)
                begin
                    R[0] <= 8'b00000000;
                    R[1] <= 8'b00000000;
                    R[2] <= 8'b00000000;
                    R[3] <= 8'b00000000;
                    R[4] <= 8'b00000000;
                    R[5] <= 8'b00000000;
                    R[6] <= 8'b00000000;
                    R[7] <= 8'b00000000;
                end
            else
                begin
                    case(HAB)
                        3'b001: R[0] <= RESUL;
                        3'b011: R[7] <= PC_VAL;  
                        3'b100: R[RX] <= DATO;
                        default:
                            begin
                                R[0] <= R[0];
                                R[1] <= R[1];
                                R[2] <= R[2];
                                R[3] <= R[3];
                                R[4] <= R[4];
                                R[5] <= R[5];
                                R[6] <= R[6];
                                R[7] <= R[7];
                            end
                    endcase
                    
                end
        end
endmodule
