//`timescale 1ns / 1ps
module Prescalador_TB(

);

reg clk;
reg reset;
wire exit;

Prescalador DUT (
  .i_clock(clk),
  .i_reset(reset),
  .o_presc(exit)
);

initial
begin
  clk<=0;
  reset<=1;
  #20 reset<=0;
  #1000;
end

always@(clk)
  #5 clk <= ~clk;

endmodule