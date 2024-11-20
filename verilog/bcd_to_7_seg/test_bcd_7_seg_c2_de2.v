/* 
@brief	test_binary_7_seg_en_c2_de2.v
@details	This example shows how to test the module BCD_TO_7SEG with an external button. 
			
			Every time the button is pushed, a BCD counter is increased and its result is shown
			in the 7-seg display.


@return	N/A

@author	Manuel Caballero
@date		15/November/2024
@version	15/November/2024    The ORIGIN
@pre		This source code was tested on the Altera’s DE2 board.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
module test_bcd_7_seg_c2_de2 (
	input[1:0] SW,
	input[3:0] KEY,
	output[6:0] HEX0
);

	test_bcd_to_7seg uut0 (.seg7all_on(SW[1]), .enable(SW[0]), .button(KEY[0]), .sg7(HEX0));
endmodule
	