/* 
@brief	BLINK_LED_1s.v
@details	This example shows how to model a circuit to blink an LED every one second. 


@return	N/A

@author	Manuel Caballero
@date		08/November/2024
@version	08/November/2024    The ORIGIN
@pre		This source code was tested using ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
module BLINK_LED_1s (
	input clock,
	output reg led = 1'b0
);

	reg[31:0] delay_1s = 32'b0;
	
	always @(posedge clock) begin
		if (delay_1s < 32'd_50_000_000)
			delay_1s <= delay_1s + 32'b1;
		else
			begin
				led <= ~led;
				delay_1s <= 32'b0;
			end
	end
endmodule