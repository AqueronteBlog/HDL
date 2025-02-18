/* 
@brief	jonhson_ring_counter_4bit.v
@details	This example shows how to model a 4-bit Johnson ring counter


@return	N/A

@author	Manuel Caballero
@date		18/February/2025
@version	18/February/2025    The ORIGIN
@pre		This source code was tested using ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
module jonhson_ring_counter_4bit (
	input clock,
	output q0, qbar0, q1, qbar1, q2, qbar2, q3, qbar3
);

	d_flipflop_simple d0 (.d(qbar3), .q(q0), .qbar(qbar0), .clock(clock));
	d_flipflop_simple d1 (.d(q0), .q(q1), .qbar(qbar1), .clock(clock));
	d_flipflop_simple d2 (.d(q1), .q(q2), .qbar(qbar2), .clock(clock));
	d_flipflop_simple d3 (.d(q2), .q(q3), .qbar(qbar3), .clock(clock));

endmodule