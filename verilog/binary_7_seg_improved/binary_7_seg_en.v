/* 
@brief	BINARY_TO_7SEG_EN.v
@details	This example shows how to model a binary to 7seg decoder. 


@return	N/A

@author	Manuel Caballero
@date		14/November/2024
@version	14/November/2024    The ORIGIN
@pre		This source code was tested using ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
module BINARY_TO_7SEG_EN (
	input enable, seg7all_on,
	input d, c, b, a,
	output reg sg7_g, sg7_f, sg7_e, sg7_d, sg7_c, sg7_b, sg7_a
);

	always @(enable, seg7all_on, d, c, b, a) begin
		casez ({enable, seg7all_on, d, c, b, a})
			6'b0?????	:	begin	// Enable off -> all 7seg off
				sg7_g	<= 1;
				sg7_f	<= 1;
				sg7_e	<= 1;
				sg7_d	<= 1;
				sg7_c	<= 1;
				sg7_b	<= 1;
				sg7_a	<= 1;
			end
			6'b11????	:	begin	// seg7all_on on -> all 7seg on
				sg7_g	<= 0;
				sg7_f	<= 0;
				sg7_e	<= 0;
				sg7_d	<= 0;
				sg7_c	<= 0;
				sg7_b	<= 0;
				sg7_a	<= 0;
			end
			6'b100000	:	begin	// 0
				sg7_g	<= 1;
				sg7_f	<= 0;
				sg7_e	<= 0;
				sg7_d	<= 0;
				sg7_c	<= 0;
				sg7_b	<= 0;
				sg7_a	<= 0;
			end
			6'b100001	:	begin	// 1
				sg7_g	<= 1;
				sg7_f	<= 1;
				sg7_e	<= 1;
				sg7_d	<= 1;
				sg7_c	<= 0;
				sg7_b	<= 0;
				sg7_a	<= 1;
			end
			6'b100010	:	begin	// 2
				sg7_g	<= 0;
				sg7_f	<= 1;
				sg7_e	<= 0;
				sg7_d	<= 0;
				sg7_c	<= 1;
				sg7_b	<= 0;
				sg7_a	<= 0;
			end
			6'b100011	:	begin	// 3
				sg7_g	<= 0;
				sg7_f	<= 1;
				sg7_e	<= 1;
				sg7_d	<= 0;
				sg7_c	<= 0;
				sg7_b	<= 0;
				sg7_a	<= 0;
			end
			6'b100100	:	begin	// 4
				sg7_g	<= 0;
				sg7_f	<= 0;
				sg7_e	<= 1;
				sg7_d	<= 1;
				sg7_c	<= 0;
				sg7_b	<= 0;
				sg7_a	<= 1;
			end
			6'b100101	:	begin	// 5
				sg7_g	<= 0;
				sg7_f	<= 0;
				sg7_e	<= 1;
				sg7_d	<= 0;
				sg7_c	<= 0;
				sg7_b	<= 1;
				sg7_a	<= 0;
			end
			6'b100110	:	begin	// 6
				sg7_g	<= 0;
				sg7_f	<= 0;
				sg7_e	<= 0;
				sg7_d	<= 0;
				sg7_c	<= 0;
				sg7_b	<= 1;
				sg7_a	<= 0;
			end
			6'b100111	:	begin	// 7
				sg7_g	<= 1;
				sg7_f	<= 1;
				sg7_e	<= 1;
				sg7_d	<= 1;
				sg7_c	<= 0;
				sg7_b	<= 0;
				sg7_a	<= 0;
			end
			6'b101000	:	begin	// 8
				sg7_g	<= 0;
				sg7_f	<= 0;
				sg7_e	<= 0;
				sg7_d	<= 0;
				sg7_c	<= 0;
				sg7_b	<= 0;
				sg7_a	<= 0;
			end
			6'b101001	:	begin	// 9
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