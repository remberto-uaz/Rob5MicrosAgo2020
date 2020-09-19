module Preescalador_TB(                   //Nomre del modulo
);
    reg clk;                              //registro llamado reloj
    reg reset;							  //registro llamado reset
    wire clk_out;						  //Cable de salida del reloj
    Preescalador DUT (					  //Diseño bajo testeo de multiplexor
		.i_Clk(clk),					  //Especifica que i_Clk es clk para su futuro uso
		.i_Rst(reset),					  //Especifica que i_Rst es reset para su futuro uso
		.o_Presc(clk_out)				  //Especifica que o_Presc es clk_out para su futuro uso
    );
    initial							      //Iniciacion del testbench
    begin                                 //Funcion que ejecuta en forma de bucle
		clk<=0;							  //Asigna el valor 0 a clk
		reset<=1;                         //Asigna el valor 1 a reset
		#20 reset<=0;                     //Asigna el valor 0 a reset
    end                                   //Termina el bloque de codigo
    always@(clk)                          //Funcion que ejecuta en forma de bucle
    #5 clk <= ~clk;                       //El reloj se actualiza cada cierto tiempo 
endmodule								  //Termina el modulo	
