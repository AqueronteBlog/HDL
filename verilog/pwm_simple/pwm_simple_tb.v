/* 
@brief	pwm_simple_tb.v
@details	This is a testbecnh for the pwm_simple.v model. 


@return	N/A

@author	Manuel Caballero
@date		05/March/2025
@version	05/March/2025    The ORIGIN
@pre		This source code was tested with the pwm_simple.v file and ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
`timescale 1ms/1ms

module pwm_simple_tb;
	reg clock;
	wire pwm_out0, pwm_out1, pwm_out2, pwm_out3;
	
	pwm_simple #(.PWM_DUTY_CYCLE(8'd_63))  uut_pwm25 (.clock(clock), .pwm_output(pwm_out0));	// 100*(PWM_DUTY_CYCLE/PWMres) = 100*(63/255)  ~ 24.71% 
	pwm_simple #(.PWM_DUTY_CYCLE(8'd_127)) uut_pwm50 (.clock(clock), .pwm_output(pwm_out1));	// 100*(PWM_DUTY_CYCLE/PWMres) = 100*(127/255) ~ 49.80% 	
	pwm_simple #(.PWM_DUTY_CYCLE(8'd_191)) uut_pwm75 (.clock(clock), .pwm_output(pwm_out2));	// 100*(PWM_DUTY_CYCLE/PWMres) = 100*(191/255) ~ 74.90% 	
	pwm_simple #(.PWM_DUTY_CYCLE(8'd_255)) uut_pwm100(.clock(clock), .pwm_output(pwm_out3));	// 100*(PWM_DUTY_CYCLE/PWMres) = 100*(255/255) ~ 100% 	
	
	initial begin
		clock <= 1'b1;
		
		#1000; $stop;
	end
	
	// f_PWMosc = 1kHz, T_PWM = 2*(2^PWMres - 1)*(1/f_PWMosc) = 2*(2^8 - 1)*(1/1000) = 510ms
	always @(*) begin
		#1; clock <= ~clock;
	end

endmodule