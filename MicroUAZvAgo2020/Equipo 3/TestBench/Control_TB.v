`timescale 1ns / 1ps
 
 module Control_TB(
    );
    reg [2:0] Inst;
    reg [1:0] COND;
    wire RW;
    wire [2:0] SELEC;
    wire DONE;
    wire [2:0] HAB;
    
    Control DUT(
        .Inst(Inst),
        .COND(COND),
        .RW(RW),
        .SELEC(SELEC),
        .DONE(DONE),
        .HAB(HAB)
    );
    
    initial
        begin
            Inst <= 3'b000; COND <= 2'b00;
            #10 Inst <= 3'b001; COND <= 2'b00;
            #10 Inst <= 3'b010; COND <= 2'b00;
            #10 Inst <= 3'b011; COND <= 2'b00;
            #10 Inst <= 3'B100; COND <= 2'b00;
            #10 Inst <= 3'b101; COND <= 2'b00;
            #10 Inst <= 3'b110; COND <= 2'b00;
            
            #10 Inst <= 3'b111; COND <= 2'b00;
            #10 Inst <= 3'b111; COND <= 2'b01;
            #10 Inst <= 3'b111; COND <= 2'b11;
            #10 Inst <= 3'b000; COND <= 2'b00;
        end
endmodule
