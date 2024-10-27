`timescale 1ns/1ns

module gray_to_binary_tb;
	reg g3, g2, g1, g0;
	wire d, c, b, a;
	
	GRAY_TO_BINARY uut0(.g3(g3), .g2(g2), .g1(g1), .g0(g0), .d(d), .c(c), .b(b), .a(a));
	
	initial begin
		{g3, g2, g1, g0} = 0;
		
		$monitor("time%0t g3g2g1g0 %0b%0b%0b%0b | dcba %0b%0b%0b%0b", $time, g3, g2, g1, g0, d, c, b, a);
		
		#10; g0 <= 1;
			  g1 <= 0;
			  g2 <= 0;
			  g3 <= 0;
		#10; g0 <= 1;
			  g1 <= 1;
			  g2 <= 0;
			  g3 <= 0;	
		#10; g0 <= 0;
			  g1 <= 1;
			  g2 <= 0;
			  g3 <= 0;
		#10; g0 <= 0;
			  g1 <= 1;
			  g2 <= 1;
			  g3 <= 0;
		#10; g0 <= 1;
			  g1 <= 1;
			  g2 <= 1;
			  g1 <= 0;
		#10; g0 <= 1;
			  g1 <= 0;
			  g2 <= 1;
			  g3 <= 0;
		#10; g0 <= 0;
			  g1 <= 0;
			  g2 <= 1;
			  g1 <= 0;
		#10; g0 <= 0;
			  g1 <= 0;
			  g2 <= 1;
			  g3 <= 1;
		#10; g0 <= 1;
			  g1 <= 0;
			  g2 <= 1;
			  g3 <= 1;
		#10; g0 <= 1;
			  g1 <= 1;
			  g2 <= 1;
			  g3 <= 1;
		#10; g0 <= 0;
			  g1 <= 1;
			  g2 <= 1;
			  g3 <= 1;
		#10; g0 <= 0;
			  g1 <= 1;
			  g2 <= 0;
			  g3 <= 1;
		#10; g0 <= 1;
			  g1 <= 1;
			  g2 <= 0;
			  g3 <= 1;
		#10; g0 <= 1;
			  g1 <= 0;
			  g2 <= 0;
			  g3 <= 1;
		#10; g0 <= 0;
			  g1 <= 0;
			  g2 <= 0;
			  g3 <= 1;
		#10; $stop;
	end
endmodule
			  