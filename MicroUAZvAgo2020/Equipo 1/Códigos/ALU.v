//Este componente permite realizar operaciones del tipo lógico y matemáticas
//con los datos almacenados en registros previamente obtenidos de la memoria 
//de datos, también asigna una bandera según el estado de la operación.
module ALU(
    input [2:0] i_Inst_decodificada,
    input [7:0] i_RX,
    input [7:0] i_RY,
    input i_Hab,
    output [7:0] o_Resultado,
    output [2:0] o_Bandera);
    
    // Se declaran los registros y las señales internas
    reg [15:0] Resultado=0;
    reg [2:0] bandera=0;
    

    //Etapa de implemetacion
    always@(*)
    begin
        if (i_Hab==1) begin
            case(i_Inst_decodificada)
                3'b000: Resultado <= i_RX+i_RY;
                3'b001: Resultado <= i_RX-i_RY;
                3'b010: Resultado <= i_RX<<i_RY;
                3'b011: Resultado <= i_RX>>i_RY;
                3'b100: Resultado <= ~i_RX;
                3'b101: Resultado <= i_RX & i_RY;
                3'b110: Resultado <= i_RX | i_RY;
                3'b111: Resultado <= i_RX^i_RY;
                default: 
                    Resultado<=8'b00000000;
            endcase
            
            //Bandera zero
            if (Resultado==0) begin
                bandera[1]<=1;
            end
            else begin
                bandera[1]<=0;
            end
    
            //Bandera de acarreo
            if ((8'b11111111-Resultado)<0) begin
                bandera[1]<=1;
            end
            else begin
                bandera[1]<=0;
            end

            //Bandera de signo negativo
            if (i_Inst_decodificada==1 & i_RX<i_RY) begin
                bandera[0]<=1;
                end
                else begin
                bandera[0]<=0;
            end
        end
    end


    assign o_Resultado = Resultado[7:0];//Se pasa el valor del registro Resultado
                                        //a o_Resultado para su almacenamiento en
                                        //los registros de datos
    assign o_Bandera =bandera; //Se pasa el valor del registro de la bandera a la salida
                         //o_Bandera
endmodule