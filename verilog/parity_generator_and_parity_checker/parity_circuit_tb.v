/* 
@brief	parity_circuit_tb.v
@details	This is a testbecnh for the parity_circuit.v model. 


@return	N/A

@author	Manuel Caballero
@date		21/June/2026
@version	21/June/2026   The ORIGIN
@pre		This source code was tested with the parity_circuit.v file and ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://x.com/aqueronteblog
*/
`timescale 1ms/1ms

module parity_circuit_tb;
	reg a, b, c;
	wire pc;
	
	parity_circuit uut0 (.a(a), .b(b), .c(c), .pc(pc));
	
	initial begin
		$display("Time	a b c | pc");
		$monitor("%t	%b %b %b | %b", $time, a, b, c, pc);
		
		{a, b, c} = 1'b0;
		#10;
		
		a <= 1'b0;
		b <= 1'b0;
		c <= 1'b1;
		#10;
		
		a <= 1'b0;
		b <= 1'b1;
		c <= 1'b0;
		#10;
		
		a <= 1'b0;
		b <= 1'b1;
		c <= 1'b1;
		#10;
		
		a <= 1'b1;
		b <= 1'b0;
		c <= 1'b0;
		#10;
		
		a <= 1'b1;
		b <= 1'b0;
		c <= 1'b1;
		#10;
		
		a <= 1'b1;
		b <= 1'b1;
		c <= 1'b0;
		#10;
		
		a <= 1'b1;
		b <= 1'b1;
		c <= 1'b1;
		#10;
		
		#10; $stop;
	end

endmodule