/* 
@brief	jk_flipflop_simple_tb.v
@details	This is a testbecnh for the jk_flipflop_simple.v model. 


@return	N/A

@author	Manuel Caballero
@date		03/December/2024
@version	03/December/2024    The ORIGIN
@pre		This source code was tested with the jk_flipflop_simple.v file and ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
`timescale 1ms/1ms

module jk_flipflop_simple_tb ();
	reg j, k, clock;
	wire q, qbar;
	
	jk_flipflop_simple uut0 (.j(j), .k(k), .clock(clock), .q(q), .qbar(qbar));
	
	initial begin
		{j, k, clock} <= 0;
		
		#10; j <= 1;
		#10; j <= 0;
			  k <= 1;
		#10; j <= 1;
			  k <= 1;
		#10; j <= 0;
			  k <= 0;
		#10; j <= 1;
			  k <= 1;
		#40; $stop;
	end
	
	always @(*) begin
		#1; clock <= ~clock;
	end
endmodule
