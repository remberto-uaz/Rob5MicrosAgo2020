`timescale 1ns / 1ps

module Flags(
    input [2:0] FLAG_IN,
    input clk,
    input reset,
    input [2:0] HAB,
    output reg [2:0] FLAG_OUT
    );
always@(posedge clk, posedge reset)
    begin
        if (reset == 1)
            FLAG_OUT <= 3'b000;
        else
            if(HAB == 001)
                FLAG_OUT <= FLAG_IN;
    end
endmodule
