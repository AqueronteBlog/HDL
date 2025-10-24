/* 
@brief	pixels_ws2812b_tb.v
@details	This example shows how to model a pixels_ws2812b device. 


@return	N/A

@author	Manuel Caballero
@date		24/October/2025
@version	24/October/2025    The ORIGIN
@pre		This source code was tested on the Altera’s DE2 board.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://x.com/aqueronteblog
*/
`timescale 1ns/1ns

module pixels_ws2812b_tb;
	reg clock;
	reg enable;
	reg[23:0] pixel1, pixel2, pixel3;
	wire bit_out;
	wire bit_ready;
	
	pixels_ws2812b #(.NUM_LEDS(8'd_3)) uut0 (.clock(clock), .enable(enable), .pixels({pixel1, pixel2, pixel3}), .bit_out(bit_out), .bit_ready(bit_ready));
	
	initial begin
		clock <= 1'b0;
		enable <= 1'b0;
		#20;
		
		pixel1 <= {8'h00, 8'hFF, 8'h00};	// Pixel 1: red
		pixel2 <= {8'hFF, 8'h00, 8'h00};	// Pixel 2: green
		pixel3 <= {8'h00, 8'h00, 8'hFF};	// Pixel 3: blue
		#20;
		
		enable <= 1'b1;
		#20;
		wait(bit_ready == 1'b_0);
		enable <= 1'b0;
		#20;
		
		pixel1 <= {8'hFF, 8'h00, 8'h00};	// Pixel 1: green
		pixel2 <= {8'h00, 8'h00, 8'h00};	// Pixel 2: off
		pixel3 <= {8'h00, 8'h00, 8'h00};	// Pixel 3: off
		#20;
		
		enable <= 1'b1;
		#20;
		wait(bit_ready == 1'b_0);
		enable <= 1'b0;
		#20;
		
		#1000; $stop;
	end
	
	// clock
	always @(*) begin
		#10; clock <= ~clock;
	end
	
endmodule