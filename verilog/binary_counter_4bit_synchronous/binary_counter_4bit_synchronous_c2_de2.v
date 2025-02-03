/* 
@brief	binary_countr_4bit_synchronous_c2_de2.v
@details	This example shows how to model a 4-bit synchronous up/down counter using JK flip-flops.


@return	N/A

@author	Manuel Caballero
@date		03/February/2025
@version	03/February/2025    The ORIGIN
@pre		This source code was tested on the Altera’s DE2 board.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
module binary_countr_4bit_synchronous_c2_de2 (
	input CLOCK_50,
	output[3:0] LEDG,
	output[3:0] LEDR
);

	reg[31:0] delay = 32'b0;
	reg clk_1hz = 1'b0;
	
	binary_counter_4bit_synchronous uut0 (.q0(LEDG[0]), .q1(LEDG[1]), .q2(LEDG[2]), .q3(LEDG[3]), .qbar0(LEDR[0]), .qbar1(LEDR[1]), .qbar2(LEDR[2]), .qbar3(LEDR[3]), .clock(clk_1hz));
	
	
	// 1s period/delay
	always @(posedge CLOCK_50) begin
		if (delay < 32'd_25_000_000)
			delay <= delay + 31'b1;
		else
			begin
				delay <= 32'b0;
				clk_1hz <= ~clk_1hz;
			end	
	end

endmodule