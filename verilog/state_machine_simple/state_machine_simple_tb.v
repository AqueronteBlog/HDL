/* 
@brief	state_machine_simple_tb.v
@details	This is a testbecnh for the state_machine_simple.v model. 


@return	N/A

@author	Manuel Caballero
@date		17/April/2026
@version	17/April/2026    The ORIGIN
@pre		This source code was tested with the state_machine_simple.v file and ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://x.com/aqueronteblog
*/
`timescale 1ns/1ns

module state_machine_simple_tb();
	
	reg clk;
	reg reset_n;
	wire [3:0] leds;
	
	state_machine_simple uut0 (.clk(clk), .reset_n(reset_n), .leds(leds));
	
	initial begin
		reset_n	=	0;
		#100;
		reset_n	=	1;
		#1500000000;
		$stop;
	end
	
	// Monitor LEDs
	initial begin
		$display("Time					LED3	LED2	LED1	LED0");
		$monitor("%t					%b	%b	%b	%b", $time, leds[3], leds[2], leds[1], leds[0]);
	end
	
	// Clock generation (50MHz)
	initial begin
		clk = 0;
		forever #10 clk = ~clk;	// 20ns period = 50MHz
	end
	
endmodule