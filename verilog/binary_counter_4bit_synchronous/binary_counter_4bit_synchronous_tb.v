/* 
@brief	binary_counter_4bit_synchronous_tb.v
@details	This is a testbecnh for the binary_counter_4bit_synchronous.v model. 


@return	N/A

@author	Manuel Caballero
@date		03/February/2025
@version	03/February/2025    The ORIGIN
@pre		This source code was tested with the binary_counter_4bit_synchronous.v file and ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
`timescale 1ms/1ms

module binary_counter_4bit_synchronous_tb;
	reg clock;
	wire q0, qbar0, q1, qbar1, q2, qbar2, q3, qbar3;
	
	binary_counter_4bit_synchronous uut0 (.clock(clock), .q0(q0), .qbar0(qbar0), .q1(q1), .qbar1(qbar1), .q2(q2), .qbar2(qbar2), .q3(q3), .qbar3(qbar3));
	
	initial begin
		clock <= 1'b0;
		
		#70; $stop;
	end
	
	always @(*) begin
		#1; clock <= ~clock;
	end
	
endmodule