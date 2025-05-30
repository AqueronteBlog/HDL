/* 
@brief	pwm_simple_tb.v
@details	This is a testbecnh for the pwm_dynamic.v model. 


@return	N/A

@author	Manuel Caballero
@date		30/May/2025
@version	30/May/2025    The ORIGIN
@pre		This source code was tested with the pwm_dynamic.v file and ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
`timescale 1ms/1ms

module pwm_dynamic_tb;
	reg clock;
	reg enable;
	reg[7:0] pwm_count;
	wire pwm_out0;
	
	pwm_dynamic uut0 (.pwm_count(pwm_count), .clock(clock), .enable(enable), .pwm(pwm_out0));

	initial begin
		clock <= 1'b0;
		enable <= 1'b1;
		#500;
		
		enable <= 1'b0;
		pwm_count <= 8'd_0;	// 0% PWM duty cycle
		#1500;
		
		enable <= 1'b1;
		#2;
		enable <= 1'b0;
		pwm_count <= 8'd_59;	// ~23% PWM duty cycle
		#1500;
		
		enable <= 1'b1;
		#2;
		enable <= 1'b0;
		pwm_count <= 8'd_128;	// ~50% PWM duty cycle
		#1500;
		
		enable <= 1'b1;
		#2;
		enable <= 1'b0;
		pwm_count <= 8'd_191;	// ~75% PWM duty cycle
		#1500;
		
		enable <= 1'b1;
		#2;
		enable <= 1'b0;
		pwm_count <= 8'd_255;	// ~100% PWM duty cycle
		#1500;
		
		#1500; $stop;
	end
	
	// fPWM_OSC = (1/(2*2ms)) = 250Hz -> TPWM = (2^PWMres - 1)*(1/fPWM_OSC) = (2^8 - 1)*(1/250Hz) = 1.02s (~0.98Hz)
	always @(*) begin
		#2; clock <= ~clock;
	end
	
endmodule