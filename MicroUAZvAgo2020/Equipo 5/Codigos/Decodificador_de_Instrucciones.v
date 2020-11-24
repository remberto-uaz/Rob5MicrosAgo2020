`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.11.2020 20:04:03
// Design Name: 
// Module Name: Decodificador_de_instrucciones
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Decodificador_de_instrucciones(
input [8:0] Instruction,
output Move,
output Write,
output [2:0] j,
output [2:0] k,
output [2:0] i,
output Math,
output Sel_out,
output [7:0] N,
output [1:0] Sel_PC,
output [2:0] f
    );
reg Move_i;
reg Write_i;
reg [2:0] j_i;
reg [2:0] k_i;
reg [2:0] i_i;
reg Math_i;
reg [1:0] Sel_out_i;
reg [7:0] N_i;
reg [1:0] Sel_PC_i;
reg [2:0] f_i;
    
always @(Instruction)
begin

   case(Instruction[2:0])
//Load RX #NUM
3'b000: begin

//RX
    case(Instruction[5:3])
    //0
        3'b000: begin
   k_i = 0;
    end
    //1
        3'b001: begin
    k_i = 1;
    end
    //2
        3'b010: begin
     k_i = 2;
    end
    //3
        3'b011: begin
     k_i = 3;
    end
    //4
        3'b100: begin
     k_i = 4;
    end
    //5
        3'b101: begin
     k_i = 5;
    end
    //6
        3'b110: begin
     k_i = 6;
    end
    //7
        3'b111: begin
     k_i = 7;
    end
endcase

 //#NUM
    case(Instruction[8:6])
    //0
        3'b000: begin
    j_i = 0;
    end
    //1
        3'b001: begin
    j_i = 1;
    end
    //2
        3'b010: begin
    j_i = 2;
    end
    //3
        3'b011: begin
    j_i = 3;
    end
    //4
        3'b100: begin
    j_i = 4;
    end
    //5
        3'b101: begin
    j_i = 5;
    end
    //6
        3'b110: begin
    j_i = 6;
    end
    //7
        3'b111: begin
    j_i = 7;
    end
endcase   
    
Move_i = 0;
Write_i = 0;
i_i = 0;
Math_i = 0;
Sel_out_i = 0;
N_i = 0;
Sel_PC_i = 0;
f_i = 0;


end
//Load RX [RY]
3'b001: begin

//RX
    case(Instruction[5:3])
    //R0+RX
        3'b000: begin
    k_i = 0;
    end
    //R0-RX
        3'b001: begin
    k_i = 1;
    end
    //R0<<RX
        3'b010: begin
    k_i = 2;
    end
    //R0>>RY
        3'b011: begin
    k_i = 3;
    end
    //~RX
        3'b100: begin
    k_i = 4;
    end
    //R0&RX
        3'b101: begin
    k_i = 5;
    end
    // R0|RX
        3'b110: begin
    k_i = 6;
    end
    //R0^RX
        3'b111: begin
    k_i = 7;
    end
endcase

 //#RY
    case(Instruction[8:6])
    //R0+RX
        3'b000: begin
    i_i = 0;
    end
    //R0-RX
        3'b001: begin
    i_i = 1;
    end
    //R0<<RX
        3'b010: begin
    i_i = 2;
    end
    //R0>>RY
        3'b011: begin
    i_i = 3;
    end
    //~RX
        3'b100: begin
    i_i = 4;
    end
    //R0&RX
        3'b101: begin
    i_i = 5;
    end
    // R0|RX
        3'b110: begin
    i_i = 6;
    end
    //R0^RX
        3'b111: begin
    i_i = 7;
    end
endcase   

Move_i = 0;
Write_i = 0;
j_i = 0;
Math_i = 0;
Sel_out_i = 0;
N_i = 0;
Sel_PC_i = 0;
f_i = 0;

end
//Store #Num
3'b010: begin

//RX
    case(Instruction[5:3])
    //0
        3'b000: begin
    k_i = 0;
    end
    //1
        3'b001: begin
    k_i = 1;
    end
    //2
        3'b010: begin
    k_i = 2;
    end
    //3
        3'b011: begin
    k_i = 3;
    end
    //4
        3'b100: begin
    k_i = 4;
    end
    //5
        3'b101: begin
    k_i = 5;
    end
    //6
        3'b110: begin
    k_i = 6;
    end
    //7
        3'b111: begin
    k_i = 7;
    end
endcase

 //#NUM
    case(Instruction[8:6])
    //0
        3'b000: begin
    j_i = 0;
    end
    //1
        3'b001: begin
    j_i = 1;
    end
    //2
        3'b010: begin
    j_i = 2;
    end
    //3
        3'b011: begin
    j_i = 3;
    end
    //4
        3'b100: begin
    j_i = 4;
    end
    //5
        3'b101: begin
    j_i = 5;
    end
    //6
        3'b110: begin
    j_i = 6;
    end
    //7
        3'b111: begin
    j_i = 7;
    end
endcase   

Move_i = 0;
Write_i = 1;
i_i = 0;
Math_i = 0;
Sel_out_i = 0;
N_i = 0;
Sel_PC_i = 0;
f_i = 0;


end
//Store RX [RY]
3'b011: begin
//RX
    case(Instruction[5:3])
    //0
        3'b000: begin
    k_i = 0;
    end
    //1
        3'b001: begin
    k_i = 1;
    end
    //2
        3'b010: begin
    k_i = 2;
    end
    //3
        3'b011: begin
    k_i = 3;
    end
    //4
        3'b100: begin
    k_i = 4;
    end
    //5
        3'b101: begin
    k_i = 5;
    end
    //6
        3'b110: begin
    k_i = 6;
    end
    //7
        3'b111: begin
    k_i = 7;
    end
endcase

 //RY
    case(Instruction[8:6])
    //0
        3'b000: begin
    i_i = 0;
    end
    //1
        3'b001: begin
    i_i = 1;
    end
    //2
        3'b010: begin
    i_i = 2;
    end
    //3
        3'b011: begin
    i_i = 3;
    end
    //4
        3'b100: begin
    i_i = 4;
    end
    //5
        3'b101: begin
    i_i = 5;
    end
    //6
        3'b110: begin
    i_i = 6;
    end
    //7
        3'b111: begin
    i_i = 7;
    end
endcase 

Move_i = 0;
Write_i = 1;
j_i = 0;
Math_i = 0;
Sel_out_i = 0;
N_i = 0;
Sel_PC_i = 0;
f_i = 0;


end
//Move RX RY
3'b100: begin
//RX
    case(Instruction[5:3])
    //0
        3'b000: begin
    k_i = 0;
    end
    //1
        3'b001: begin
    k_i = 1;
    end
    //2
        3'b010: begin
    k_i = 2;
    end
    //3
        3'b011: begin
    k_i = 3;
    end
    //4
        3'b100: begin
    k_i = 4;
    end
    //5
        3'b101: begin
    k_i = 5;
    end
    //6
        3'b110: begin
    k_i = 6;
    end
    //7
        3'b111: begin
    k_i = 7;
    end
endcase

 //RY
    case(Instruction[8:6])
    //R0+RX
        3'b000: begin
    i_i = 0;
    end
    //R0-RX
        3'b001: begin
    i_i = 1;
    end
    //R0<<RX
        3'b010: begin
    i_i = 2;
    end
    //R0>>RY
        3'b011: begin
    i_i = 3;
    end
    //~RX
        3'b100: begin
    i_i = 4;
    end
    //R0&RX
        3'b101: begin
    i_i = 5;
    end
    // R0|RX
        3'b110: begin
    i_i = 6;
    end
    //R0^RX
        3'b111: begin
    i_i = 7;
    end
endcase 

Move_i = 1;
Write_i = 0;
j_i = 0;
Math_i = 0;
Sel_out_i = 0;
N_i = 0;
Sel_PC_i = 0;
f_i = 0;


end

//Math RX OP
3'b101: begin

//RX
    case(Instruction[5:3])
    //0
        3'b000: begin
    k_i = 0;
    end
    //1
        3'b001: begin
    k_i = 1;
    end
    //2
        3'b010: begin
    k_i = 2;
    end
    //3
        3'b011: begin
    k_i = 3;
    end
    //4
        3'b100: begin
    k_i = 4;
    end
    //5
        3'b101: begin
    k_i = 5;
    end
    //6
        3'b110: begin
    k_i = 6;
    end
    //7
        3'b111: begin
    k_i = 7;
    end
endcase

//OP
    case(Instruction[8:6])
    //R0+RX
        3'b000: begin
    f_i = 0;
    end
    //R0-RX
        3'b001: begin
    f_i = 1;
    end
    //R0<<RX
        3'b010: begin
    f_i = 2;
    end
    //R0>>RY
        3'b011: begin
    f_i = 3;
    end
    //~RX
        3'b100: begin
    f_i = 4;
    end
    //R0&RX
        3'b101: begin
    f_i = 5;
    end
    // R0|RX
        3'b110: begin
    f_i = 6;
    end
    //R0^RX
        3'b111: begin
    f_i = 7;
    end
    endcase
    
    
Move_i = 0;
Write_i = 0;
j_i = 0;
i_i = 0;
Math_i = 1;
Sel_out_i = 0;
N_i = 0;
Sel_PC_i = 0;


end


//Jump
3'b110: begin

//RX
    case(Instruction[5:3])
    //0
        3'b000: begin
    k_i = 0;
    end
    //1
        3'b001: begin
    k_i = 1;
    end
    //2
        3'b010: begin
    k_i = 2;
    end
    //3
        3'b011: begin
    k_i = 3;
    end
    //4
        3'b100: begin
    k_i = 4;
    end
    //5
        3'b101: begin
    k_i = 5;
    end
    //6
        3'b110: begin
    k_i = 6;
    end
    //7
        3'b111: begin
    k_i = 7;
    end
endcase

//#Cond
    case(Instruction[8:6])
    //0:NO CONDITION 
        3'b000: begin
    f_i = 0;
    end
    //1: NO CONDITION SAVE PC IN R7
        3'b001: begin
    f_i = 1;
    end
    //2:Z FLAG IS TRUE 
        3'b010: begin
    f_i = 2;
    end
    //3:Z FLAG IS FALSE 
        3'b011: begin
    f_i = 3;
    end
    //4: C FLAG IS TRUE
        3'b100: begin
    f_i = 4;
    end
    //5: C FLAG IS FALSE 
        3'b101: begin
    f_i = 5;
    end
    //6: N FLAG IS TRUE 
        3'b110: begin
    f_i = 6;
    end
    //7: N FLAG IS FALSE 
        3'b111: begin
    f_i = 7;
    end
endcase   

Move_i = 0;
Write_i = 0;
j_i = 0;
i_i = 0;
Math_i = 0;
Sel_out_i = 0;
N_i = 0;
Sel_PC_i = 0;
f_i = 0;

end

//Nop
3'b111: begin

Move_i = 0;
Write_i = 0;
j_i = 0;
k_i = 0;
i_i = 0;
Math_i = 0;
Sel_out_i = 0;
N_i = 0;
Sel_PC_i = 0;
f_i = 0;

end
 
endcase
end

assign Move = Move_i;
assign Write = Write_i;
assign j = j_i;
assign k = k_i;
assign i = i_i;
assign Math = Math_i;
assign Sel_out = Sel_out_i;
assign N = N_i;
assign Sel_PC = Sel_PC_i;
assign f = f_i;

endmodule
