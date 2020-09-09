module Prescalador(
input i_clock,
input i_reset,
output o_presc
);

reg [19:0] contador;
reg salida;
always@(posedge i_clock)
begin

if (i_reset)
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
assign o_presc = salida;
endmodule