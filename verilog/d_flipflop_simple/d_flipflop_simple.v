/* 
@brief	d_flipflop_simple.v
@details	This example shows how to model a simple D flip-flop. 


@return	N/A

@author	Manuel Caballero
@date		13/December/2024
@version	13/December/2024    The ORIGIN
@pre		This source code was tested using ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
module d_flipflop_simple (
	input d, clock,
	output q, qbar
);

	// D flip-flop logic
	reg q_reg = 1'bx;
	reg qbar_reg = 1'bx;
	
	always @(posedge clock) begin
		if (d == 1'b1)
			begin
				q_reg <= 1'b1;
				qbar_reg <= 1'b0;
			end
		else
			begin
				q_reg <= 1'b0;
				qbar_reg <= 1'b1;
			end
	end
	
	// D flip-flop outputs
	assign q = q_reg;
	assign qbar = qbar_reg;
endmodule