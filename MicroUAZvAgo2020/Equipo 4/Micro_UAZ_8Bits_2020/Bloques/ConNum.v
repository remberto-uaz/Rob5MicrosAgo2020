module ConNum(
	input [2:0] Num,
	output [7:0] Num8b
	);
	
    reg [4:0] Extencion= 5'b00000;
    
    assign Num8b = {Extencion, Num};
    
    endmodule