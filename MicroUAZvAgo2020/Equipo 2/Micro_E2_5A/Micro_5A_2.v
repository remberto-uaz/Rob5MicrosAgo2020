module Micro_5A_2
      ( input i_Clk,
        input i_Rst,
        input [8:0] i_Instruction,
        input [7:0] i_Data_bus,
        output [7:0] Address_Instruction_Bus,
        output [7:0] DataOut_Bus,
        output [7:0] Address_Data_Bus);
    
    
    wire [7:0] di_sa;
    wire  h_s;
    wire  ma_ha;
    wire [7:0] ALU_RD;
    wire [2:0] cod_op;
    wire [2:0] UC_RD;
    wire [2:0] UC_ALU;
    wire [7:0] RD_RX;
    wire [7:0] RD_RY;
    wire [1:0] Flags;
    wire [1:0] arguments;
    wire [2:0] d1;
    wire [2:0] d2;
    wire s_LyE;
    wire mov;
    wire [2:0] l_RX;
    wire [2:0] l_RY;
    wire [2:0] s_esc;
    
    UC Bloque_1(
            .i_Clk(i_Clk),
            .i_Rst(i_Rst),
            .iArguments(arguments),
            .iFlags(Flags),
            .iCod_op(cod_op),
            .omath_hab(ma_ha),
            .oh_s(h_s),
            .omove(mov),
            .oD1(d1),
            .oD2(d2),
            .o_sel_LyE(s_LyE),
            .o_Lec_RX(l_RX),
            .o_Lec_RY(l_RY),
            .o_Sel_Esc(s_esc),
            .odir_sal(di_sa)
    );

    PC Bloque_2(
        .i_Clk(i_Clk),
        .i_Rst(i_Rst),
        .Address_Instruction_Bus(Address_Instruction_Bus),
        .direc_sal(di_sa),
        .hab_sal(h_s)
    );

    RI Bloque_3(
        .i_Clk(i_Clk),
        .i_Rst(i_Rst),
        .i_Instruction(i_Instruction),
        .oInstruction(cod_op),
        .oArguments(arguments)
    );

    RD Bloque_4(
        .i_Clk(i_Clk),
        .i_Rst(i_Rst),
        .i_Data_bus(i_Data_bus),
        .move(mov),
        .D1(d1),
        .D2(d2),
        .i_sel_LyE(s_LyE),
        .i_Lec_RX(l_RX),
        .i_Lec_RY(l_RY),
        .i_Sel_Esc(s_esc),
        .rd_oRX(RD_RX),
        .rd_oRY(RD_RY),
        .DataOut_Bus(DataOut_Bus),
        .Address_Data_Bus(Address_Data_Bus)
    );
    
    ALU Bloque_5(
        .uc_iALU(UC_ALU),
        .rd_iRX(RD_RX),
        .rd_iRY(RD_RY),
        .math_hab(ma_ha),
        .oALU_flags(Flags),
        .oALU_rd(ALU_RD)
    );
   
endmodule