module ConNum_TB(
);
	reg [2:0] VNum;
	wire [7:0] VNum8b;
	ConNum DUT(
		.Num(VNum),
		.Num8b(VNum8b)
	);
	initial 
	begin
		VNum <= 3'b000;
		#50;
		VNum <= 3'b001; 
		#50;
		VNum <= 3'b010; 
		#50;
		VNum <= 3'b011; 
		#50;
		VNum <= 3'b100;
		#50;
		VNum <= 3'b101; 
        #50;
        VNum <= 3'b110; 
        #50;
        VNum <= 3'b111;
	end
endmodule