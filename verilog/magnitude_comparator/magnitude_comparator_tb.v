`timescale 1ns/1ns

module magnitude_comparator_tb;
	reg a, b;
	wire a_greater_b, a_equal_b, a_lower_b;
	
	MAGNITUDE_COMPARATOR uut0(.a(a), .b(b), .a_greater_b(a_greater_b), .a_equal_b(a_equal_b), .a_lower_b(a_lower_b));
	
	initial begin
		{a, b} = 0;
		
		$monitor("time%0t a=%0b b=%0b | a_greater_b=%0b a_equal_b=%0b a_lower_b=%0b", $time, a, b, a_greater_b, a_equal_b, a_lower_b);
		
		#10; a <= 1;
		#10; a <= 0;
			  b <= 1;
		#10; a <= 1;
			  b <= 1;
		#10; $stop;
	end
endmodule
			 