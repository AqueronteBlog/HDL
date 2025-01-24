/* 
@brief	BINARY_COUNTER_4BIT_ASYN.v
@details	This is a testbecnh for the BINARY_COUNTER_4BIT_ASYN.v model. 


@return	N/A

@author	Manuel Caballero
@date		24/January/2025
@version	24/January/2025    The ORIGIN
@pre		This source code was tested with the BINARY_COUNTER_4BIT_ASYN.v file and ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
`timescale 1ms/1ms

module BINARY_COUNTER_4BIT_ASYN_tb ();
	reg clock;
	wire q0, qbar0, q1, qbar1, q2, qbar2, q3, qbar3;

	BINARY_COUNTER_4BIT_ASYN uut0 (.clock(clock), .q0(q0), .qbar0(qbar0), .q1(q1), .qbar1(qbar1), .q2(q2), .qbar2(qbar2), .q3(q3), .qbar3(qbar3));
	
	initial begin
		clock <= 1'b0;
		
		#70; $stop;	
	end
	
	always @(*) begin
		#1; clock <= ~clock;
	end
endmodule
