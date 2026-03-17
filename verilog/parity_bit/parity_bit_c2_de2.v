/* 
@brief	parity_bit_c2_de2.v
@details	This is a module for the parity_bit.v model using the DE2 ALTERA development kit by Terasic. 


@return	N/A

@author	Manuel Caballero
@date		17/March/2026
@version	17/March/2026    The ORIGIN
@pre		This source code was tested on the Altera’s DE2 board.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://x.com/aqueronteblog
*/
module parity_bit_c2_de2 (
	input[2:0] SW,
	output[1:0] LEDG
);

	parity_bit uut0 (.a(SW[0]), .b(SW[1]), .c(SW[2]), .odd(LEDG[1]), .even(LEDG[0]));

endmodule