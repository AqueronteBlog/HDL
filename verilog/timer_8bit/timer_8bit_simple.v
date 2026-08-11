/* 
@brief	timer_8bit_simple.v
@details	This example shows how to model a simple 8-bit timer. 


@return	N/A

@author	Manuel Caballero
@date		11/August/2026
@version	11/August/2026    The ORIGIN
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
module timer_8bit_simple (
	input 		clk,
	input 		reset,
	input 		start,
	input[7:0] 	load_value,
	output 		done
);
	
	// timer logic
	reg 		done_aux	=	1'b0;
	reg[7:0]	count		=	8'b0;
	
	
	always @(negedge clk) begin
		if (reset == 1'b1) begin
			done_aux	<=	1'b0;
			count		<=	8'b0;
		end
		else if (start == 1'b1) begin
			//count		<=	load_value - 8'b1;	// due to tolerance for low clock frequency source
			count		<=	load_value;
			done_aux	<=	1'b0;
		end
		else if (count > 8'b0) begin
			count		<=	count - 8'b1;
		end
		else
			done_aux	<=	1'b1;
	end
	
	
	// outputs
	assign done	=	done_aux;

endmodule