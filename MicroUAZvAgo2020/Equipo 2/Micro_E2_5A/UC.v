module UC(
    input i_Clk,
    input i_Rst,
    input [5:0] iArguments,
    input [1:0] iFlags,
    input [2:0] iCod_op,
    output [2:0] uc_iALU,
    output omath_hab,
    output oh_s,
    output omove,
    output [2:0]oD1,
    output [2:0]oD2,
    output o_sel_LyE,
    output [2:0]o_Lec_RX,
    output [2:0]o_Lec_RY,
    output [2:0]o_Sel_Esc,
    output [7:0] odir_sal
    );
    reg [2:0] op=0;
    reg [7:0] dir_sal=0;
    reg [2:0] Lec_RX=0;
    reg [2:0] Lec_RY=0;
    reg [2:0] D1=0;
    reg [2:0] D2=0;
    reg [2:0] Sel_Esc=0;
    reg sel_LyE=0;
    reg math_hab=0;
    reg h_s=0;
    reg move=0;
    
    always @*
    begin
        if(i_Rst) begin//Reset asincrono
            dir_sal<=8'b00000000;
            Lec_RX <= 3'b000;
            Lec_RY <= 3'b000;
            D1 <= 3'b000;
            D2 <= 3'b000;
            Sel_Esc <= 3'b000;
            sel_LyE <= 0;
            h_s <= 0;
            move <= 0;
            math_hab<=0;
        end
       else begin
            case(iCod_op)
            3'b000: begin
                //LOAD_1
            Lec_RX <= iArguments[5:3];
            Sel_Esc <= iArguments[2:0];
            sel_LyE <= 1;
            
            dir_sal<=8'b00000000;
            Lec_RY <= 3'b000;
            D1 <= 3'b000;
            D2 <= 3'b000;
            h_s <= 0;
            move <= 0;
            math_hab<=0;
                
            end
            endcase
            case(iCod_op)
            3'b001: begin
                //LOAD_2
            Lec_RY <= iArguments[2:0];
            Lec_RX <= iArguments[5:3];
            sel_LyE <= 0;
            
            dir_sal<=8'b00000000;
            Sel_Esc <= 3'b000;
            D1 <= 3'b000;
            D2 <= 3'b000;
            h_s <= 0;
            move <= 0;
            math_hab<=0;
                
            end
            endcase
            case(iCod_op)
            3'b010: begin
                //STORE_1
            Lec_RX <= iArguments[5:3];
            Sel_Esc <= iArguments[2:0];
            sel_LyE <= 0;
            
            dir_sal<=8'b00000000;
            Lec_RY <= 3'b000;
            D1 <= 3'b000;
            D2 <= 3'b000;
            h_s <= 0;
            move <= 0;
            math_hab<=0;
                
            end
            endcase
            case(iCod_op)
            3'b011: begin
                //STORE_2
            Lec_RY <= iArguments[2:0];
            Lec_RX <= iArguments[5:3];
            sel_LyE <= 1;
            
            dir_sal<=8'b00000000;
            Sel_Esc <= 3'b000;
            D1 <= 3'b000;
            D2 <= 3'b000;
            h_s <= 0;
            move <= 0;
            math_hab<=0;
                
            end
            endcase
            case(iCod_op)
            3'b100: begin
                //MOVE
            D1 <= iArguments[5:3];
            D2 <= iArguments[2:0];
            move <= 1;
            
            dir_sal<=8'b00000000;
            Lec_RX <= 3'b000;
            Lec_RY <= 3'b000;
            Sel_Esc <= 3'b000;
            sel_LyE <= 0;
            h_s <= 0;
            math_hab<=0;
                
            end
            endcase
            case(iCod_op)
            3'b101: begin
                //MATH
            op <= iArguments[2:0];
            math_hab<=1;
            
            dir_sal<=8'b00000000;
            Lec_RX <= 3'b000;
            Lec_RY <= 3'b000;
            D1 <= 3'b000;
            D2 <= 3'b000;
            Sel_Esc <= 3'b000;
            sel_LyE <= 0;
            h_s <= 0;
            move <= 0;
                
            end
            endcase
            case(iCod_op)
            3'b110: begin
                //JUMP
            dir_sal<=iArguments[2:0];
            h_s <= 1;
            
            Lec_RX <= 3'b000;
            Lec_RY <= 3'b000;
            D1 <= 3'b000;
            D2 <= 3'b000;
            Sel_Esc <= 3'b000;
            sel_LyE <= 0;
            move <= 0;
            math_hab<=0;

            end
            endcase
            case(iCod_op)
            3'b111: begin
                //No Operation
                
            end
            endcase
       end
    end
endmodule