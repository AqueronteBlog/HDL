/* 
@brief	t_flipflop_simple.v
@details	This example shows how to model a simple T flip-flop. 


@return	N/A

@author	Manuel Caballero
@date		17/January/2025
@version	17/January/2025    The ORIGIN
@pre		This source code was tested using ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
module t_flipflop_simple (
	input t, clk,
	output q, qbar
);
	
	reg q_reg = 1'b0;
	reg qbar_reg = 1'b1;
	
	always @(negedge clk) begin
		if (t == 1'b0)
			begin
				q_reg <= q_reg;
				qbar_reg <= qbar_reg;
			end
		else
			begin
				q_reg <= ~q_reg;
				qbar_reg <= ~qbar_reg;
			end
	end
	
	assign q = q_reg;
	assign qbar = qbar_reg;

endmodule

