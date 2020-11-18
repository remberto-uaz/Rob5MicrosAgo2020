`timescale 1ns / 1ps

module Seg_TB(
    );

    reg [8:0] Instruction;
    wire [2:0] Inst;
    wire [2:0] RX;
    wire [2:0] RY;
    
    Seg DUT(
    .Instruction(Instruction),
    .Inst(Inst),
    .RX(RX),
    .RY(RY)
    );
    
    initial
        begin
            Instruction <= 9'b000000000;
            #10 Instruction <= 9'b001001001;
            #10 Instruction <= 9'b110101110;
            #10 Instruction <= 9'b011001100;
            #10 Instruction <= 9'b111111111;
            #10 Instruction <= 9'b000000000;
        end
endmodule
