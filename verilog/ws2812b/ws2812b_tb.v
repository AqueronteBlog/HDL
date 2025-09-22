/* 
@brief	ws2812b_tb.v
@details	This is a testbecnh for the ws2812b.v model. 


@return	N/A

@author	Manuel Caballero
@date		22/September/2025
@version	22/September/2025    The ORIGIN
@pre		This source code was tested with the ws2812b.v file and ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://x.com/aqueronteblog
*/
`timescale 1ns/1ns

module ws2812b_tb;
	reg clock;
	reg enable;
	reg[7:0] r, g, b;
	wire bit_out;
	wire bit_ready;
	
	ws2812b uut0 (.clock(clock), .enable(enable), .r(r), .g(g), .b(b), .bit_out(bit_out), .bit_ready(bit_ready));
	
	
	initial begin
		clock <= 1'b_0;
		enable <= 1'b_0;
		#20;
		
		r <= 8'b_10000000;
		g <= 8'b_11000000;
		b <= 8'b_11100000;
		#20;
		
		enable <= 1'b_1;
		#20;
		wait (bit_ready == 1'b_0);
		enable <= 1'b_0;
		#20;
		
		r <= 8'b_11111111;
		g <= 8'b_00000000;
		b <= 8'b_00000000;
		#20;
		
		enable <= 1'b_1;
		#20;
		wait (bit_ready == 1'b_0);
		enable <= 1'b_0;
		#20;
		
		#1000; $stop;
	end
	
	// CLOCK 50MHz
	always @(*) begin
		#10; clock <= ~clock;
	end
endmodule