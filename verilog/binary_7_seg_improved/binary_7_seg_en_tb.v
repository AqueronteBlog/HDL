/* 
@brief	binary_to_7seg_en_tb.v
@details	This is a testbecnh for the binary_to_7seg_en.v model. 


@return	N/A

@author	Manuel Caballero
@date		14/November/2024
@version	14/November/2024    The ORIGIN
@pre		This source code was tested with the binary_to_7seg_tb.v file and ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
`timescale 1ns/1ns

module binary_to_7seg_en_tb;
	reg enable, seg7all_on;
	reg d, c, b, a;
	wire sg7_g, sg7_f, sg7_e, sg7_d, sg7_c, sg7_b, sg7_a;
	
	BINARY_TO_7SEG_EN uut0 (.enable(enable), .seg7all_on(seg7all_on), .a(a), .b(b), .c(c), .d(d), .sg7_g(sg7_g), .sg7_f(sg7_f), .sg7_e(sg7_e), .sg7_d(sg7_d), .sg7_c(sg7_c), .sg7_b(sg7_b), .sg7_a(sg7_a));
	
	initial begin
		{enable, seg7all_on, d, c, b, a} = 0;
		
		$monitor("time%0t en seg7all_on dcba %0b%0b %0b%0b%0b%0b | gfedcba %0b%0b%0b%0b", $time, enable, seg7all_on, d, c, b, a, sg7_g, sg7_f, sg7_e, sg7_d, sg7_c, sg7_b, sg7_a);
		
		#10; enable <= 1;
			  a <= 1;	// 1
			  b <= 0;
			  c <= 0;
			  d <= 0;
		#10; a <= 0;	// 2
			  b <= 1;
			  c <= 0;
			  d <= 0;
		#10; a <= 1;	// 3
			  b <= 1;
			  c <= 0;
			  d <= 0;
		#10; a <= 0;	// 4
			  b <= 0;
			  c <= 1;
			  d <= 0; 
		#10; a <= 1;	// 5
			  b <= 0;
			  c <= 1;
			  d <= 0; 
		#10; a <= 0;	// 6
			  b <= 1;
			  c <= 1;
			  d <= 0; 
		#10; a <= 1;	// 7
			  b <= 1;
			  c <= 1;
			  d <= 0; 
		#10; a <= 0;	// 8
			  b <= 0;
			  c <= 0;
			  d <= 1; 
		#10; a <= 1;	// 9
			  b <= 0;
			  c <= 0;
			  d <= 1; 
		#10; a <= 1;	// 0
			  b <= 1;
			  c <= 0;
			  d <= 1; 
		#10; seg7all_on <= 1;
			  a <= 1;	
			  b <= 1;
			  c <= 0;
			  d <= 1;
		#10; seg7all_on <= 0;
			  a <= 1;	
			  b <= 1;
			  c <= 0;
			  d <= 1;
		#10; $stop;
	end
endmodule	