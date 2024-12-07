/* 
@brief	leds_scanner_tb.v
@details	This is a testbecnh for the leds_scanner.v model. 


@return	N/A

@author	Manuel Caballero
@date		29/November/2024
@version	29/November/2024    The ORIGIN
@pre		This source code was tested with the leds_scanner.v file and ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
`timescale 1ms/1ms

module leds_scanner_tb();
	reg clock = 1'b1;
	wire[7:0] leds;
	
	leds_scanner #(.DELAY_TICKS(32'd_50)) uut0 (.clock(clock), .leds(leds));
	
	initial begin
		#4000; $stop;
	end
	
	always @(*) begin
		#1; clock <= ~clock;
	end
endmodule