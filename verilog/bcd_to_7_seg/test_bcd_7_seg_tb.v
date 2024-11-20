/* 
@brief	test_bcd_to_7_seg_tb.v
@details	This is a testbecnh for the binary_to_7seg_en.v model. 


@return	N/A

@author	Manuel Caballero
@date		15/November/2024
@version	15/November/2024    The ORIGIN
@pre		This source code was tested with the test_bcd_to_7seg.v file and ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
`timescale 1ns/1ns

module test_bcd_to_7_seg_tb;
	reg button = 1'b1;
	reg enable, seg7all_on;
	wire[6:0] sg7;
	integer i;
	
	test_bcd_to_7seg uut0 (.button(button), .enable(enable), .seg7all_on(seg7all_on), .sg7(sg7));
	
	initial begin
		{enable, seg7all_on} <= 0;
		
		#10; enable <= 1;
			  seg7all_on <= 1;
			  
		#10; seg7all_on <= 0;
		
		$monitor("time%0t gfedcba %0b%0b%0b%0b%0b%0b%0b", $time, sg7[6], sg7[5], sg7[4], sg7[3], sg7[2], sg7[1], sg7[0]);
		
		for (i = 0; i < 10; i = i + 1) begin
			#5; button <= 1'b0;
			#5; button <= 1'b1;
		end
		
		#10; $stop;
	end
endmodule