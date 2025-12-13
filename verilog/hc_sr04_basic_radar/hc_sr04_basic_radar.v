/* 
@brief	hc_sr04_basic_radar_c2_de2.v
@details	This example shows how use the hc_sr04 model to make a basic radar. 
			A new measurement is triggered every 1s.


@return	N/A

@author	Manuel Caballero
@date		13/December/2025
@version	13/December/2025    The ORIGIN
@pre		This source code was tested on the Altera’s DE2 board.
@pre		This code requires the hc_sr04 module.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://x.com/aqueronteblog
*/
module hc_sr04_basic_radar_c2_de2(
	input CLOCK_50,
	inout[1:0] GPIO_0, // HC_SR04 module: Echo
	output[1:0] LEDG,  // HC_SR04 module: Busy
	output[17:0] LEDR  // HC_SR04 module: Range
);
	
	wire[31:0] range_aux;
	reg[17:0] ledr_aux = 17'd_0;
	
	reg[31:0] delay_pgr = 32'b0;
	reg[31:0] trig_pulse = 32'b0;
	reg clk_1hz = 1'b0;
	
	
	hc_sr04 hc_sr04_0 (.clock(CLOCK_50), .trigger(GPIO_0[1]), .echo(GPIO_0[0]), .range(range_aux), .busy(LEDG[0]));
	
	always @(range_aux) begin
		if (range_aux <= 32'd_11765)	// <~4cm (Echo_time(us) = (4cm*1000)/17 ~ 235.3us | range_aux = 235.3us/0.02us = 11765)
			ledr_aux <= 18'b_000000000000000011;
		else if ((range_aux > 32'd_11765) && (range_aux <= 32'd_17647))	// ~ 4cm - 6cm
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
	
	// f_OSC = 50MHz, fTRIG_OSC = 1Hz -> ratio = f_OSC/(1*fTRIG_OSC) = 50MHz/(1*1Hz) = 50000000
	always @(negedge CLOCK_50) begin
		if (delay_pgr < 32'd_50_000_000)
			begin
				delay_pgr <= delay_pgr + 32'b1;
				
				// f_OSC = 50MHz (20ns), TRIG_PULSE = 10us -> ratio = 10us/20ns = 500
				if (trig_pulse <= 32'd_500)
					trig_pulse <= trig_pulse + 32'b1;
				else
					clk_1hz <= 1'b0;
			end
		else
			begin
				delay_pgr <= 32'b0;
				trig_pulse <= 32'b0;
				clk_1hz <= ~clk_1hz;
			end
	end
	
	// Outputs
	assign LEDR = ledr_aux;
	assign GPIO_0[1] = clk_1hz;
	
endmodule
