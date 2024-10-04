/* 
@brief	FULL_ADDER_C2_DE2.v
@details	This example shows how to model a full adder circuit. 

			The model is using logic gates.


@return	N/A

@author	Manuel Caballero
@date		04/October/2024
@version	04/October/2024    The ORIGIN
@pre		This source code was tested on the Altera’s DE2 board.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
module FULL_ADDER_C2_DE2(
	input[2:0] SW,
	output[1:0] LEDG
);

	wire s_semi, c_semi_a, c_semi_b;
	
	xor(s_semi, SW[0], SW[1]);
	and(c_semi_a, SW[0], SW[1]);
	
	xor(LEDG[0], s_semi, SW[2]);
	and(c_semi_b, s_semi, SW[2]);
	
	or(LEDG[1], c_semi_a, c_semi_b);
endmodule