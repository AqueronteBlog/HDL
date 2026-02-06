/* 
@brief	binary_to_7seg_function.v
@details	This example shows how to model a binary to 7seg decoder using a function. 


@return	N/A

@author	Manuel Caballero
@date		06/February/2026
@version	06/February/2026    The ORIGIN
@pre		This source code was tested using ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://x.com/aqueronteblog
*/
module binary_to_7seg_function (
	input d, c, b, a,
	output sg7_g, sg7_f, sg7_e, sg7_d, sg7_c, sg7_b, sg7_a
);

	function [6:0] bin_to_7seg;
		input d, c, b, a;
		
		begin
			case ({d, c, b, a})
				4'b0000	:	bin_to_7seg	=	7'b1000000;	// 0
				4'b0001	:	bin_to_7seg	=	7'b1111001;	// 1
				4'b0010	:	bin_to_7seg	=	7'b0100100;	// 2
				4'b0011	:	bin_to_7seg	=	7'b0110000;	// 3
				4'b0100	:	bin_to_7seg	=	7'b0011001;	// 4
				4'b0101	:	bin_to_7seg	=	7'b0010010;	// 5
				4'b0110	:	bin_to_7seg	=	7'b0000010;	// 6
				4'b0111	:	bin_to_7seg	=	7'b1111000;	// 7
				4'b1000	:	bin_to_7seg	=	7'b0000000;	// 8
				4'b1001	:	bin_to_7seg	=	7'b0010000;	// 9
				default	:	bin_to_7seg	=	7'b1000000;	// Default: 0
			endcase
		end
	endfunction
	
	assign	{sg7_g, sg7_f, sg7_e, sg7_d, sg7_c, sg7_b, sg7_a}	=	bin_to_7seg(d, c, b, a);
	
endmodule