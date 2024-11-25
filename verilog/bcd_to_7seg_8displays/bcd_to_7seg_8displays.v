/* 
@brief	test_bcd_to_7seg_8displays.v
@details	This example shows how to design a counter for 8 7-seg displays using the BCD_TO_7SEG module. 
			
			Every one second, the counter is increased and its value is shown on the eight 7-seg displays.


@return	N/A

@author	Manuel Caballero
@date		25/November/2024
@version	25/November/2024    The ORIGIN
@pre		This code needs the bcd_7_seg file.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
module test_bcd_to_7seg_8displays (
	input clock,
	input enable, seg7all_on,
	output[6:0] sg7_hex0, sg7_hex1, sg7_hex2, sg7_hex3, sg7_hex4, sg7_hex5, sg7_hex6, sg7_hex7
);
	
	reg[3:0] bcd_hex0 = 4'b0000;
	reg[3:0] bcd_hex1 = 4'b0000;
	reg[3:0] bcd_hex2 = 4'b0000;
	reg[3:0] bcd_hex3 = 4'b0000;
	reg[3:0] bcd_hex4 = 4'b0000;
	reg[3:0] bcd_hex5 = 4'b0000;
	reg[3:0] bcd_hex6 = 4'b0000;
	reg[3:0] bcd_hex7 = 4'b0000;

	BCD_TO_7SEG_EN hex0 (.enable(enable), .seg7all_on(seg7all_on), .bcd(bcd_hex0), .sg7(sg7_hex0));
	BCD_TO_7SEG_EN hex1 (.enable(enable), .seg7all_on(seg7all_on), .bcd(bcd_hex1), .sg7(sg7_hex1));
	BCD_TO_7SEG_EN hex2 (.enable(enable), .seg7all_on(seg7all_on), .bcd(bcd_hex2), .sg7(sg7_hex2));
	BCD_TO_7SEG_EN hex3 (.enable(enable), .seg7all_on(seg7all_on), .bcd(bcd_hex3), .sg7(sg7_hex3));
	BCD_TO_7SEG_EN hex4 (.enable(enable), .seg7all_on(seg7all_on), .bcd(bcd_hex4), .sg7(sg7_hex4));
	BCD_TO_7SEG_EN hex5 (.enable(enable), .seg7all_on(seg7all_on), .bcd(bcd_hex5), .sg7(sg7_hex5));
	BCD_TO_7SEG_EN hex6 (.enable(enable), .seg7all_on(seg7all_on), .bcd(bcd_hex6), .sg7(sg7_hex6));
	BCD_TO_7SEG_EN hex7 (.enable(enable), .seg7all_on(seg7all_on), .bcd(bcd_hex7), .sg7(sg7_hex7));
	
	reg[31:0] delay = 32'b0;
	reg clk_delay = 1'b1;
	
	// xs delay
	always @(posedge clock) begin
		if (delay < 32'd_100_000)	//32'd_50_000_000
			delay <= delay + 32'b1;
		else
			begin
				delay <= 32'b0;
				clk_delay <= ~clk_delay;
			end
	end
	
	// 7-seg
	always @(negedge clk_delay) begin
		if (enable == 0)
			begin
				bcd_hex0 <= bcd_hex0;
				bcd_hex1 <= bcd_hex1;
				bcd_hex2 <= bcd_hex2;
				bcd_hex3 <= bcd_hex3;
				bcd_hex4 <= bcd_hex4;
				bcd_hex5 <= bcd_hex5;
				bcd_hex6 <= bcd_hex6;
				bcd_hex7 <= bcd_hex7;
			end
		else if (seg7all_on == 1)
			begin
				bcd_hex0 <= bcd_hex0;
				bcd_hex1 <= bcd_hex1;
				bcd_hex2 <= bcd_hex2;
				bcd_hex3 <= bcd_hex3;
				bcd_hex4 <= bcd_hex4;
				bcd_hex5 <= bcd_hex5;
				bcd_hex6 <= bcd_hex6;
				bcd_hex7 <= bcd_hex7;
			end
		else if (bcd_hex0 < 9)
			bcd_hex0 <= bcd_hex0 + 1'b1;
		else if (bcd_hex1 < 9)
			begin
				bcd_hex0 <= 0;
				bcd_hex1 <= bcd_hex1 + 1'b1;
			end
		else if (bcd_hex2 < 9)
			begin
				bcd_hex0 <= 0;
				bcd_hex1 <= 0;
				bcd_hex2 <= bcd_hex2 + 1'b1;
			end
		else if (bcd_hex3 < 9)
			begin
				bcd_hex0 <= 0;
				bcd_hex1 <= 0;
				bcd_hex2 <= 0;
				bcd_hex3 <= bcd_hex3 + 1'b1;
			end
		else if (bcd_hex4 < 9)
			begin
				bcd_hex0 <= 0;
				bcd_hex1 <= 0;
				bcd_hex2 <= 0;
				bcd_hex3 <= 0;
				bcd_hex4 <= bcd_hex4 + 1'b1;
			end
		else if (bcd_hex5 < 9)
			begin
				bcd_hex0 <= 0;
				bcd_hex1 <= 0;
				bcd_hex2 <= 0;
				bcd_hex3 <= 0;
				bcd_hex4 <= 0;
				bcd_hex5 <= bcd_hex5 + 1'b1;
			end
		else if (bcd_hex6 < 9)
			begin
				bcd_hex0 <= 0;
				bcd_hex1 <= 0;
				bcd_hex2 <= 0;
				bcd_hex3 <= 0;
				bcd_hex4 <= 0;
				bcd_hex5 <= 0;
				bcd_hex6 <= bcd_hex6 + 1'b1;
			end
		else if (bcd_hex7 < 9)
			begin
				bcd_hex0 <= 0;
				bcd_hex1 <= 0;
				bcd_hex2 <= 0;
				bcd_hex3 <= 0;
				bcd_hex4 <= 0;
				bcd_hex5 <= 0;
				bcd_hex6 <= 0;
				bcd_hex7 <= bcd_hex7 + 1'b1;
			end
		else
			begin
				bcd_hex0 <= 0;
				bcd_hex1 <= 0;
				bcd_hex2 <= 0;
				bcd_hex3 <= 0;
				bcd_hex4 <= 0;
				bcd_hex5 <= 0;
				bcd_hex6 <= 0;
				bcd_hex7 <= 0;
			end
	end
endmodule