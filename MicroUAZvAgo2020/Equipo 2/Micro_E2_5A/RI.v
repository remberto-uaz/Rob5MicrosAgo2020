module RI(
    input i_Clk,
    input i_Rst,
    input [8:0] i_Instruction,
    output [2:0] oInstruction,
    output [5:0] oArguments);
    
    // Se declaran los registros y las señales internas
    reg [2:0] cod_op;
    reg [5:0] Arguments;
    reg [7:0] Direccionamiento_inmediato=0;
    

    //Etapa de implemetacion
    always@(posedge i_Rst, posedge i_Clk)
    begin
        if (i_Rst) begin//El reset es sincrono
            cod_op <= 3'b000;
            Arguments <= 6'b000000;
        end
        else begin
            if (i_Instruction[8:6]==3'b000 || i_Instruction[8:6]==3'b010) begin
                cod_op<=i_Instruction[8:6];
                Arguments[5:3]<=i_Instruction[5:3];
                Arguments[2:0]<=& 3'b000;
            end
            else begin
                cod_op<=i_Instruction[8:6];
                Arguments[5:3]<=i_Instruction[5:3];
                Arguments[2:0]<=i_Instruction[2:0];
               
            end
        end
    end

    assign oInstruction = cod_op;//Se pasa el valor del registro Operation 
                                          //_code a o_Instruccion
    assign oArguments = Arguments; //Se pasa el valor del registro Operandos a 
                                    //o_Operandos
endmodule