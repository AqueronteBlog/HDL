/* 
@brief	binary_to_7seg_function_c2_de2.v
@details	This example shows how to model a binary to 7seg decoder using a function. 


@return	N/A

@author	Manuel Caballero
@date		06/February/2026
@version	06/February/2026    The ORIGIN
@pre		This source code was tested on the Altera’s DE2 board.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://x.com/aqueronteblog
*/
module binary_to_7seg_function_c2_de2 (
	input[3:0] SW,
	output[6:0] HEX0
);

	binary_to_7seg_function uut0	(.d(SW[3]), .c(SW[2]), .b(SW[1]), .a(SW[0]), .sg7_g(HEX0[6]), .sg7_f(HEX0[5]), .sg7_e(HEX0[4]), .sg7_d(HEX0[3]), .sg7_c(HEX0[2]), .sg7_b(HEX0[1]), .sg7_a(HEX0[0]));

endmodule