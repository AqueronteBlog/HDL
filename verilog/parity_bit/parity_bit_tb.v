/* 
@brief	parity_bit_tb.v
@details	This is a testbecnh for the parity_bit.v model. 


@return	N/A

@author	Manuel Caballero
@date		17/March/2026
@version	17/March/2026   The ORIGIN
@pre		This source code was tested with the parity_bit.v file and ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://x.com/aqueronteblog
*/
`timescale 1ns/1ns

module parity_bit_tb;
	reg a, b, c;
	wire odd, even;
	
	parity_bit uut0 (.a(a), .b(b), .c(c), .odd(odd), .even(even));
	
	initial begin
	{a, b, c} = 0;
	
	$monitor ("time%0t cba %0b%0b%0b | odd even %0b%0b", $time, c, b, a, odd, even);
	
	#10;	a <= 1;
			b <= 0;
			c <= 0;
	#10;	a <= 0;
			b <= 1;
			c <= 0;
	#10;	a <= 1;
			b <= 1;
			c <= 0;
	#10;	a <= 0;
			b <= 0;
			c <= 1;
	#10;	a <= 1;
			b <= 0;
			c <= 1;
	#10;	a <= 0;
			b <= 1;
			c <= 1;
	#10;	a <= 1;
			b <= 1;
			c <= 1;
	#10; $stop;
	end	
endmodule