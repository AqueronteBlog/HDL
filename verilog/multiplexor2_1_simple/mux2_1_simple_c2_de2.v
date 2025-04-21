/* 
@brief	mux2_1_simple_c2_de2.v
@details	This example shows how to model a simple MUX2:1


@return	N/A

@author	Manuel Caballero
@date		21/April/2025
@version	21/April/2025    The ORIGIN
@pre		This source code was tested on the Altera’s DE2 board.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
module mux2_1_simple_c2_de2 (
	input CLOCK_50,
	input[1:0] SW,
	output[1:0] LEDG
);
	reg[31:0] delay_i0 = 32'b0;
	reg clk_1hz = 1'b0;
	reg[31:0] delay_i1 = 32'b0;
	reg clk_5hz = 1'b0;
	
	mux_2_1_simple mux21_0 (.i0(clk_1hz), .i1(clk_5hz), .sel(SW[0]), .out(LEDG[0]));
	
	// I0 input. f_OSC = 50MHz, f_IOosc = 1Hz -> ratio = f_OSC/2*f_IOosc = 50MHz/2*1Hz = 25000000
	always @(negedge CLOCK_50) begin
		if (delay_i0 < 32'd_25_000_000)
			delay_i0 <= delay_i0 + 32'b1;
		else
			begin
				delay_i0 <= 32'b0;
				clk_1hz <= ~clk_1hz;
			end
	end
	
	// I1 input. f_OSC = 50MHz, f_I1osc = 5Hz -> ratio = f_OSC/2*f_I1osc = 50MHz/2*5Hz = 5000000
	always @(negedge CLOCK_50) begin
		if (delay_i1 < 32'd_5_000_000)
			delay_i1 <= delay_i1 + 32'b1;
		else
			begin
				delay_i1 <= 32'b0;
				clk_5hz <= ~clk_5hz;
			end
	end
	
endmodule