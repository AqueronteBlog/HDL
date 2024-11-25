/* 
@brief	BCD_TO_7SEG_EN.v
@details	This example shows how to model a BCD to 7seg decoder. 


@return	N/A

@author	Manuel Caballero
@date		15/November/2024
@version	15/November/2024    The ORIGIN
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
module BCD_TO_7SEG_EN (
	input enable, seg7all_on,
	input[3:0] bcd,
	output reg[6:0] sg7
);

	always @(enable, seg7all_on, bcd) begin
		casez ({enable, seg7all_on, bcd[3], bcd[2], bcd[1], bcd[0]})
			6'b0?????	:	begin	// Enable off -> all 7seg off
				sg7 <= 7'b1111111;
			end
			6'b11????	:	begin	// seg7all_on on -> all 7seg on
				sg7 <= 7'b0000000;
			end
			6'b100000	:	begin	// 0
				sg7 <= 7'b1000000;
			end
			6'b100001	:	begin	// 1
				sg7 <= 7'b1111001;
			end
			6'b100010	:	begin	// 2
				sg7 <= 7'b0100100;
			end
			6'b100011	:	begin	// 3
				sg7 <= 7'b0110000;
			end
			6'b100100	:	begin	// 4
				sg7 <= 7'b0011001;
			end
			6'b100101	:	begin	// 5
				sg7 <= 7'b0010010;
			end
			6'b100110	:	begin	// 6
				sg7 <= 7'b0000010;
			end
			6'b100111	:	begin	// 7
				sg7 <= 7'b1111000;
			end
			6'b101000	:	begin	// 8
				sg7 <= 7'b0000000;
			end
			6'b101001	:	begin	// 9
				sg7 <= 7'b0011000;
			end
			default	:	begin	// Default: 0
				sg7 <= 7'b1000000;
			end
		endcase
	end
endmodule