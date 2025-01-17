/* 
@brief	t_flipflop_simple_tb.v
@details	This is a testbecnh for the t_flipflop_simple.v model. 


@return	N/A

@author	Manuel Caballero
@date		17/January/2025
@version	17/January/2025    The ORIGIN
@pre		This source code was tested with the t_flipflop_simple.v file and ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
`timescale 1ms/1ms

module t_flipflop_simple_tb ();
	reg t, clk;
	wire q, qbar;
	integer i;
	
	t_flipflop_simple uut0 (.t(t), .clk(clk), .q(q), .qbar(qbar));
	
	initial begin
		clk <= 1;
		t <= 0;
		
		#10; for (i = 0; i < 10; i = i + 1)
				begin
					#5; t <= ~t;
				end
		#10; $stop;
	end
	
	always @(*) begin
		#1; clk <= ~clk;
	end
endmodule