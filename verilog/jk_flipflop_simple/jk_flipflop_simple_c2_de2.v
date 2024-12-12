/* 
@brief	jk_flipflop_simple_c2_de2.v
@details	This example shows how to model a simple J-K flip-flop. 


@return	N/A

@author	Manuel Caballero
@date		03/December/2024
@version	03/December/2024    The ORIGIN
@pre		This source code was tested on the Altera’s DE2 board.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
module jk_flipflop_simple_c2_de2 (
	input CLOCK_50,
	input[1:0] SW, 
	output[1:0] LEDG 
);
	
	reg[31:0] delay = 32'd_0;
	reg clk_1Hz = 1'b0;
	
	jk_flipflop_simple uut0 (.j(SW[1]), .k(SW[0]), .clock(clk_1Hz), .q(LEDG[1]), .qbar(LEDG[0]));
	
	// 1s periodo retardo
	always @(posedge CLOCK_50) begin
		if (delay < 32'd_25_000_000)
			delay <= delay + 32'b1;
		else
			begin
				delay <= 32'd_0;
				clk_1Hz <= ~clk_1Hz;
			end
	end
endmodule