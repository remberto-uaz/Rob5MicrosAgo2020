`timescale 1ns / 1ps

module PC_TB(
    );
    reg clk;
    reg reset;
    reg DONE;
    reg [7:0] RX_DATO;
    reg [2:0] HAB;
    wire[7:0] PC_VAL;
    
    PC DUT(
        .clk(clk),
        .reset(reset),
        .DONE(DONE),
        .RX_DATO(RX_DATO),
        .HAB(HAB),
        .PC_VAL(PC_VAL)
    );
    
    initial
        begin
            clk <= 0;
            reset<=1;
            DONE <= 1'b0; RX_DATO <= 8'b00000000; HAB <= 3'b000;
            #10 reset <= 0;
            //Incremento
            #10 DONE <= 1'b1; RX_DATO <= 8'b00000000; HAB <= 3'b000;
            #10 DONE <= 1'b1; RX_DATO <= 8'b00000000; HAB <= 3'b000;
            #10 DONE <= 1'b1; RX_DATO <= 8'b00000000; HAB <= 3'b000;
            #10 DONE <= 1'b1; RX_DATO <= 8'b00000000; HAB <= 3'b000;
            
            //JUMP
            #10 DONE <= 1'b1; RX_DATO <= 8'b01010101; HAB <= 3'b010;
            #10 DONE <= 1'b1; RX_DATO <= 8'b11001100; HAB <= 3'b011;
            #10 DONE <= 1'b0; RX_DATO <= 8'b00000000; HAB <= 3'b000;
        end
    always@(clk)
        #5 clk <= ~clk;
endmodule
