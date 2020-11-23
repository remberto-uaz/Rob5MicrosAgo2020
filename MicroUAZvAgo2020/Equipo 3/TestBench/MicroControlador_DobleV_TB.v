`timescale 1ns / 1ps

module MicroControlador_DobleV_TB;
    reg clk;
    reg reset;
    
    MicroControlador_DobleV DUT(
        .clk(clk),
        .reset(reset)
        );
    
    initial 
        begin
            clk <= 0;
            reset <= 1;
        #5 reset=0;
        end
        
    always@(clk)
        #5 clk <= ~clk; 
endmodule
