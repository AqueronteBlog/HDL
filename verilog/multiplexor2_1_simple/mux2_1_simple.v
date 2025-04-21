/* 
@brief	mux2_1_simple.v
@details	This example shows how to model a simple MUX2:1


@return	N/A

@author	Manuel Caballero
@date		21/April/2025
@version	21/April/2025    The ORIGIN
@pre		This source code was tested using ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
module mux_2_1_simple (
	input i0, i1, sel,
	output out
);
	
	wire sel_out, out_a, out_b;
	
	nand (sel_out, sel, sel);
	nand (out_a, i1, sel_out);
	nand (out_b, i0, sel);
	
	// MUX2:1 output
	nand (out, out_a, out_b);
endmodule