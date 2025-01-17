/* 
@brief	t_flipflop_simple_c2_de2.v
@details	This example shows how to model a simple T flip-flop. 


@return	N/A

@author	Manuel Caballero
@date		17/January/2025
@version	17/January/20254    The ORIGIN
@pre		This source code was tested on the Altera’s DE2 board.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
module t_flipflop_simple_c2_de2 (
	input CLOCK_50,
	input[1:0] SW,
	output[1:0] LEDG 
);
	
	reg[31:0] delay = 32'b0;
	reg clk_1hz = 1'b0;
	
	t_flipflop_simple uut0 (.clk(clk_1hz), .t(SW[0]), .q(LEDG[1]), .qbar(LEDG[0]));
	
	// 1s periodo retardo
	always @(negedge CLOCK_50) begin
		if (delay < 32'd_25_000_000)
			delay <= delay + 32'b1;
		else
			begin
				delay <= 32'b0;
				clk_1hz <= ~clk_1hz;
			end
	end	
endmodule