/* 
@brief	hc_sr04.v
@details	This example shows how to model a HC-SR04 device.


@return	N/A

@author	Manuel Caballero
@date		29/November/2025
@version	29/November/2025    The ORIGIN
@pre		This source code was tested using ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://x.com/aqueronteblog
*/
module hc_sr04 (
	input trigger,
	input echo,
	input clock,
	output[31:0] range,
	output busy
);
	
	reg busy_aux = 1'b0;
	reg[31:0] echo_count = 32'b0;
	
	// Logic
	always @(negedge clock) begin
		if (trigger == 1'b1)
			begin
				busy_aux <= 1'b0;
				echo_count <= 32'b0;
			end
		else
			begin
				if (echo == 1'b1)
					begin
						busy_aux <= 1'b1;
						echo_count <= echo_count + 32'b1;
					end
				else
					busy_aux <= 1'b0;
			end
	end
	
	// Outputs
	assign busy	= busy_aux;
	assign range = echo_count;

endmodule