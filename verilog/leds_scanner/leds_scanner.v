/* 
@brief	leds_scanner.v
@details	This example shows how to model a circuit to blink an LED as a LED scanner. 


@return	N/A

@author	Manuel Caballero
@date		29/November/2024
@version	29/November/2024    The ORIGIN
@pre		This source code was tested using ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
module leds_scanner #(parameter DELAY_TICKS = 32'd_50_000_000)(
	input clock,
	output wire[7:0] leds
);
	
	// Retardo xs
	reg[31:0] clk_delay = 32'd0;
	reg delay_1s = 1'b1;
	
	always @(negedge clock) begin
		if (clk_delay < DELAY_TICKS)
			clk_delay <= clk_delay + 32'd_1;
		else
			begin
				delay_1s <= ~delay_1s;
				clk_delay <= 32'd_0;
			end
	end
	
	// LED scanner
	reg[7:0] leds_out = 7'b00000001;
	integer counter = 0;
	
	always @(negedge delay_1s) begin
		if (counter < 7)
			begin
				counter <= counter + 1;
				leds_out <= leds_out << 1;
			end
		else if ((counter >= 7) && (counter < 13))
			begin
				counter <= counter + 1;
				leds_out <= leds_out >> 1;
			end
		else
			begin
				counter <= 0;
				leds_out <= 7'b00000001;
			end
	end
	
	// Output. LED scanner
	assign leds = leds_out;
endmodule