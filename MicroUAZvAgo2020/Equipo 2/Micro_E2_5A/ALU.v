module ALU(
    input [2:0] uc_iALU,
    input [7:0] rd_iRX,
    input [7:0] rd_iRY,
    input math_hab,
    output [2:0] oALU_flags,
    output [7:0] oALU_rd
    );
    reg [7:0] Res=0;
    always@(*)
        begin
          case(math_hab)
          1'b0: Res = rd_iRY;
          1'b1:
             case(uc_iALU)
                3'b000: Res <= rd_iRY + rd_iRX;
                3'b001: Res <= rd_iRY - rd_iRX;
                3'b010: Res <= rd_iRY << rd_iRX;
                3'b011: Res <= rd_iRY >> rd_iRX;
                3'b100: Res <= ~rd_iRX;
                3'b101: Res <= rd_iRY & rd_iRX;
                3'b110: Res <= rd_iRY | rd_iRX;
                3'b111: Res <= rd_iRY ^ rd_iRX;
            endcase
          endcase
        end
            assign oALU_rd = Res; 
            assign oALU_flags[0] = &(~Res);
            assign oALU_flags[1] = Res[8];
            assign oALU_flags[2] = Res[7];  
endmodule