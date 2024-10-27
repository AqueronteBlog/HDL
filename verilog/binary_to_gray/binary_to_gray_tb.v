`timescale 1ns/1ns

module binary_to_gray_tb;
	reg a, b, c, d;
	wire g3, g2, g1, g0;
	
	BINARY_TO_GRAY uut0(.a(a), .b(b), .c(c), .d(d), .g3(g3), .g2(g2), .g1(g1), .g0(g0));
	
	initial begin
		{a, b, c, d} = 0;
		
		$monitor("time%0t dcba %0b%0b%0b%0b | g3g2g1g0 %0b%0b%0b%0b", $time, d, c, b, a, g3, g2, g1, g0);
		
		#10; a <= 1;
			  b <= 0;
			  c <= 0;
			  d <= 0;
		#10; a <= 0;
			  b <= 1;
			  c <= 0;
			  d <= 0;
		#10; a <= 1;
			  b <= 1;
			  c <= 0;
			  d <= 0;
		#10; a <= 0;
			  b <= 0;
			  c <= 1;
			  d <= 0;
		#10; a <= 1;
			  b <= 0;
			  c <= 1;
			  d <= 0;
		#10; a <= 0;
			  b <= 1;
			  c <= 1;
			  d <= 0;
		#10; a <= 1;
			  b <= 1;
			  c <= 1;
			  d <= 0;
		#10; a <= 0;
			  b <= 0;
			  c <= 0;
			  d <= 1;
		#10; a <= 1;
			  b <= 0;
			  c <= 0;
			  d <= 1;
		#10; a <= 0;
			  b <= 1;
			  c <= 0;
			  d <= 1;
		#10; a <= 1;
			  b <= 1;
			  c <= 0;
			  d <= 1;
		#10; a <= 0;
			  b <= 0;
			  c <= 1;
			  d <= 1;
		#10; a <= 1;
			  b <= 0;
			  c <= 1;
			  d <= 1;
		#10; a <= 0;
			  b <= 1;
			  c <= 1;
			  d <= 1;
		#10; a <= 1;
			  b <= 1;
			  c <= 1;
			  d <= 1;
		#10; $stop;
	end
endmodule