`timescale 1ns / 1ps

module Jump(
    input [2:0] FLAG_OUT,
    input [2:0] RY,
    output reg[1:0] COND
    );
    always@(FLAG_OUT,RY)
            begin
                case(RY)
                    3'b000: COND <= 2'b01;
                    3'b001: COND <= 2'b11;
                    3'b010:
                        begin
                            if (FLAG_OUT[2] == 1)
                                COND <= 2'b01;
                            else
                                COND <= 2'b00;
                        end
                    3'b011:
                        begin
                            if (FLAG_OUT[2] == 0)
                                COND <= 2'b01;
                            else
                                COND <= 2'b00;
                        end
                    3'b100:
                        begin
                            if (FLAG_OUT[1] == 1)
                                COND <= 2'b01;
                            else
                                COND <= 2'b00;
                        end
                    3'b101:
                        begin
                            if (FLAG_OUT[1] == 0)
                                COND <= 2'b01;
                            else
                                COND <= 2'b00;
                        end
                    3'b110:
                        begin
                            if (FLAG_OUT[0] == 1)
                                COND <= 2'b01;
                            else
                                COND <= 2'b00;
                        end
                    3'b111:
                        begin
                            if (FLAG_OUT[0] == 0)
                                COND <= 2'b01;
                            else
                                COND <= 2'b00;
                        end
                    default:
                        begin
                            COND <= 2'b00;
                        end
                endcase
            end
endmodule

