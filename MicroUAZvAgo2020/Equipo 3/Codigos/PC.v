`timescale 1ns / 1ps

module PC(
    input clk,
    input reset,
    input DONE,
    input [7:0] RX_DATO,
    input [2:0] HAB,
    output reg [7:0] PC_VAL
    );
    
always@(posedge clk, posedge reset)
    begin
        if(reset == 1)
                PC_VAL <= 8'b00000000;
        else  
           begin
           case(HAB)
                3'b010: PC_VAL<=RX_DATO;
                3'b011: PC_VAL<=RX_DATO;
           endcase
           if(DONE == 1'b1)
                PC_VAL=PC_VAL+1;
           end
       end
endmodule
