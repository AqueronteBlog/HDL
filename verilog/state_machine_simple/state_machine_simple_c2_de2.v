/* 
@brief	state_machine_simple_c2_de2.v
@details	This example shows how to model implement a State Machine.


@return	N/A

@author	Manuel Caballero
@date		17/April/2026
@version	17/April/2026    The ORIGIN
@pre		This source code was tested on the Altera’s DE2 board.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://x.com/aqueronteblog
*/
module state_machine_simple_c2_de2(
	input CLOCK_50,
	input[1:0] SW,
	output[3:0] LEDG
);

	state_machine_simple uut0 (.clk(CLOCK_50), .reset_n(SW[0]), .leds(LEDG));

endmodule
