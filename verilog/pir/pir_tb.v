/* 
@brief	pir_tb.v
@details	This is a testbecnh for the pir.v model.


@return	N/A

@author	Manuel Caballero
@date		24/July/2026
@version	24/July/2026    The ORIGIN
@pre		This source code was tested with the pir.v file and ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://x.com/aqueronteblog
*/
`timescale 1ns/1ns

module pir_tb ();
	reg clk, reset, pir_in;
	wire pir_out, pir_busy;
	
	pir uut0	(.clk(clk), .reset(reset), .pir_in(pir_in), .pir_out(pir_out), .pir_busy(pir_busy));
	
	
	initial begin
		$display("Time		IN	|| OUT	BUSY");
		$monitor("%t		%b || %b	%b", $time, pir_in, pir_out, pir_busy);
		
		clk	<= 1'b0;
		reset <= 1'b1;
		#30;
		
		pir_in	<= 1'b1;
		#20;
		
		reset 	<= 1'b0;
		pir_in	<= 1'b0;
		#20;
		
		pir_in	<= 1'b1;
		#50;
		wait (pir_busy == 1'b0);
		
		#1000; $stop;	
	end
	
	// CLOCK 50MHz
	always @(*) begin
		#10;	clk	<= ~clk;
	end
endmodule