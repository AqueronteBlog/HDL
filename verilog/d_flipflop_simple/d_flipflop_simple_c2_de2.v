/* 
@brief	d_flipflop_simple_c2_de2.v
@details	This example shows how to model a simple D flip-flop. 


@return	N/A

@author	Manuel Caballero
@date		13/December/2024
@version	13/December/2024    The ORIGIN
@pre		This source code was tested on the Altera’s DE2 board.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
module d_flipflop_simple_c2_de2 (
	input [1:0] SW,
	input CLOCK_50,
	output[1:0] LEDG 
);
	
	d_flipflop_simple uut0 (.d(SW[0]), .clock(CLOCK_50), .q(LEDG[1]), .qbar(LEDG[0]));
endmodule
