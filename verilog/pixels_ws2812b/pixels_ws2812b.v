/* 
@brief	pixels_ws2812b.v
@details	This is a testbecnh for the ws2812b.v model.


@return	N/A

@author	Manuel Caballero
@date		24/October/2025
@version	24/October/2025    The ORIGIN
@pre		This source code was tested using ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://x.com/aqueronteblog
*/
module pixels_ws2812b #(parameter NUM_LEDS = 8'd_4) (
	input clock,
	input enable,
	input[(NUM_LEDS*24)-1:0] pixels,
	output bit_out,
	output bit_ready
);
	// CLOCK  = 50MHz 
	localparam[7:0] T1H = 8'd_43;							// 0.85µs high time for bit '1' at 50 MHz
	localparam[7:0] T1L = 8'd_20;							// 0.4µs low time for bit '1' at 50 MHz
	localparam[7:0] T0H = 8'd_20;							// 0.4µs high time for bit '0' at 50 MHz
	localparam[7:0] T0L = 8'd_43;							// 0.85µs low time for bit '0' at 50 MHz
	localparam[7:0] T_TOTAL = T1H + T1L;				// Total time per bit at 50 MHz
	localparam[7:0] T_PIXELS = (NUM_LEDS*8'd_24) - 8'd_1;	// Total pixel devices. 1 pixel = 24-bit
	
	// Variables
	reg busy_aux = 1'b_0;							// Bit that represents when the system is still processing and delivering all the bits for pixels
	reg[7:0] count_next_bit = 8'd_0;				// Counter to identify next bit	
	reg[7:0] th = 8'd_0;								// Time for a bit to be high
	reg[(NUM_LEDS*24)-1:0] rgb_out = 24'd_0;	// It stores all bits from the pixels
	reg[7:0] next_bit = 8'd_0;						// It identifies the bit to be processed
	reg out_aux = 1'b_0;								// Bit that represents the output bit
	
	// WS2812B Logic
	always @(negedge clock) begin
		if (enable == 1'b_0)						// Device is not enabled then, all the parameters ase set to default. It is time to update the pixel's colour. The device is not busy
			begin
				rgb_out <= pixels;
				next_bit <= 8'd_0;
				busy_aux <= 1'b_0;
				count_next_bit <= 8'd_0;
				th <= 8'd_0;						// Force output to be '0'
			end
		else											// Device is enabled. The device is busy
			begin
				if (count_next_bit < T_TOTAL)	// Logic to identify which bit to be processed
					begin
						count_next_bit <= count_next_bit + 8'd_1;
						out_aux <= (rgb_out << next_bit) >> T_PIXELS;
						busy_aux <= 1'b_1;
						
						if (out_aux == 1'b_1)
							th <= T1H;
						else
							th <= T0H;
					end
				else									// It is time to processed the following bit
					begin
						if (next_bit < T_PIXELS)
							begin
								next_bit <= next_bit + 8'd_1;
								count_next_bit <= 8'd_0;
							end
						else							// All bits have been processed. Device is not busy anymore
							begin
								busy_aux <= 1'b_0;
							end
					end
			end	
	end
	
	
	// WS2812B Outputs. 
	//		- bit_out: The RBG LED bit output
	//		- bit_ready: Indicates if the module is busy (bit_ready = 1) or not (bit_ready = 0)
	assign bit_out = (count_next_bit < th)? 1'b_1:1'b_0;
	assign bit_ready = busy_aux;
endmodule