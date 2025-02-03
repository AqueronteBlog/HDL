/* 
@brief	binary_counter_4bit_synchronous.v
@details	This example shows how to model a 4-bit synchronous up/down counter using JK flip-flops. 


@return	N/A

@author	Manuel Caballero
@date		03/February/2025
@version	03/February/2025    The ORIGIN
@pre		This source code was tested using ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
module binary_counter_4bit_synchronous (
	input clock,
	output q0, qbar0, q1, qbar1, q2, qbar2, q3, qbar3
);
	wire and1_output;
	wire and2_output;
	
	jk_flipflop_simple biestable0 (.j(1'b1), .k(1'b1), .q(q0), .qbar(qbar0), .clock(clock));
	jk_flipflop_simple biestable1 (.j(q0), .k(q0), .q(q1), .qbar(qbar1), .clock(clock));
	and(and1_output, q0, q1);
	jk_flipflop_simple biestable2 (.j(and1_output), .k(and1_output), .q(q2), .qbar(qbar2), .clock(clock));
	and(and2_output, and1_output, q2);
	jk_flipflop_simple biestable3 (.j(and2_output), .k(and2_output), .q(q3), .qbar(qbar3), .clock(clock));

endmodule