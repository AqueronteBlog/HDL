/* 
@brief	bcd_to_7seg_8display_tb.v
@details	This is a testbecnh for the bcd_to_7seg_8displays.v model. 


@return	N/A

@author	Manuel Caballero
@date		25/November/2024
@version	25/November/2024    The ORIGIN
@pre		This source code was tested with the bcd_to_7seg_8displays.v file and ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
`timescale 1ns/1ns

module bcd_to_7seg_8display_tb;
	reg clock = 1'b0;
	reg enable, seg7all_on;
	wire[6:0] sg7_hex0, sg7_hex1, sg7_hex2, sg7_hex3, sg7_hex4, sg7_hex5, sg7_hex6, sg7_hex7;
	
	test_bcd_to_7seg_8displays uut0(.clock(clock), .enable(enable), .seg7all_on(seg7all_on), .sg7_hex0(sg7_hex0), .sg7_hex1(sg7_hex1), .sg7_hex2(sg7_hex2), .sg7_hex3(sg7_hex3), .sg7_hex4(sg7_hex4), .sg7_hex5(sg7_hex5), .sg7_hex6(sg7_hex6), .sg7_hex7(sg7_hex7));
	
	initial begin
		{enable, seg7all_on} <= 0;
		#10; enable <= 1;
			  seg7all_on <= 1;
			  
		#10; seg7all_on <= 0;
		
		#4000000010; $stop;
	end
	
	// 20ns period clock
	always @(*) begin
		#10; clock <= ~clock;
	end
endmodule