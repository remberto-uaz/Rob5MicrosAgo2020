`timescale 1ns / 1ps

module Flags_TB(
    );
    
    reg [2:0] FLAG_IN;
    reg clk;
    reg reset;
    reg [2:0] HAB;
    wire[2:0] FLAG_OUT;
    
    Flags DUT(
        .FLAG_IN(FLAG_IN),
        .clk(clk),
        .reset(reset),
        .HAB(HAB),
        .FLAG_OUT(FLAG_OUT)
    );
    
    initial
        begin
            clk<=0;
            reset<=1;
            #10 reset <= 0;
            #10 FLAG_IN <= 3'b000; HAB <= 3'b000;
            #10 FLAG_IN <= 3'b111; HAB <= 3'b000;
            #10 FLAG_IN <= 3'b111; HAB <= 3'b001;
            #10 FLAG_IN <= 3'b100; HAB <= 3'b001;
            #10 FLAG_IN <= 3'b000; HAB <= 3'b000;
        end
    always@(clk)
        #5 clk <= ~clk;
endmodule
