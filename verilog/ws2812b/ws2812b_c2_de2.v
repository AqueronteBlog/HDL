/* 
@brief	ws2812b_c2_de2.v
@details	This example shows how to model a ws2812b device. 


@return	N/A

@author	Manuel Caballero
@date		22/September/2025
@version	22/September/2025    The ORIGIN
@pre		This source code was tested on the Altera’s DE2 board.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://x.com/aqueronteblog
*/
module ws2812b_c2_de2 (
	input CLOCK_50,
	input[17:0] SW,
	output[1:0] GPIO_0,
	output[1:0] LEDG
);

	ws2812b ws2812b_0 (.clock(CLOCK_50), .enable(SW[17]), .r(SW[7:0]), .g(8'b_00000000), .b(SW[15:8]), .bit_out(GPIO_0[0]), .bit_ready(LEDG[0]));
endmodule