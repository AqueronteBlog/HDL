/* 
@brief	pwm_simple.v
@details	This example shows how to model a simple PWM module.


@return	N/A

@author	Manuel Caballero
@date		05/March/2025
@version	05/March/2025    The ORIGIN
@pre		This source code was tested using ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
module pwm_simple #(parameter PWM_DUTY_CYCLE = 8'd_128)(
	input clock,
	output pwm_output
);
	
	reg[7:0] pwm_counter = 8'd_0;
	
	// PWM timer counter
	always @(negedge clock) begin
		if (pwm_counter < 8'd_255)
			pwm_counter <= pwm_counter + 8'd_1;
		else
			pwm_counter <= 8'd_0;
	end
	
	// PWM Output
	assign pwm_output = (pwm_counter <= PWM_DUTY_CYCLE) ? 1'b1 : 1'b0;
endmodule