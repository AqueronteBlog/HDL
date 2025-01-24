/* 
@brief	jk_flipflop_simple.v
@details	This example shows how to model a simple J-K flip-flop. 


@return	N/A

@author	Manuel Caballero
@date		03/December/2024
@version	03/December/2024    The ORIGIN
@pre		This source code was tested using ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
module jk_flipflop_simple (
	input j, k, clock,
	output q, qbar
);

	// J-K flip-flop 
	reg q_reg = 1'b0;
	reg qbar_reg = 1'b1;
	
	always @(posedge clock) begin
		if ((j == 1'b0) && (k == 1'b0))
			begin
				q_reg <= q_reg;
				qbar_reg <= qbar_reg;
			end
		else if ((j == 1'b1) && (k == 1'b0))
			begin
				q_reg <= 1'b1;
				qbar_reg <= 1'b0;
			end
		else if ((j == 1'b0) && (k == 1'b1))
			begin
				q_reg <= 1'b0;
				qbar_reg <= 1'b1;
			end
		else
			begin
				q_reg <= ~q_reg;
				qbar_reg <= ~qbar_reg;
			end
	end
	
	// Ouputs. J-K flip-flop
	assign q = q_reg;
	assign qbar = qbar_reg;
	
endmodule
