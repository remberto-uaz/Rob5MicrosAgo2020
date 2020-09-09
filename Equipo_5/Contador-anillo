//declare the Verilog module - The inputs and output port names.
module ring_counter(
    i_clock,
    i_reset,
    o_Anodo
    );

    //what are the input ports and their sizes.
    input i_clock;
    input i_reset;
    //what are the output ports and their sizes.
    output [3:0] o_Anodo;
    //Internal variables
    reg [3:0] o_Anodo;

    //Whenever the Clock changes from 0 to 1(positive edge) or 
    //a change in Reset, execute the always block.
    always @(posedge(i_clock),i_reset)
    begin
        if(Reset == 1'b1)   begin  //when Reset is high 
            Count = 4'b0001;   end  //The Count value is reset to "0001".
        else if(i_clock == 1'b1)  begin  //When the Clock is high
            //Left shift the Count value.
            Count = {Count[2:0],Count[3]};   end 
    end

    //The Count value is assigned to final output port.
    assign o_Anodo = Count;

endmodule
