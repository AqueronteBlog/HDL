/* 
@brief	d_flipflop_simple_tb.v
@details	This is a testbecnh for the d_flipflop_simple.v model. 


@return	N/A

@author	Manuel Caballero
@date		13/December/2024
@version	13/December/2024    The ORIGIN
@pre		This source code was tested with the d_flipflop_simple.v file and ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
`timescale 1ms/1ms

module d_flipflop_simple_tb;
	reg d, clock;
	wire q, qbar;
	
	d_flipflop_simple uut0 (.d(d), .clock(clock), .q(q), .qbar(qbar));
	
	
	integer i;
	initial begin
		{d, clock} <= 1'b0;
		
		#10; for (i = 0; i < 10; i = i + 1)
				begin
					#5; d <= ~d;
				end
		#10; $stop;
	end
	
	always @(*) begin
		#1; clock <= ~clock;
	end
endmodule
