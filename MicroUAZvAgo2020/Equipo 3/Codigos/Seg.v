`timescale 1ns / 1ps

module Seg(
    input [8:0] Instruction,
    output [2:0] Inst,
    output [2:0] RX,
    output [2:0] RY
    );

    assign Inst = Instruction[8:6];
    assign RX = Instruction[5:3];
    assign RY = Instruction[2:0];
endmodule
