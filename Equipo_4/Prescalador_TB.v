module Prescalador_TB(

);

reg clk;
reg reset;
wire clk_out;

Prescalador DUT (
  .i_clock(clk),
  .i_reset(reset),
  .o_presc(clk_out)
);

initial
begin
  clk<=0;
  reset<=1;
  #20 reset<=0;
end

always@(clk)
  #5 clk <= ~clk;

endmodule
