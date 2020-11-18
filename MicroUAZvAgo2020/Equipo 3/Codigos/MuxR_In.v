`timescale 1ns / 1ps

module MuxR_In(
    input [2:0] RY,
    input [7:0] RY_DATO,
    input [7:0] DATO_IN,
    input [2:0] SELEC,
    output reg [7:0] DATO
    );
    
    always@* begin
        case(SELEC)
            3'b001: DATO <= {5'b00000,RY};
            3'b010: DATO <= RY_DATO;
            3'b011: DATO <= DATO_IN;
            default: DATO <= 8'b00000000;
        endcase
    end
    
    
endmodule
