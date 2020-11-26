module RD(
    input i_Clk,
    input i_Rst,
    input [7:0] i_Data_bus,
    input move,
    input [2:0] D1,
    input [2:0] D2,
    input i_sel_LyE,
    input [2:0] i_Lec_RX,
    input [2:0] i_Lec_RY,
    input [2:0] i_Sel_Esc,
    output [7:0] rd_oRX,
    output [7:0] rd_oRY,
    output [7:0] DataOut_Bus,
    output [7:0] Address_Data_Bus);
    
    reg [7:0] RX;
    reg [7:0] RY;
    reg [7:0] R[7:0];

    always@(posedge i_Rst, posedge i_Clk)
    begin
        if (i_Rst) begin
            R[0]<=0;
            R[1]<=0;
            R[2]<=0;
            R[3]<=0;
            R[4]<=0;
            R[5]<=0;
            R[6]<=0;
            R[7]<=0;
        end
        else begin
        if(move) begin
        R[D1] <= R[D2];
        end
        else begin
        end
            case (i_sel_LyE)
                //Lectura
                1'b0: begin
                    case (i_Lec_RX)
                        3'b000: RX<=R[0];
                        3'b001: RX<=R[1];
                        3'b010: RX<=R[2];
                        3'b011: RX<=R[3];
                        3'b100: RX<=R[4];
                        3'b101: RX<=R[5];
                        3'b110: RX<=R[6];
                        3'b111: RX<=R[7];
                        default: RX<=8'b00000000;
                    endcase
                    
                    case (i_Lec_RY)
                        3'b000: RY<=R[0];
                        3'b001: RY<=R[1];
                        3'b010: RY<=R[2];
                        3'b011: RY<=R[3];
                        3'b100: RY<=R[4];
                        3'b101: RY<=R[5];
                        3'b110: RY<=R[6];
                        3'b111: RY<=R[7];
                        default: RY<=8'b00000000;
                    endcase
                end
                
                //Escritura
                1'b1: begin
                    case (i_Sel_Esc)
                        3'b000: R[0]<=i_Data_bus;
                        3'b001: R[1]<=i_Data_bus;
                        3'b010: R[2]<=i_Data_bus;
                        3'b011: R[3]<=i_Data_bus;
                        3'b100: R[4]<=i_Data_bus;
                        3'b101: R[5]<=i_Data_bus;
                        3'b110: R[6]<=i_Data_bus;
                        default: R[7]<=i_Data_bus;
                    endcase
                end
            endcase
        end
    end
    assign rd_oRX = RX;
    assign rd_oRY = RY;    
    assign DataOut_Bus = RX;
    assign Address_Data_Bus = RY;
endmodule