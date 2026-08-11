/* 
@brief	timer_8bit_simple_c2_de2.v
@details	This example shows how to model a simple 8-bit timer. 


@return	N/A

@author	Manuel Caballero
@date		11/August/2026
@version	11/August/2026    The ORIGIN
@pre		This source code was tested on the Altera’s DE2 board.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://x.com/aqueronteblog
*/
module timer_8bit_simple_c2_de2 (
	input			CLOCK_50,
	input[10:0]	SW,
	output[1:0]	LEDG
);
	
	reg[31:0]	delay		=	32'b0;
	reg			clk_1hz	=	1'b0;
	
	timer_8bit_simple	uut0 (.clk(clk_1hz), .reset(SW[0]), .start(SW[1]), .load_value(SW[9:2]), .done(LEDG[0]));
	
	
	// new 1Hz (T = 1s) clock
	// f_OSC = 50MHz, f_TIMER_OSC = 1Hz -> ratio = f_OSC/f_TIMER_OSC = 50MHz/1Hz = 50000000
	always @(negedge CLOCK_50) begin
		if (delay < 32'd_50_000_000)
			begin
				delay	<= delay	+	32'd_1;
			end
		else
			begin
				delay	<= 32'd_0;
				clk_1hz	<=	~clk_1hz;
			end
	end
endmodule