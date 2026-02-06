/* 
@brief	binary_to_7seg_function_tb.v
@details	This is a testbecnh for the binary_to_7seg_function.v model. 


@return	N/A

@author	Manuel Caballero
@date		06/February/2026
@version	06/February/2026    The ORIGIN
@pre		This source code was tested with the binary_to_7seg_function.v file and ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://x.com/aqueronteblog
*/
`timescale 1ns/1ns

module binary_to_7seg_function_tb;
	reg d, c, b, a;
	wire sg7_g, sg7_f, sg7_e, sg7_d, sg7_c, sg7_b, sg7_a;
	
	binary_to_7seg_function uut0 (.a(a), .b(b), .c(c), .d(d), .sg7_g(sg7_g), .sg7_f(sg7_f), .sg7_e(sg7_e), .sg7_d(sg7_d), .sg7_c(sg7_c), .sg7_b(sg7_b), .sg7_a(sg7_a));
	
	initial begin
		{d, c, b, a} = 0;
		
		$monitor("time%0t dcba %0b%0b%0b%0b | gfedcba %0b%0b%0b%0b", $time, d, c, b, a, sg7_g, sg7_f, sg7_e, sg7_d, sg7_c, sg7_b, sg7_a);
		
		#10; a <= 1;	// 1
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
		#10; $stop;
	end
endmodule	