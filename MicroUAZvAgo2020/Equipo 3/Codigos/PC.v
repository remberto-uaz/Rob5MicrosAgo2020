module PC(
    input clk,
    input rst,
    input DONE,
    input [7:0] RX_DATO,
    input [1:0] HAB,
    output reg[7:0] PC_VAL
    );
always@(posedge clk)
begin
	if(rst==1'b1)
	begin
	PC_VAL<=8'b00000000;
    end
	else  begin 
   if(HAB==2'b10 || HAB==2'b11)
   begin 
   PC_VAL<=RX_DATO;
   if(DONE==1'b1)
   begin
   PC_VAL=PC_VAL+1;
   end
   else begin
   PC_VAL=PC_VAL;
   end
   end
   else begin
   if(DONE==1'b1)
   begin
   PC_VAL=PC_VAL+1;
   end
   else begin
   PC_VAL=PC_VAL;
   end
   end
   end
 end
endmodule
