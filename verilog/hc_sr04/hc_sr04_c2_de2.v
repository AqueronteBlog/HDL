/* 
@brief	hc_sr04_c2_de2.v
@details	This example shows how to model a hc_sr04 device. 


@return	N/A

@author	Manuel Caballero
@date		29/November/2025
@version	29/November/2025    The ORIGIN
@pre		This source code was tested on the Altera’s DE2 board.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://x.com/aqueronteblog
*/
module hc_sr04_c2_de2(
	input CLOCK_50,
	inout[1:0] GPIO_0, // HC_SR04 module: Echo
	input[1:0] SW, 	 // HC_SR04 module: Trigger
	output[1:0] LEDG,  // HC_SR04 module: Busy
	output[17:0] LEDR  // HC_SR04 module: Range
);
	
	wire[31:0] range_aux;
	reg[17:0] ledr_aux = 17'd_0;
	
	hc_sr04 hc_sr04_0 (.clock(CLOCK_50), .trigger(SW[0]), .echo(GPIO_0[0]), .range(range_aux), .busy(LEDG[0]));
	
	always @(range_aux) begin
		if (range_aux <= 32'd_5990)	// <~2cm (Echo_time(us) = (2cm*1000)/17 ~ 118us | range_aux = 118us/0.02us = 5900)
			ledr_aux <= 18'b_000000000000000011;
		else if ((range_aux > 32'd_5990) && (range_aux <= 32'd_17647))		// ~ 2cm - 6cm
			ledr_aux <= 18'b_000000000000001111;
		else if ((range_aux > 32'd_17647) && (range_aux <= 32'd_29412))	// ~ 6cm - 10cm
			ledr_aux <= 18'b_000000000011111111;
		else if ((range_aux > 32'd_29412) && (range_aux <= 32'd_41177))	// ~ 10cm - 14cm
			ledr_aux <= 18'b_000000111111111111;
		else if ((range_aux > 32'd_41177) && (range_aux <= 32'd_52942))	// ~ 14cm - 18cm
			ledr_aux <= 18'b_001111111111111111;
		else if ((range_aux > 32'd_52942) && (range_aux <= 32'd_64706))	// ~ 18cm - 22cm
			ledr_aux <= 18'b_111111111111111111;
	end
	
	
	// Outputs
	assign LEDR = ledr_aux;
	assign GPIO_0[1] = SW[0];
	
endmodule
