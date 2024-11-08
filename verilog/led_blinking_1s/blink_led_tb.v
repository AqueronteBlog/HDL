/* 
@brief	blink_led_tb.v
@details	This is a testbecnh for the blink_led.v model. 


@return	N/A

@author	Manuel Caballero
@date		08/November/2024
@version	08/November/2024    The ORIGIN
@pre		This source code was tested with the blink_led.v file and ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
`timescale 1ns/1ns

module blink_led_tb ();
	reg clock = 1'b0;
	wire led;
	
	BLINK_LED_1s uut0 (.clock(clock), .led(led));
	
	initial begin
		#2_200_000_000; $stop;
	end
	
	always #10 clock <= ~clock;
endmodule