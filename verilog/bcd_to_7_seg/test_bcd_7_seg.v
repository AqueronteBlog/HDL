/* 
@brief	test_bcd_to_7seg.v
@details	This example shows how to test the module BCD_TO_7SEG with an external button. 
			
			Every time the button is pushed, a BCD counter is increased and its result is shown
			in the 7-seg display.


@return	N/A

@author	Manuel Caballero
@date		15/November/2024
@version	15/November/2024    The ORIGIN
@pre		This code needs the bcd_7_seg file.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
module test_bcd_to_7seg (
	input button,
	input enable, seg7all_on,
	output[6:0] sg7
);
	
	reg[3:0] bcd = 4'b0000;
	
	BCD_TO_7SEG_EN uut0 (.enable(enable), .seg7all_on(seg7all_on), .bcd(bcd), .sg7(sg7));
	
	always @(negedge button) begin
		if (enable == 0)
			bcd <= 0;
		else if (seg7all_on == 1)
			bcd <= bcd;
		else if (bcd < 10)
			bcd <= bcd + 1'b1;
		else
			bcd <= 0;
	end
endmodule