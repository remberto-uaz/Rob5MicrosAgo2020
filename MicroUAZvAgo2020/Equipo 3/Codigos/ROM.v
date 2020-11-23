`timescale 1ns / 1ps

module ROM(
    input [7:0] Address_Instruction_Bus,
    output[8:0] Instruction
    );
    
    reg [8:0] memROM[0:255];
    assign Instruction = memROM[Address_Instruction_Bus];
       initial
           $readmemb("ROM.mem",memROM); 
endmodule