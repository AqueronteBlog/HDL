/* 
@brief	leds_scanner_c2_de2.v
@details	This example shows how to model a circuit to blink an LED as a LED scanner.


@return	N/A

@author	Manuel Caballero
@date		29/November/2024
@version	29/November/2024    The ORIGIN
@pre		This source code was tested on the Altera’s DE2 board.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
module leds_scanner_c2_de2 (
	input CLOCK_50,
	output[7:0] LEDG
);

	leds_scanner #(.DELAY_TICKS(32'd_25_000_000)) uut0 (.clock(CLOCK_50), .leds(LEDG));
endmodule