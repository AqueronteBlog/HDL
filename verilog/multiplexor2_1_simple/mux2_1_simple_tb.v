/* 
@brief	mux2_1_simple_tb.v
@details	This is a testbecnh for the mux2_1_simple.v model. 


@return	N/A

@author	Manuel Caballero
@date		21/April/2025
@version	21/April/2025    The ORIGIN
@pre		This source code was tested with the mux2_1_simple.v file and ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
`timescale 1ms/1ms

module mux2_1_simple_tb ();
	reg i0, i1, sel;
	wire out;

	mux_2_1_simple uut0 (.i0(i0), .i1(i1), .sel(sel), .out(out));
	
	initial begin
		{i0, i1, sel} <= 1'b0;
		
		#1; sel <= 1'b1;
		#10; sel <= 1'b0;
		#5; sel <= 1'b1;
		
		#10; $stop;
	end
	
	
	// I0 input. 1ms
	always @(*) begin
		#1; i0 <= ~i0;
	end
	
	// I1 input. 5ms
	always @(*) begin
		#5; i1 <= ~i1;
	end

endmodule