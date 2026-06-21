/* 
@brief	parity_checker_tb.v
@details	This is a testbecnh for the parity_checker.v model. 


@return	N/A

@author	Manuel Caballero
@date		19/May/2026
@version	19/May/2026   The ORIGIN
@pre		This source code was tested with the parity_checker.v file and ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://x.com/aqueronteblog
*/
`timescale 1ms/1ms

module parity_checker_tb;
	reg a, b, c, p;
	wire pc;
	
	parity_checker uut0 (.a(a), .b(b), .c(c), .p(p), .pc(pc));
	
	initial begin
		$display("Time	a b c | p || pc");
		$monitor("%t	%b %b %b | %b || %b", $time, a, b, c, p, pc);
		
		{a, b, c, p} = 1'b0;
		
		#10;
		a <= 1'b0;
		b <= 1'b0;
		c <= 1'b0;
		p <= 1'b1;
		
		#10;
		a <= 1'b0;
		b <= 1'b0;
		c <= 1'b1;
		p <= 1'b0;
		
		#10;
		a <= 1'b0;
		b <= 1'b0;
		c <= 1'b1;
		p <= 1'b1;
		
		#10;
		a <= 1'b0;
		b <= 1'b1;
		c <= 1'b0;
		p <= 1'b0;
		
		#10;
		a <= 1'b0;
		b <= 1'b1;
		c <= 1'b0;
		p <= 1'b1;
		
		#10;
		a <= 1'b0;
		b <= 1'b1;
		c <= 1'b1;
		p <= 1'b1;
		
		#10;
		a <= 1'b1;
		b <= 1'b0;
		c <= 1'b0;
		p <= 1'b0;
		
		#10;
		a <= 1'b1;
		b <= 1'b0;
		c <= 1'b0;
		p <= 1'b1;
		
		#10;
		a <= 1'b1;
		b <= 1'b0;
		c <= 1'b1;
		p <= 1'b0;
		
		#10;
		a <= 1'b1;
		b <= 1'b0;
		c <= 1'b1;
		p <= 1'b1;
		
		#10;
		a <= 1'b1;
		b <= 1'b1;
		c <= 1'b0;
		p <= 1'b0;
		
		#10;
		a <= 1'b1;
		b <= 1'b1;
		c <= 1'b0;
		p <= 1'b1;
		
		#10;
		a <= 1'b1;
		b <= 1'b1;
		c <= 1'b1;
		p <= 1'b0;
		
		#10;
		a <= 1'b1;
		b <= 1'b1;
		c <= 1'b1;
		p <= 1'b1;
		
		#10; $stop;
	end

endmodule