/* 
@brief	timer_8bit_simple_tb.v
@details	This is a test bench for the timer_8bit_simple module. 


@return	N/A

@author	Manuel Caballero
@date		11/August/2026
@version	11/August/2026    The ORIGIN
@pre		This source code was tested with the timer_8bit_simple.v file and ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://x.com/aqueronteblog
*/
`timescale 1ms/1ms

module timer_8bit_simple_tb();

	reg 		clk, reset, start;
	reg[7:0]	load_value;
	wire 		done;

	timer_8bit_simple	uut0 (.clk(clk), .reset(reset), .start(start), .load_value(load_value), .done(done));
	
	initial begin
		clk	<=	1'b0;
		reset	<=	1'b1;
		
		load_value	<=	8'd_3;
		
		start	<=	1'b1;
		#1500;
		
		start	<=	1'b0;
		#1500;
		
		reset	<=	1'b0;
		#1500;
		start	<=	1'b1;
		#1500;
		
		start	<=	1'b0;
		#1500;
		
		#5000; $stop;
	
	end
	
	// CLOCK 1Hz
	always @(*) begin
		#500; clk	<=	~clk;
	end
	
endmodule