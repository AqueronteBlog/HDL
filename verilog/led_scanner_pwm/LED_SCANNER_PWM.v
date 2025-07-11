/* 
@brief	LED_SCANNER_PWM.v
@details	This example shows how to model a LED scanner using PWM modules. 


@return	N/A

@author	Manuel Caballero
@date		11/July/2025
@version	11/July/2025    The ORIGIN
@pre		This source code was tested on the Altera’s DE2 board.
@pre		This program requires the pwm_dynamic.v model.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
module LED_SCANNER_PWM (
	input CLOCK_50,
	input[1:0] SW,
	output[7:0] LEDG
);
	reg[7:0] led0_pwm_count = 8'b0;
	reg[7:0] led1_pwm_count = 8'b0;
	reg[7:0] led2_pwm_count = 8'b0;
	reg[7:0] led3_pwm_count = 8'b0;
	reg[7:0] led4_pwm_count = 8'b0;
	reg[7:0] led5_pwm_count = 8'b0;
	reg[7:0] led6_pwm_count = 8'b0;
	reg[7:0] led7_pwm_count = 8'b0;
	
	pwm_dynamic led0 (.pwm_count(led0_pwm_count), .enable(SW[0]), .clock(CLOCK_50), .pwm(LEDG[0]));
	pwm_dynamic led1 (.pwm_count(led1_pwm_count), .enable(SW[0]), .clock(CLOCK_50), .pwm(LEDG[1]));
	pwm_dynamic led2 (.pwm_count(led2_pwm_count), .enable(SW[0]), .clock(CLOCK_50), .pwm(LEDG[2]));
	pwm_dynamic led3 (.pwm_count(led3_pwm_count), .enable(SW[0]), .clock(CLOCK_50), .pwm(LEDG[3]));
	pwm_dynamic led4 (.pwm_count(led4_pwm_count), .enable(SW[0]), .clock(CLOCK_50), .pwm(LEDG[4]));
	pwm_dynamic led5 (.pwm_count(led5_pwm_count), .enable(SW[0]), .clock(CLOCK_50), .pwm(LEDG[5]));
	pwm_dynamic led6 (.pwm_count(led6_pwm_count), .enable(SW[0]), .clock(CLOCK_50), .pwm(LEDG[6]));
	pwm_dynamic led7 (.pwm_count(led7_pwm_count), .enable(SW[0]), .clock(CLOCK_50), .pwm(LEDG[7]));
	
	// f_OSC 50MH, fPGR_OSC = 5Hz -> ratio = f_OSC/(2*fPGR_OSC) = 50MHz/(2*5Hz) = 5000000
	reg[31:0] delay_pgr = 32'b0;
	reg clk_5hz = 1'b0;
	always @(negedge CLOCK_50) begin
		if (delay_pgr < 32'd_5_000_000)
			delay_pgr <= delay_pgr + 32'b1;
		else
			begin
				delay_pgr <= 32'b0;
				clk_5hz <= ~clk_5hz;
			end
	end
	
	// LED scanner with PWM
	// fPWM_OSC = 50MHz -> TPWM = (2^PWMres - 1)*(1/fPWM_OSC) = (2^8 - 1)*(1/50MHz) = 5.1us
	reg[4:0] led_position_on = 5'd_0;
	always @(negedge clk_5hz) begin
		if (led_position_on < 5'd_17)
			led_position_on <= led_position_on + 5'd_1;
		else
			led_position_on <= 5'd_0;
			
		case (led_position_on)
			default:
				begin
					led0_pwm_count = 8'd_255;	// ~100% PWM duty cycle
					led1_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led2_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led3_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led4_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led5_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led6_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led7_pwm_count = 8'd_0;		// ~0% PWM duty cycle
				end
			5'd_1:
				begin
					led0_pwm_count = 8'd_25;	// ~15% PWM duty cycle
					led1_pwm_count = 8'd_255;	// ~100% PWM duty cycle
					led2_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led3_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led4_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led5_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led6_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led7_pwm_count = 8'd_0;		// ~0% PWM duty cycle
				end
			5'd_2:
				begin
					led0_pwm_count = 8'd_13;	// ~5% PWM duty cycle
					led1_pwm_count = 8'd_25;	// ~15% PWM duty cycle
					led2_pwm_count = 8'd_255;	// ~100% PWM duty cycle
					led3_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led4_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led5_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led6_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led7_pwm_count = 8'd_0;		// ~0% PWM duty cycle
				end
			5'd_3:
				begin
					led0_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led1_pwm_count = 8'd_13;	// ~5% PWM duty cycle
					led2_pwm_count = 8'd_25;	// ~15% PWM duty cycle
					led3_pwm_count = 8'd_255;	// ~100% PWM duty cycle
					led4_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led5_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led6_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led7_pwm_count = 8'd_0;		// ~0% PWM duty cycle
				end
			5'd_4:
				begin
					led0_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led1_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led2_pwm_count = 8'd_13;	// ~5% PWM duty cycle
					led3_pwm_count = 8'd_25;	// ~15% PWM duty cycle
					led4_pwm_count = 8'd_255;	// ~100% PWM duty cycle
					led5_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led6_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led7_pwm_count = 8'd_0;		// ~0% PWM duty cycle
				end
			5'd_5:
				begin
					led0_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led1_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led2_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led3_pwm_count = 8'd_13;	// ~5% PWM duty cycle
					led4_pwm_count = 8'd_25;	// ~15% PWM duty cycle
					led5_pwm_count = 8'd_255;	// ~100% PWM duty cycle
					led6_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led7_pwm_count = 8'd_0;		// ~0% PWM duty cycle
				end
			5'd_6:
				begin
					led0_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led1_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led2_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led3_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led4_pwm_count = 8'd_13;	// ~5% PWM duty cycle
					led5_pwm_count = 8'd_25;	// ~15% PWM duty cycle
					led6_pwm_count = 8'd_255;	// ~100% PWM duty cycle
					led7_pwm_count = 8'd_0;		// ~0% PWM duty cycle
				end
			5'd_7:
				begin
					led0_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led1_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led2_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led3_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led4_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led5_pwm_count = 8'd_13;	// ~5% PWM duty cycle
					led6_pwm_count = 8'd_25;	// ~15% PWM duty cycle
					led7_pwm_count = 8'd_255;	// ~100% PWM duty cycle
				end
			5'd_8:
				begin
					led0_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led1_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led2_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led3_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led4_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led5_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led6_pwm_count = 8'd_13;	// ~5% PWM duty cycle
					led7_pwm_count = 8'd_255;	// ~100% PWM duty cycle
				end
			5'd_9:
				begin
					led0_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led1_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led2_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led3_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led4_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led5_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led6_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led7_pwm_count = 8'd_255;	// ~100% PWM duty cycle
				end
			5'd_10:
				begin
					led0_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led1_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led2_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led3_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led4_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led5_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led6_pwm_count = 8'd_255;	// ~100% PWM duty cycle
					led7_pwm_count = 8'd_25;	// ~15% PWM duty cycle
				end
			5'd_11:
				begin
					led0_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led1_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led2_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led3_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led4_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led5_pwm_count = 8'd_255;	// ~100% PWM duty cycle
					led6_pwm_count = 8'd_25;	// ~15% PWM duty cycle
					led7_pwm_count = 8'd_13;	// ~5% PWM duty cycle
				end
			5'd_12:
				begin
					led0_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led1_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led2_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led3_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led4_pwm_count = 8'd_255;	// ~100% PWM duty cycle
					led5_pwm_count = 8'd_25;	// ~15% PWM duty cycle
					led6_pwm_count = 8'd_13;	// ~5% PWM duty cycle
					led7_pwm_count = 8'd_0;		// ~0% PWM duty cycle
				end
			5'd_13:
				begin
					led0_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led1_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led2_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led3_pwm_count = 8'd_255;	// ~100% PWM duty cycle
					led4_pwm_count = 8'd_25;	// ~15% PWM duty cycle
					led5_pwm_count = 8'd_13;	// ~5% PWM duty cycle
					led6_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led7_pwm_count = 8'd_0;		// ~0% PWM duty cycle
				end
			5'd_14:
				begin
					led0_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led1_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led2_pwm_count = 8'd_255;	// ~100% PWM duty cycle
					led3_pwm_count = 8'd_25;	// ~15% PWM duty cycle
					led4_pwm_count = 8'd_13;	// ~5% PWM duty cycle
					led5_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led6_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led7_pwm_count = 8'd_0;		// ~0% PWM duty cycle
				end
			5'd_15:
				begin
					led0_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led1_pwm_count = 8'd_255;	// ~100% PWM duty cycle
					led2_pwm_count = 8'd_25;	// ~15% PWM duty cycle
					led3_pwm_count = 8'd_13;	// ~5% PWM duty cycle
					led4_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led5_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led6_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led7_pwm_count = 8'd_0;		// ~0% PWM duty cycle
				end
			5'd_16:
				begin
					led0_pwm_count = 8'd_255;	// ~100% PWM duty cycle
					led1_pwm_count = 8'd_25;	// ~15% PWM duty cycle
					led2_pwm_count = 8'd_13;	// ~5% PWM duty cycle
					led3_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led4_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led5_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led6_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led7_pwm_count = 8'd_0;		// ~0% PWM duty cycle
				end
			5'd_17:
				begin
					led0_pwm_count = 8'd_255;	// ~100% PWM duty cycle
					led1_pwm_count = 8'd_13;	// ~5% PWM duty cycle
					led2_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led3_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led4_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led5_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led6_pwm_count = 8'd_0;		// ~0% PWM duty cycle
					led7_pwm_count = 8'd_0;		// ~0% PWM duty cycle
				end
		endcase
	end
endmodule