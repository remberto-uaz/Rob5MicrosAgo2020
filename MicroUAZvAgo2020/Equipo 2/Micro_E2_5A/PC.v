module PC(
    input i_Clk,
    input i_Rst,
    input [7:0] direc_sal,
    input hab_sal,
    output [7:0] Address_Instruction_Bus
    );
    
    // Se declaran los registros y las señales internas
  reg [7:0] counter=0;
  
    //Etapa de implemetacion
    always@(posedge i_Rst, posedge i_Clk)
    begin
        if (i_Rst) begin//El reset es asincrono
        counter <= 8'b00000000;
        end
        else begin
            if (hab_sal==1)  begin
                counter<= direc_sal;
            end
            else begin
                counter<=counter+1;
            end
        end
    end

    assign Address_Instruction_Bus = counter;
endmodule