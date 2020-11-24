`timescale 1ns / 1ps

module MicroControlador_DobleV(
        input clk,
        input reset,
        output [7:0] DATA_OUT,
        output [7:0] DIR_OUT
    );
    
    wire [8:0] INS;
    wire [7:0] DI_Bus;
    wire [7:0] AI_Bus;
    wire [7:0] AD_Bus;
    wire [7:0] DO_Bus;
    wire R_W;
assign DATA_OUT = DI_Bus;
assign DIR_OUT = AD_Bus;

Microprocesador_DobleV Micro(
    .clk(clk),
    .reset(reset),
    .Instruction(INS),
    .DataIn_Bus(DI_Bus),
    .RW(R_W),
    .Address_Instruction_Bus(AI_Bus),
    .Address_Data_Bus(AD_Bus),
    .DataOut_Bus(DO_Bus)
    );

RAM memRAM(
    .clk(clk),
    .RW(R_W),
    .Address_Data_Bus(AD_Bus),
    .DataOut_Bus(DO_Bus),
    .DataIn_Bus(DI_Bus)
);

ROM memROM(
    .Address_Instruction_Bus(AI_Bus),
    .Instruction(INS)
);
endmodule
