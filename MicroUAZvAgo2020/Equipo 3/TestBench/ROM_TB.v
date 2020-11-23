`timescale 1ns / 1ps

module ROM_TB(
    );
    
    reg Address_Instruction_Bus;
    wire Instruction;
    
    ROM DUT(
        .Address_Instruction_Bus(Address_Instruction_Bus),
        .Instruction(Instruction)
    );
    
    initial
        begin
            Address_Instruction_Bus <= 8'b00000000;
            #10 Address_Instruction_Bus <= 8'b00000001;
            #10 Address_Instruction_Bus <= 8'b00000010;
            #10 Address_Instruction_Bus <= 8'b00000011;
            #10 Address_Instruction_Bus <= 8'b00000100;
            #10 Address_Instruction_Bus <= 8'b00000101;
            #10 Address_Instruction_Bus <= 8'b00000110;
            #10 Address_Instruction_Bus <= 8'b00000111;
        end
endmodule
