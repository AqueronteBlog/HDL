/* 
@brief	pwm_output_c2_de2.v
@details	This example shows how to model four simple PWM modules. 


@return	N/A

@author	Manuel Caballero
@date		05/March/2025
@version	05/March/2025    The ORIGIN
@pre		This source code was tested on the Altera’s DE2 board.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
module pwm_output_c2_de2 (
	input CLOCK_50,
	output[3:0] LEDG
);
	reg [31:0] delay = 32'b0;
	reg clk_500hz = 1'b0;
	
	pwm_simple #(.PWM_DUTY_CYCLE(8'd_63))  uut_pwm25 (.clock(clk_500hz), .pwm_output(LEDG[0]));	// PWM_DUTY_CYCLE = 25%
	pwm_simple #(.PWM_DUTY_CYCLE(8'd_127)) uut_pwm50 (.clock(clk_500hz), .pwm_output(LEDG[1]));	// PWM_DUTY_CYCLE = 50%
	pwm_simple #(.PWM_DUTY_CYCLE(8'd_191)) uut_pwm75 (.clock(clk_500hz), .pwm_output(LEDG[2]));	// PWM_DUTY_CYCLE = 75%
	pwm_simple #(.PWM_DUTY_CYCLE(8'd_255)) uut_pwm100(.clock(clk_500hz), .pwm_output(LEDG[3]));	// PWM_DUTY_CYCLE = 100%
	
	// f_OSC = 50MHz, f_PWMosc = 500Hz -> ratio = f_OSC/f_PWMosc = 50MHz/500Hz = 100000
	// T_PWM = 2*(2^PWMres - 1)*(1/f_PWMosc) = 2*(2^8 - 1)*(1/500) = 1.02s (f_PWM ~ 0.98Hz)
	always @(negedge CLOCK_50) begin
		if (delay < 32'd_100_000)
			delay <= delay + 32'b1;
		else
			begin
				delay <= 32'b0;
				clk_500hz <= ~clk_500hz;
			end
	end
endmodule