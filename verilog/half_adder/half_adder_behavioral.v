/* 
@brief	HALF_ADDER_behav.v
@details	This example shows how to model a half adder circuit. 

			This is a behavioral model.


@return	N/A

@author	Manuel Caballero
@date		28/November/2024
@version	28/November/2024    The ORIGIN
@pre		This source code was tested on the Altera’s DE2 board.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
module HALF_ADDER_behav (
	input[1:0] SW,
	output reg[1:0] LEDG
);
	
	always @(SW[0], SW[1]) begin
		LEDG[0] <= SW[0]^SW[1];		// a = SW[0], b = SW[1], s = LEDG[0]
		LEDG[1] <= SW[0]&SW[1];		// a = SW[0], b = SW[1], c = LEDG[1]
	end
endmodule