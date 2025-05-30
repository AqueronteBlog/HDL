/* 
@brief	pwm_output_c2_de2.v
@details	This example shows how to model four dynamic PWM modules. 


@return	N/A

@author	Manuel Caballero
@date		30/May/2025
@version	30/May/2025    The ORIGIN
@pre		This source code was tested on the Altera’s DE2 board.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
module pwm_dynamic_c2_de2 (
	input CLOCK_50,
	input[1:0] SW,
	input[1:0] KEY,
	output[1:0] LEDG
);
	reg[7:0] pwm_count = 8'b0;	// PWM duty cycle
	reg[31:0] delay = 32'b0;
	reg clk_250hz = 1'b0;
	
	pwm_dynamic uut0 (.pwm_count(pwm_count), .enable(SW[0]), .clock(clk_250hz), .pwm(LEDG[0]));
	
	// f_OSC = 50MHz, fPWM_OSC = 250Hz -> ratio = f_OSC/(2*fPWM_OSC) = 50MHz/(2*250Hz) = 100000
	always @(negedge CLOCK_50) begin
		if (delay < 32'd_100_000)
			delay <= delay + 32'b1;
		else
			begin
				delay <= 32'b0;
				clk_250hz <= ~clk_250hz;
			end
	end
	
	nan
	// fPWM_OSC = 250Hz -> TPWM = (2^PWMres - 1)*(1/fPWM_OSC) = (2^8 - 1)*(1/250Hz) = 1.02s (~0.98Hz)
	reg[2:0] duty_cycle = 3'd_1;
	always @(negedge KEY[0]) begin
		if (duty_cycle < 3'd_4)
			duty_cycle <= duty_cycle + 3'd_1;
		else
			duty_cycle <= 3'd_0;
		
		// Select PWM duty cycle
		case(duty_cycle)
			default	:	pwm_count = 8'd_0;	// 0% PWM dusty cycle
			3'd_1	:	pwm_count = 8'd_59;		// ~23% PWM dusty cycle
			3'd_2	:	pwm_count = 8'd_128;		// ~50% PWM dusty cycle
			3'd_3	:	pwm_count = 8'd_191;		// ~75% PWM dusty cycle
			3'd_4	:	pwm_count = 8'd_255;		// 100% PWM dusty cycle
		endcase
	end
	
endmodule