/* 
@brief	test_binary_7_seg_en_c2_de2.v
@details	This example shows how to model a binary to 7seg decoder. 


@return	N/A

@author	Manuel Caballero
@date		14/November/2024
@version	14/November/2024    The ORIGIN
@pre		This source code was tested on the Altera’s DE2 board.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
module test_binary_7_seg_en_c2_de2 (
	input[5:0] SW,
	output[6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7
);

	BINARY_TO_7SEG_EN uut0 (.enable(SW[5]), .seg7all_on(SW[4]), .d(SW[3]), .c(SW[2]), .b(SW[1]), .a(SW[0]), .sg7_g(HEX0[6]), .sg7_f(HEX0[5]), .sg7_e(HEX0[4]), .sg7_d(HEX0[3]), .sg7_c(HEX0[2]), .sg7_b(HEX0[1]), .sg7_a(HEX0[0]));
	BINARY_TO_7SEG_EN uut1 (.enable(SW[5]), .seg7all_on(SW[4]), .d(SW[3]), .c(SW[2]), .b(SW[1]), .a(SW[0]), .sg7_g(HEX1[6]), .sg7_f(HEX1[5]), .sg7_e(HEX1[4]), .sg7_d(HEX1[3]), .sg7_c(HEX1[2]), .sg7_b(HEX1[1]), .sg7_a(HEX1[0]));
	BINARY_TO_7SEG_EN uut2 (.enable(SW[5]), .seg7all_on(SW[4]), .d(SW[3]), .c(SW[2]), .b(SW[1]), .a(SW[0]), .sg7_g(HEX2[6]), .sg7_f(HEX2[5]), .sg7_e(HEX2[4]), .sg7_d(HEX2[3]), .sg7_c(HEX2[2]), .sg7_b(HEX2[1]), .sg7_a(HEX2[0]));
	BINARY_TO_7SEG_EN uut3 (.enable(SW[5]), .seg7all_on(SW[4]), .d(SW[3]), .c(SW[2]), .b(SW[1]), .a(SW[0]), .sg7_g(HEX3[6]), .sg7_f(HEX3[5]), .sg7_e(HEX3[4]), .sg7_d(HEX3[3]), .sg7_c(HEX3[2]), .sg7_b(HEX3[1]), .sg7_a(HEX3[0]));
	BINARY_TO_7SEG_EN uut4 (.enable(SW[5]), .seg7all_on(SW[4]), .d(SW[3]), .c(SW[2]), .b(SW[1]), .a(SW[0]), .sg7_g(HEX4[6]), .sg7_f(HEX4[5]), .sg7_e(HEX4[4]), .sg7_d(HEX4[3]), .sg7_c(HEX4[2]), .sg7_b(HEX4[1]), .sg7_a(HEX4[0]));
	BINARY_TO_7SEG_EN uut5 (.enable(SW[5]), .seg7all_on(SW[4]), .d(SW[3]), .c(SW[2]), .b(SW[1]), .a(SW[0]), .sg7_g(HEX5[6]), .sg7_f(HEX5[5]), .sg7_e(HEX5[4]), .sg7_d(HEX5[3]), .sg7_c(HEX5[2]), .sg7_b(HEX5[1]), .sg7_a(HEX5[0]));
	BINARY_TO_7SEG_EN uut6 (.enable(SW[5]), .seg7all_on(SW[4]), .d(SW[3]), .c(SW[2]), .b(SW[1]), .a(SW[0]), .sg7_g(HEX6[6]), .sg7_f(HEX6[5]), .sg7_e(HEX6[4]), .sg7_d(HEX6[3]), .sg7_c(HEX6[2]), .sg7_b(HEX6[1]), .sg7_a(HEX6[0]));
	BINARY_TO_7SEG_EN uut7 (.enable(SW[5]), .seg7all_on(SW[4]), .d(SW[3]), .c(SW[2]), .b(SW[1]), .a(SW[0]), .sg7_g(HEX7[6]), .sg7_f(HEX7[5]), .sg7_e(HEX7[4]), .sg7_d(HEX7[3]), .sg7_c(HEX7[2]), .sg7_b(HEX7[1]), .sg7_a(HEX7[0]));
endmodule
	