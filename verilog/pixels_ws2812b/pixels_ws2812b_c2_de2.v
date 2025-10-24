/* 
@brief	pixels_ws2812b_c2_de2.v
@details	This example shows how to model a ws2812b device. 


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
module pixels_ws2812b_c2_de2 (
	input CLOCK_50,
	//input[17:0] SW,
	output[1:0] GPIO_0,
	output[1:0] LEDG
);

	// g r b
	reg[23:0] pixel1;
	reg[23:0] pixel2;
	reg[23:0] pixel3;
	reg[23:0] pixel4;
	reg[23:0] pixel5;
	reg[23:0] pixel6;
	reg[23:0] pixel7;
	reg[23:0] pixel8;
	
	reg pixel_en = 1'b0;
	
	reg[31:0] delay = 32'd_0;
	reg clk_2hz = 1'b0;
	reg[7:0] pixel_on_animation = 8'b_00000001;
	
	// pixels_ws2812b #(.NUM_LEDS(8'd_8)) ws2812b_0 (.clock(CLOCK_50), .enable(SW[17]), .pixels({pixel1, pixel2, pixel3, pixel4, pixel5, pixel6, pixel7, pixel8}), .bit_out(GPIO_0[0]), .bit_ready(LEDG[0]));
	pixels_ws2812b #(.NUM_LEDS(8'd_8)) ws2812b_0 (.clock(CLOCK_50), .enable(pixel_en), .pixels({pixel1, pixel2, pixel3, pixel4, pixel5, pixel6, pixel7, pixel8}), .bit_out(GPIO_0[0]), .bit_ready(LEDG[0]));
	
	// PIXEL animation
	always @(negedge clk_2hz) begin
		case (pixel_on_animation)
			8'b_00000001: begin
				pixel1 <= {8'h00, 8'hFF, 8'h00};	// red
				pixel2 <= {8'h00, 8'h00, 8'h00};	// off
				pixel3 <= {8'h00, 8'h00, 8'h00};	// off
				pixel4 <= {8'h00, 8'h00, 8'h00};	// off
				pixel5 <= {8'h00, 8'h00, 8'h00};	// off
				pixel6 <= {8'h00, 8'h00, 8'h00};	// off
				pixel7 <= {8'h00, 8'h00, 8'h00};	// off
				pixel8 <= {8'h00, 8'h00, 8'h00};	// off
				
				// next pixel
				pixel_on_animation <= (pixel_on_animation << 8'b_1);
			end
			
			8'b_00000010: begin
				pixel1 <= {8'h00, 8'h00, 8'h00};	// off
				pixel2 <= {8'hFF, 8'h00, 8'h00};	// green
				pixel3 <= {8'h00, 8'h00, 8'h00};	// off
				pixel4 <= {8'h00, 8'h00, 8'h00};	// off
				pixel5 <= {8'h00, 8'h00, 8'h00};	// off
				pixel6 <= {8'h00, 8'h00, 8'h00};	// off
				pixel7 <= {8'h00, 8'h00, 8'h00};	// off
				pixel8 <= {8'h00, 8'h00, 8'h00};	// off
				
				// next pixel
				pixel_on_animation <= (pixel_on_animation << 8'b_1);
			end
			
			8'b_00000100: begin
				pixel1 <= {8'h00, 8'h00, 8'h00};	// off
				pixel2 <= {8'h00, 8'h00, 8'h00};	// off
				pixel3 <= {8'h00, 8'h00, 8'hFF};	// blue
				pixel4 <= {8'h00, 8'h00, 8'h00};	// off
				pixel5 <= {8'h00, 8'h00, 8'h00};	// off
				pixel6 <= {8'h00, 8'h00, 8'h00};	// off
				pixel7 <= {8'h00, 8'h00, 8'h00};	// off
				pixel8 <= {8'h00, 8'h00, 8'h00};	// off
				
				// next pixel
				pixel_on_animation <= (pixel_on_animation << 8'b_1);
			end
			
			8'b_00001000: begin
				pixel1 <= {8'h00, 8'h00, 8'h00};	// off
				pixel2 <= {8'h00, 8'h00, 8'h00};	// off
				pixel3 <= {8'h00, 8'h00, 8'h00};	// off
				pixel4 <= {8'h00, 8'hFF, 8'h00};	// red
				pixel5 <= {8'h00, 8'h00, 8'h00};	// off
				pixel6 <= {8'h00, 8'h00, 8'h00};	// off
				pixel7 <= {8'h00, 8'h00, 8'h00};	// off
				pixel8 <= {8'h00, 8'h00, 8'h00};	// off
				
				// next pixel
				pixel_on_animation <= (pixel_on_animation << 8'b_1);
			end
			
			8'b_00010000: begin
				pixel1 <= {8'h00, 8'h00, 8'h00};	// off
				pixel2 <= {8'h00, 8'h00, 8'h00};	// off
				pixel3 <= {8'h00, 8'h00, 8'h00};	// off
				pixel4 <= {8'h00, 8'h00, 8'h00};	// off
				pixel5 <= {8'hFF, 8'h00, 8'h00};	// green
				pixel6 <= {8'h00, 8'h00, 8'h00};	// off
				pixel7 <= {8'h00, 8'h00, 8'h00};	// off
				pixel8 <= {8'h00, 8'h00, 8'h00};	// off
				
				// next pixel
				pixel_on_animation <= (pixel_on_animation << 8'b_1);
			end
			
			8'b_00100000: begin
				pixel1 <= {8'h00, 8'h00, 8'h00};	// off
				pixel2 <= {8'h00, 8'h00, 8'h00};	// off
				pixel3 <= {8'h00, 8'h00, 8'h00};	// off
				pixel4 <= {8'h00, 8'h00, 8'h00};	// off
				pixel5 <= {8'h00, 8'h00, 8'h00};	// off
				pixel6 <= {8'h00, 8'h00, 8'hFF};	// blue
				pixel7 <= {8'h00, 8'h00, 8'h00};	// off
				pixel8 <= {8'h00, 8'h00, 8'h00};	// off
				
				// next pixel
				pixel_on_animation <= (pixel_on_animation << 8'b_1);
			end
			
			8'b_01000000: begin
				pixel1 <= {8'h00, 8'h00, 8'h00};	// off
				pixel2 <= {8'h00, 8'h00, 8'h00};	// off
				pixel3 <= {8'h00, 8'h00, 8'h00};	// off
				pixel4 <= {8'h00, 8'h00, 8'h00};	// off
				pixel5 <= {8'h00, 8'h00, 8'h00};	// off
				pixel6 <= {8'h00, 8'h00, 8'h00};	// off
				pixel7 <= {8'h00, 8'hFF, 8'h00};	// red
				pixel8 <= {8'h00, 8'h00, 8'h00};	// off
				
				// next pixel
				pixel_on_animation <= (pixel_on_animation << 8'b_1);
			end
			
			8'b_10000000: begin
				pixel1 <= {8'h00, 8'h00, 8'h00};	// off
				pixel2 <= {8'h00, 8'h00, 8'h00};	// off
				pixel3 <= {8'h00, 8'h00, 8'h00};	// off
				pixel4 <= {8'h00, 8'h00, 8'h00};	// off
				pixel5 <= {8'h00, 8'h00, 8'h00};	// off
				pixel6 <= {8'h00, 8'h00, 8'h00};	// off
				pixel7 <= {8'h00, 8'h00, 8'h00};	// off
				pixel8 <= {8'hFF, 8'h00, 8'h00};	// green
				
				// next pixel
				pixel_on_animation <= 8'b_00000001;
			end
			
			default: begin
				// pixel1 is selected
				pixel_on_animation <= 8'b_00000001;
			end
		endcase
	end
	
	// new 2Hz clock
	// f_OSC = 50MHz, fPIXEL_OSC = 2Hz -> ratio = f_OSC/2*fPIXEL_OSC = 50MHz/(2*2Hz) = 12500000
	always @(negedge CLOCK_50) begin
		if (delay < 32'd_12_500_000)
			begin
				delay <= delay + 32'd_1;
				pixel_en <= 1'b1;
			end
		else
			begin
				delay <= 32'd_0;
				clk_2hz <= ~clk_2hz;
				
				// New set of colours and pixels
				if (clk_2hz == 1'b_0)
					pixel_en <= 1'b0;
				else
					pixel_en <= 1'b1;
			end
	end
	
	/*
	always @(*) begin
		pixel1 <= {8'h00, 8'hFF, 8'h00};	// red
		pixel2 <= {8'hFF, 8'h00, 8'h00};	// green
		pixel3 <= {8'h00, 8'h00, 8'hFF};	// blue
		pixel4 <= {8'h00, 8'h99, 8'h99};	// purple
		pixel5 <= {8'h66, 8'hCC, 8'h00};	// orange
		pixel6 <= {8'h80, 8'h00, 8'hFF};	// sea blue
		pixel7 <= {8'hFF, 8'hFF, 8'h66};	// yellow
		pixel8 <= {8'h00, SW[7:0], SW[15:8]};	// user
	end
	*/
	
endmodule