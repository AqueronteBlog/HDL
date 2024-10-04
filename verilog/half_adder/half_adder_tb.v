/* 
@brief	half_adder_tb.v
@details	Testbench for the half adder circuit. 

			Select with model to simulate:
				- HALF_ADDER:				Logic gates
				- HALF_ADDER_dataflow:	Dataflow
				- HALF_ADDER_behav:		Behavioral 


@return	N/A

@author	Manuel Caballero
@date		28/November/2024
@version	28/November/2024    The ORIGIN
@pre		This source code was tested using ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
`timescale 1ns/1ns

module half_adder_tb;
	reg[1:0] sw;
	wire[1:0] leds;
	
	//HALF_ADDER uut0 (.SW(sw), .LEDG(leds));
	//HALF_ADDER_dataflow uut0 (.SW(sw), .LEDG(leds));
	HALF_ADDER_behav uut0 (.SW(sw), .LEDG(leds));
	
	initial begin
		{sw[0], sw[1]} = 0;
		
		$monitor ("time%0t a=%0b b=%0b | sum=%0b carry=%0b", $time, sw[0], sw[1], leds[0], leds[1]);
		
		#10;	sw[0] <= 1;
		#10;	sw[0] <= 0;
				sw[1] <= 1;
		#10;	sw[0] <= 1;
				sw[1] <= 1;
		#10;	$stop;
	end
endmodule