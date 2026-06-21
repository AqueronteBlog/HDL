/* 
@brief	parity_checker_c2_de2.v
@details	This is a module for the parity_checker.v model using the DE2 ALTERA development kit by Terasic. 


@return	N/A

@author	Manuel Caballero
@date		19/May/2026
@version	19/May/2026    The ORIGIN
@pre		This source code was tested on the Altera’s DE2 board.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://x.com/aqueronteblog
*/
module parity_checker_c2_de2(
	input[3:0] SW,
	output[1:0] LEDG
);

	parity_checker uut0 (.a(SW[3]), .b(SW[2]), .c(SW[1]), .p(SW[0]), .pc(LEDG[0]));
	
endmodule