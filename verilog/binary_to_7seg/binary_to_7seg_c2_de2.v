/* 
@brief	BINARY_TO_7SEG_c2_de2.v
@details	This example shows how to model a binary to 7seg decoder. 


@return	N/A

@author	Manuel Caballero
@date		06/November/2024
@version	06/November/2024    The ORIGIN
@pre		This source code was tested on the Altera’s DE2 board.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
module BINARY_TO_7SEG_c2_de2 (
	input[3:0] SW,
	output reg[6:0] HEX0
);

	always @(SW[3], SW[2], SW[1], SW[0]) begin
		case ({SW[3], SW[2], SW[1], SW[0]})
			4'b0000	:	begin	// 0
				HEX0[6]	<= 1;
				HEX0[5]	<= 0;
				HEX0[4]	<= 0;
				HEX0[3]	<= 0;
				HEX0[2]	<= 0;
				HEX0[1]	<= 0;
				HEX0[0]	<= 0;
			end
			4'b0001	:	begin	// 1
				HEX0[6]	<= 1;
				HEX0[5]	<= 1;
				HEX0[4]	<= 1;
				HEX0[3]	<= 1;
				HEX0[2]	<= 0;
				HEX0[1]	<= 0;
				HEX0[0]	<= 1;
			end
			4'b0010	:	begin	// 2
				HEX0[6]	<= 0;
				HEX0[5]	<= 1;
				HEX0[4]	<= 0;
				HEX0[3]	<= 0;
				HEX0[2]	<= 1;
				HEX0[1]	<= 0;
				HEX0[0]	<= 0;
			end
			4'b0011	:	begin	// 3
				HEX0[6]	<= 0;
				HEX0[5]	<= 1;
				HEX0[4]	<= 1;
				HEX0[3]	<= 0;
				HEX0[2]	<= 0;
				HEX0[1]	<= 0;
				HEX0[0]	<= 0;
			end
			4'b0100	:	begin	// 4
				HEX0[6]	<= 0;
				HEX0[5]	<= 0;
				HEX0[4]	<= 1;
				HEX0[3]	<= 1;
				HEX0[2]	<= 0;
				HEX0[1]	<= 0;
				HEX0[0]	<= 1;
			end
			4'b0101	:	begin	// 5
				HEX0[6]	<= 0;
				HEX0[5]	<= 0;
				HEX0[4]	<= 1;
				HEX0[3]	<= 0;
				HEX0[2]	<= 0;
				HEX0[1]	<= 1;
				HEX0[0]	<= 0;
			end
			4'b0110	:	begin	// 6
				HEX0[6]	<= 0;
				HEX0[5]	<= 0;
				HEX0[4]	<= 0;
				HEX0[3]	<= 0;
				HEX0[2]	<= 0;
				HEX0[1]	<= 1;
				HEX0[0]	<= 0;
			end
			4'b0111	:	begin	// 7
				HEX0[6]	<= 1;
				HEX0[5]	<= 1;
				HEX0[4]	<= 1;
				HEX0[3]	<= 1;
				HEX0[2]	<= 0;
				HEX0[1]	<= 0;
				HEX0[0]	<= 0;
			end
			4'b1000	:	begin	// 8
				HEX0[6]	<= 0;
				HEX0[5]	<= 0;
				HEX0[4]	<= 0;
				HEX0[3]	<= 0;
				HEX0[2]	<= 0;
				HEX0[1]	<= 0;
				HEX0[0]	<= 0;
			end
			4'b1001	:	begin	// 9
				HEX0[6]	<= 0;
				HEX0[5]	<= 0;
				HEX0[4]	<= 1;
				HEX0[3]	<= 1;
				HEX0[2]	<= 0;
				HEX0[1]	<= 0;
				HEX0[0]	<= 0;
			end
			default	:	begin	// Default: 0
				HEX0[6]	<= 1;
				HEX0[5]	<= 0;
				HEX0[4]	<= 0;
				HEX0[3]	<= 0;
				HEX0[2]	<= 0;
				HEX0[1]	<= 0;
				HEX0[0]	<= 0;
			end
		endcase
	end
endmodule