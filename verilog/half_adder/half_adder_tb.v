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