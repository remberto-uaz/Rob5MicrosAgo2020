`timescale 1ns / 1ps

module Control(
    input [2:0] Inst,
    input [1:0] COND,
    output reg RW,
    output reg [2:0] SELEC,
    output reg DONE,
    output reg [2:0] HAB
    );
    
    always @*
    begin
        case(Inst)
            3'b001:
                begin
                    RW <= 1'bz;
                    SELEC <= 001;
                    DONE <= 1;
                    HAB <= 100;
                end
            3'b010:
                begin
                    RW <= 0;
                    SELEC <= 011;
                    DONE <= 1;
                    HAB <= 100;
                end
            3'b011:
                begin
                    RW <= 1;
                    SELEC <= 101;
                    DONE <= 1;
                    HAB <= 000;
                end
            3'b100:
                begin
                    RW <= 1;
                    SELEC <= 110;
                    DONE <= 1;
                    HAB <= 000;
                end
            3'b101:
                begin
                    RW <= 1'bz;
                    SELEC <= 010;
                    DONE <= 1;
                    HAB <= 100;
                end
            3'b110:
                begin
                    RW <= 1'bz;
                    SELEC <= 000;
                    DONE <= 1;
                    HAB <= 001;
                end
            3'b111:
                begin
                    case(COND)
                        2'b01:
                        begin
                            RW <= 1'bz;
                            SELEC <= 000;
                            DONE <= 1;
                            HAB <= 010;
                        end
                        2'b11:
                        begin
                            RW <= 1'bz;
                            SELEC <= 000;
                            DONE <= 1;
                            HAB <= 011;
                        end
                        default:
                        begin
                            RW <= 1'bz;
                            SELEC <= 000;
                            DONE <= 0;
                            HAB <= 000;
                        end
                    endcase
                end
            default:
                begin
                    RW <= 1'bz;
                    SELEC <= 3'b000;
                    DONE <= 1'b0;
                    HAB <= 3'b000;
                end
        endcase
    end
endmodule
