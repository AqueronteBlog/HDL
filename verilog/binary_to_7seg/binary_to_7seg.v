/* 
@brief	BINARY_TO_7SEG.v
@details	This example shows how to model a binary to 7seg decoder. 


@return	N/A

@author	Manuel Caballero
@date		06/November/2024
@version	06/November/2024    The ORIGIN
@pre		This source code was tested using ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
module BINARY_TO_7SEG (
	input d, c, b, a,
	output reg sg7_g, sg7_f, sg7_e, sg7_d, sg7_c, sg7_b, sg7_a
);

	always @(d, c, b, a) begin
		case ({d, c, b, a})
			4'b0000	:	begin	// 0
				sg7_g	<= 1;
				sg7_f	<= 0;
				sg7_e	<= 0;
				sg7_d	<= 0;
				sg7_c	<= 0;
				sg7_b	<= 0;
				sg7_a	<= 0;
			end
			4'b0001	:	begin	// 1
				sg7_g	<= 1;
				sg7_f	<= 1;
				sg7_e	<= 1;
				sg7_d	<= 1;
				sg7_c	<= 0;
				sg7_b	<= 0;
				sg7_a	<= 1;
			end
			4'b0010	:	begin	// 2
				sg7_g	<= 0;
				sg7_f	<= 1;
				sg7_e	<= 0;
				sg7_d	<= 0;
				sg7_c	<= 1;
				sg7_b	<= 0;
				sg7_a	<= 0;
			end
			4'b0011	:	begin	// 3
				sg7_g	<= 0;
				sg7_f	<= 1;
				sg7_e	<= 1;
				sg7_d	<= 0;
				sg7_c	<= 0;
				sg7_b	<= 0;
				sg7_a	<= 0;
			end
			4'b0100	:	begin	// 4
				sg7_g	<= 0;
				sg7_f	<= 0;
				sg7_e	<= 1;
				sg7_d	<= 1;
				sg7_c	<= 0;
				sg7_b	<= 0;
				sg7_a	<= 1;
			end
			4'b0101	:	begin	// 5
				sg7_g	<= 0;
				sg7_f	<= 0;
				sg7_e	<= 1;
				sg7_d	<= 0;
				sg7_c	<= 0;
				sg7_b	<= 1;
				sg7_a	<= 0;
			end
			4'b0110	:	begin	// 6
				sg7_g	<= 0;
				sg7_f	<= 0;
				sg7_e	<= 0;
				sg7_d	<= 0;
				sg7_c	<= 0;
				sg7_b	<= 1;
				sg7_a	<= 0;
			end
			4'b0111	:	begin	// 7
				sg7_g	<= 1;
				sg7_f	<= 1;
				sg7_e	<= 1;
				sg7_d	<= 1;
				sg7_c	<= 0;
				sg7_b	<= 0;
				sg7_a	<= 0;
			end
			4'b1000	:	begin	// 8
				sg7_g	<= 0;
				sg7_f	<= 0;
				sg7_e	<= 0;
				sg7_d	<= 0;
				sg7_c	<= 0;
				sg7_b	<= 0;
				sg7_a	<= 0;
			end
			4'b1001	:	begin	// 9
				sg7_g	<= 0;
				sg7_f	<= 0;
				sg7_e	<= 1;
				sg7_d	<= 1;
				sg7_c	<= 0;
				sg7_b	<= 0;
				sg7_a	<= 0;
			end
			default	:	begin	// Default: 0
				sg7_g	<= 1;
				sg7_f	<= 0;
				sg7_e	<= 0;
				sg7_d	<= 0;
				sg7_c	<= 0;
				sg7_b	<= 0;
				sg7_a	<= 0;
			end
		endcase
	end
endmodule