/* 
@brief	pir_c2_de2.v
@details	This example shows how to model a module to work with an external sensor: PIR. 


@return	N/A

@author	Manuel Caballero
@date		24/July/2026
@version	24/July/2026    The ORIGIN
@pre		This source code was tested on the Altera’s DE2 board.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://x.com/aqueronteblog
*/
module pir_c2_de2 (
	input	CLOCK_50,
	input[1:0]	SW,
	input[1:0]	GPIO_0,
	
	output[1:0]	LEDG
);

	pir uut0 (.clk(CLOCK_50), .reset(SW[0]), .pir_in(GPIO_0[0]), .pir_out(LEDG[0]), .pir_busy(LEDG[1]));
endmodule