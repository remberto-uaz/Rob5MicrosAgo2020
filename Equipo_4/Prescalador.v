module Preescalador(
  input i_Clk,
  input i_Rst,
  output o_Presc
  );
  reg [19:0] contador;
  reg salida;
  always@(posedge i_Clk)
  begin
      if (i_Rst)
          contador <= 0;
      else
          contador <= contador+1;
      if (contador <= 416666)
          salida <= 0;
      else
          salida <= 1;
      if (contador == 833333)
          contador <= 0;
  end
  assign o_Presc = salida;
endmodule
