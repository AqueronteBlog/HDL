/* 
@brief	pir.v
@details	This example shows how to model a module to work with an external sensor: PIR.


@return	N/A

@author	Manuel Caballero
@date		24/July/2026
@version	24/July/2026    The ORIGIN
@pre		This source code was tested using ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://x.com/aqueronteblog
*/
module pir (
	input clk,			// fCLK = 50MHz
	input	reset,
	input pir_in,
	
	output	pir_out,
	output	pir_busy
);

	// FSM states
	localparam	S_NO_DETECTION		=	0,
					S_DETECTION			=	1,
					S_DETECTION_DELAY	=	2;
					
	reg[4:0] state	=	S_NO_DETECTION;
	
	localparam PIR_OUT_ON_DELAY =	50_000_000;	// PIR OUT ON for 1s, fCLK = 50MHz (TCLK = 1/fCLK = 20ns) -> PIR_OUT_ON_DELAY = 1s/TCLK = 1s/20ns = 50000000
	
	reg	pir_out_aux		=	1'b0;
	reg	pir_busy_aux	=	1'b0;
	reg[31:0]	delay_counter	=	32'b0;	
	
	always @(negedge clk or posedge reset) begin
		if (reset == 1'b1)
			begin
				pir_out_aux		<=	1'b0;
				pir_busy_aux	<=	1'b0;
				delay_counter	<= 32'b0;
				
				state				<=	S_NO_DETECTION;
			end
		else
			begin
				case (state)
					S_NO_DETECTION:
						begin
							if (pir_in == 1'b0)
								begin
									pir_out_aux		<=	1'b0;
									pir_busy_aux	<=	1'b0;
									
									state				<=	S_NO_DETECTION;
								end
							else
								state	<=	S_DETECTION;
						end
						
					S_DETECTION:
						begin
							pir_out_aux		<=	1'b1;
							pir_busy_aux	<=	1'b1;
							delay_counter	<= 32'b0;
							
							state	<=	S_DETECTION_DELAY;
						end
						
					S_DETECTION_DELAY:
						begin
							if (delay_counter < PIR_OUT_ON_DELAY)
								begin
									pir_out_aux		<=	1'b1;
									pir_busy_aux	<=	1'b1;
									delay_counter	<= delay_counter + 32'b1;
									
									state	<=	S_DETECTION_DELAY;
								end
							else
								begin
									pir_out_aux		<=	1'b0;
									pir_busy_aux	<=	1'b0;
									
									state	<=	S_NO_DETECTION;
								end
						end
				endcase
			end
	end
	
	
	// Outputs
	assign	pir_out	=	pir_out_aux;
	assign	pir_busy	=	pir_busy_aux;
endmodule