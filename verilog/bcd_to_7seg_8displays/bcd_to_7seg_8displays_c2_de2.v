/* 
@brief	bdc_to_7seg_8displays_c2_de2.v
@details	This example shows how to test the module BCD_TO_7SEG with eight 7-seg displays and a counter. 
			
			Every one second, the counter is increased and its value is shown on the eight 7-seg displays.


@return	N/A

@author	Manuel Caballero
@date		25/November/2024
@version	25/November/2024    The ORIGIN
@pre		This source code was tested on the Altera’s DE2 board.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
module bdc_to_7seg_8displays_c2_de2 (
	input[1:0] SW,
	input CLOCK_50,
	output[6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7
);

	test_bcd_to_7seg_8displays uut0(.clock(CLOCK_50), .enable(SW[0]), .seg7all_on(SW[1]), .sg7_hex0(HEX0), .sg7_hex1(HEX1), .sg7_hex2(HEX2), .sg7_hex3(HEX3), .sg7_hex4(HEX4), .sg7_hex5(HEX5), .sg7_hex6(HEX6), .sg7_hex7(HEX7));
endmodule