//Este componente permitira el control de las demás partes del microprocesador
//se encarga de verificar la ejecución de las instrucciones y del paso de los
//parámetros con los que trabajarán.
module Unidad_de_control
    (   input i_Timming,
        input i_Rst,
        input [2:0] i_Bandera,
        input [2:0] i_Operation_code,
        input [5:0] i_Operandos,
        output o_Senal_de_salto,
        output [1:0] o_Selector_de_entrada_a_registros,
        output [1:0] o_Lectura_escritura,
        output [2:0] o_Control_RX,
        output [2:0] o_Control_RY,
        output [2:0] o_Seleccion_registro_escritura,
        output [2:0] o_Seleccion_registro_lectura,
        output [2:0] o_Senal_de_control,
        output [2:0] o_Inst_decodificada,
        output o_Hab);
        
    // Se declaran los registros y las señales internas
    reg [1:0] Selector_de_entrada_a_registros=0;
    reg [1:0] Lectura_escritura=0;
    reg [2:0] Control_RX=0;
    reg [2:0] Control_RY=0;
    reg [2:0] Seleccion_registro_escritura=0;
    reg [2:0] Seleccion_registro_lectura=0;
    reg [2:0] Senal_de_control=0;
    reg [2:0] Inst_decodificada=0;
    reg Senal_de_salto=0;
    reg Hab=0;
 
    
    //Etapa de implemetacion
    always @(posedge i_Rst, posedge i_Timming)
    begin
        if(i_Rst) begin//Reset asincrono
            Senal_de_salto<=0;
            Selector_de_entrada_a_registros<=2'b00;
            Lectura_escritura <= 2'b00;
            Control_RX <= 3'b000;
            Control_RY <= 3'b000;
            Seleccion_registro_escritura <= 3'b000;
            Seleccion_registro_lectura <= 3'b000;
            Senal_de_control <= 3'b000;
            Inst_decodificada<=3'b000;
            Hab<=0;
        end 
        else begin
            case(i_Operation_code)
            3'b000: begin
                //LOAD_1
                Senal_de_salto<=0;
                Selector_de_entrada_a_registros <= 2'b01;
                Lectura_escritura <= 2'b01;
                Control_RX <= 3'b000;
                Control_RY <= 3'b000;
                Seleccion_registro_escritura <= i_Operandos[5:3];
                Seleccion_registro_lectura <= 3'b000;
                Senal_de_control <= 3'b000;
                Inst_decodificada<=3'b000;
                Hab<=0;
            end 
            
            3'b001: begin
                //LOAD_2
                Senal_de_salto<=0;
                Selector_de_entrada_a_registros<=2'b10;
                Lectura_escritura <= 2'b11;
                Control_RX <= 3'b000;
                Control_RY <= i_Operandos [2:0];
                Seleccion_registro_escritura <= i_Operandos [5:3];
                Seleccion_registro_lectura <= 3'b000;
                Senal_de_control <= 3'b100;
                Inst_decodificada<=3'b000;
                Hab<=0;
            end 
            
            3'b010: begin
                //STORE_1
                Senal_de_salto<=0;
                Selector_de_entrada_a_registros<=2'b00;
                Lectura_escritura <= 2'b00;
                Control_RX <= i_Operandos[2:0];
                Control_RY <= 3'b000;
                Seleccion_registro_escritura <= 3'b000;
                Seleccion_registro_lectura <= 3'b000;
                Senal_de_control <= 3'b111;
                Inst_decodificada<=3'b000;
                Hab<=0;
            end
            
            3'b011: begin
                //STORE_2
                Senal_de_salto<=0;
                Selector_de_entrada_a_registros<=2'b00;
                Lectura_escritura <= 2'b00;
                Control_RX <= i_Operandos[5:3];
                Control_RY <= i_Operandos[2:0];
                Seleccion_registro_escritura <= 3'b000;
                Seleccion_registro_lectura <= 3'b000;
                Senal_de_control <= 3'b110;
                Inst_decodificada<=3'b000;
                Hab<=0;
            end 
            
            3'b100: begin
                //MOVE
                Senal_de_salto<=0;
                Selector_de_entrada_a_registros<=2'b00;
                Lectura_escritura <= 2'b00;
                Control_RX <= 3'b000;
                Control_RY <= 3'b000;
                Seleccion_registro_escritura <= i_Operandos[5:3];
                Seleccion_registro_lectura <= i_Operandos[2:0];
                Senal_de_control <= 3'b000;
                Inst_decodificada<=3'b000;
                Hab<=0;
            end
            
            3'b101: begin
                //MATH
                Senal_de_salto<=0;
                Selector_de_entrada_a_registros<=2'b00;
                Lectura_escritura <= 2'b11;
                Control_RX <= i_Operandos[5:3];
                Control_RY <= 3'b000;
                Seleccion_registro_escritura <= 3'b000;
                Seleccion_registro_lectura <= 3'b000;
                Senal_de_control <= 3'b000;
                Inst_decodificada<= i_Operandos[2:0];
                Hab<=1;
            end
            
            3'b110: begin
                //JUMP
                case(i_Operandos[2:0])
                    3'b000: begin
                        Senal_de_salto<=1;
                        Selector_de_entrada_a_registros<=2'b00;
                        Lectura_escritura <= 2'b00;
                        Control_RX <= i_Operandos[5:3];
                        Control_RY <= 3'b000;
                        Seleccion_registro_escritura <= 3'b000;
                        Seleccion_registro_lectura <= 3'b000;
                        Senal_de_control <= 3'b000;
                        Inst_decodificada<= 3'b000;
                        Hab<=0;
                    end

                    3'b001: begin
                        Senal_de_salto<=1;
                        Selector_de_entrada_a_registros<=2'b11;
                        Lectura_escritura <= 2'b11;
                        Control_RX <= i_Operandos[5:3];
                        Control_RY <= 3'b000;
                        Seleccion_registro_escritura <= 3'b111;
                        Seleccion_registro_lectura <= 3'b000;
                        Senal_de_control <= 3'b000;
                        Inst_decodificada<= 3'b000;
                        Hab<=0;
                    end
                    
                    3'b010: begin
                        if (i_Bandera[0]==1) begin
                            Senal_de_salto<=1;
                            Selector_de_entrada_a_registros<=2'b11;
                            Lectura_escritura <= 2'b11;
                            Control_RX <= i_Operandos [5:3];
                            Control_RY <= 3'b000;
                            Seleccion_registro_escritura <= 3'b111;
                            Seleccion_registro_lectura <= 3'b000;
                            Senal_de_control <= 3'b000;
                            Inst_decodificada<= 3'b000;
                            Hab<=0; 
                        end
                    end
                    
                    3'b011: begin
                        if (i_Bandera[0]==0) begin
                            Senal_de_salto<=1;
                            Selector_de_entrada_a_registros<=2'b11;
                            Lectura_escritura <= 2'b11;
                            Control_RX <= i_Operandos [5:3];
                            Control_RY <= 3'b000;
                            Seleccion_registro_escritura <= 3'b111;
                            Seleccion_registro_lectura <= 3'b000;
                            Senal_de_control <= 3'b000;
                            Inst_decodificada<= 3'b000;
                            Hab<=0; 
                        end
                    end
                    
                    3'b100: begin
                        if (i_Bandera[1]==1) begin
                            Senal_de_salto<=1;
                            Selector_de_entrada_a_registros<=2'b11;
                            Lectura_escritura <= 2'b11;
                            Control_RX <= i_Operandos[5:3];
                            Control_RY <= 3'b000;
                            Seleccion_registro_escritura <= 3'b111;
                            Seleccion_registro_lectura <= 3'b000;
                            Senal_de_control <= 3'b000;
                            Inst_decodificada<= 3'b000;
                            Hab<=0; 
                        end
                    end
                    
                    3'b101: begin
                        if (i_Bandera[1]==0) begin
                            Senal_de_salto<=1;
                            Selector_de_entrada_a_registros<=2'b11;
                            Lectura_escritura <= 2'b11;
                            Control_RX <= i_Operandos[5:3];
                            Control_RY <= 3'b000;
                            Seleccion_registro_escritura <= 3'b111;
                            Seleccion_registro_lectura <= 3'b000;
                            Senal_de_control <= 3'b000;
                            Inst_decodificada<= 3'b000;
                            Hab<=0; 
                        end
                    end
                    
                    3'b110: begin
                        if (i_Bandera[2]==1) begin
                            Senal_de_salto<=1;
                            Selector_de_entrada_a_registros<=2'b11;
                            Lectura_escritura <= 2'b11;
                            Control_RX <= i_Operandos[5:3];
                            Control_RY <= 3'b000;
                            Seleccion_registro_escritura <= 3'b111;
                            Seleccion_registro_lectura <= 3'b000;
                            Senal_de_control <= 3'b000;
                            Inst_decodificada<= 3'b000;
                            Hab<=0; 
                        end
                    end
                    
                    default: begin
                        if (i_Bandera[2]==0) begin
                            Senal_de_salto<=1;
                            Selector_de_entrada_a_registros<=2'b11;
                            Lectura_escritura <= 2'b11;
                            Control_RY <= 3'b000;
                            Seleccion_registro_escritura <= 3'b111;
                            Seleccion_registro_lectura <= 3'b000;
                            Senal_de_control <= 3'b000;
                            Inst_decodificada<= 3'b000;
                            Hab<=0; 
                        end
                    end
                endcase
            end
            
            default: begin
            //Sin operacion
                Senal_de_salto<=0;
                Selector_de_entrada_a_registros<=2'b00;
                Lectura_escritura <= 2'b00;
                Control_RY <= 3'b000;
                Seleccion_registro_escritura <= 3'b000;
                Seleccion_registro_lectura <= 3'b000;
                Senal_de_control <= 3'b000;
                Inst_decodificada<= 3'b000;
                Hab<=0;
            end
        endcase    
        end 
    end

    assign o_Senal_de_salto=Senal_de_salto;
    assign o_Selector_de_entrada_a_registros=Selector_de_entrada_a_registros;
    assign o_Lectura_escritura=Lectura_escritura;
    assign o_Control_RX=Control_RX;
    assign o_Control_RY=Control_RY;
    assign o_Seleccion_registro_escritura=Seleccion_registro_escritura;
    assign o_Seleccion_registro_lectura=Seleccion_registro_lectura;
    assign o_Senal_de_control=Senal_de_control;
    assign o_Inst_decodificada=Inst_decodificada;
    assign o_Hab=Hab;
endmodule