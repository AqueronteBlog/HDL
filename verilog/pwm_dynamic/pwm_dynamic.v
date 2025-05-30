/* 
@brief	pwm_simple.v
@details	This example shows how to model a dynamic PWM module.


@return	N/A

@author	Manuel Caballero
@date		30/May/2025
@version	30/May/2025    The ORIGIN
@pre		This source code was tested using ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
module pwm_dynamic (
	input clock, enable,
	input[7:0] pwm_count,
	output pwm
);

	reg[7:0] pwm_counter = 8'd_0;
	
	always @(negedge clock, posedge enable) begin
		if (enable == 1'b1)
			pwm_counter <= 8'd_0;
		else if (pwm_counter < 8'd_255)
			pwm_counter <= pwm_counter + 8'd_1;
		else
			pwm_counter <= 8'd_0;
	end
	
	// PWM output
	assign pwm = (pwm_count == 8'd_0)? 1'b0 :
					 (pwm_counter <= pwm_count)? 1'b1 : 1'b0;

endmodule