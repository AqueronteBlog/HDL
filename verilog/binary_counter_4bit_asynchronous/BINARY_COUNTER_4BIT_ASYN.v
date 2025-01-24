/* 
@brief	BINARY_COUNTER_4BIT_ASYN.v
@details	This example shows how to model a 4-bit asynchronous up/down counter using JK flip-flops. 


@return	N/A

@author	Manuel Caballero
@date		24/January/2025
@version	24/January/2025    The ORIGIN
@pre		This source code was tested using ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
module BINARY_COUNTER_4BIT_ASYN (
	input clock,
	output q0, qbar0, q1, qbar1, q2, qbar2, q3, qbar3
);

	jk_flipflop_simple uut0 (.j(1'b1), .k(1'b1), .q(q0), .qbar(qbar0), .clock(clock));
	jk_flipflop_simple uut1 (.j(1'b1), .k(1'b1), .q(q1), .qbar(qbar1), .clock(q0));
	jk_flipflop_simple uut2 (.j(1'b1), .k(1'b1), .q(q2), .qbar(qbar2), .clock(q1));
	jk_flipflop_simple uut3 (.j(1'b1), .k(1'b1), .q(q3), .qbar(qbar3), .clock(q2));

endmodule