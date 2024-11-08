/* 
@brief	test_blink_led_c2_de2.v
@details	This example shows how to model a circuit to blink an LED every one second. 


@return	N/A

@author	Manuel Caballero
@date		08/November/2024
@version	08/November/2024    The ORIGIN
@pre		This source code was tested on the Altera’s DE2 board.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
module test_blink_led_c2_de2 (
	input CLOCK_50,
	output[8:0] LEDG
);

	BLINK_LED_1s led1 (.clock(CLOCK_50), .led(LEDG[0]));
endmodule
