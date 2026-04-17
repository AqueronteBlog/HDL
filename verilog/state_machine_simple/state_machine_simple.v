/* 
@brief	state_machine_simple.v
@details	This example shows how to model implement a State Machine.


@return	N/A

@author	Manuel Caballero
@date		17/April/2026
@version	17/April/2026    The ORIGIN
@pre		This source code was tested using ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://x.com/aqueronteblog
*/
module state_machine_simple (
		input clk,
		input reset_n,
		output [3:0] leds
);


	// Satet machine: States
	localparam
		S_INIT_LEDS_OFF	=	0,
		S_LED1_ON			=	1,
		S_LED2_ON			=	2,
		S_LED3_ON			=	3,
		S_LED4_ON			=	4;
	
	
	// f_OSC = 50MHz, Delay = 250ms (f_Delay = 4Hz) --> ratio = f_OSC/f_Delay = 50MHz/4Hz = 12_500_000
	localparam CLK_FREQ		=	32'd_50_000_000;
	localparam DELAY_250MS	=	CLK_FREQ/32'd_4;
	
	// Registers
	reg [2:0] state		=	S_INIT_LEDS_OFF;
	reg [3:0] ledon		=	4'b0000;
	reg [31:0]delay250ms	=	32'd0;
	
	// State machine
	always @(posedge clk or negedge reset_n) begin
		if (reset_n == 1'b0)
			begin
				state			<= S_INIT_LEDS_OFF;
			end
		else
			begin
				case(state)
					S_INIT_LEDS_OFF:
					begin
						ledon			<=	4'b0000;
						delay250ms	<=	32'd0;
						
						state	<= S_LED1_ON;
					end
					
					S_LED1_ON:
					begin
						if (delay250ms < DELAY_250MS)
							begin
								ledon			<=	4'b0001;
								delay250ms	<=	delay250ms + 32'd_1;
							end
						else
							begin
								delay250ms	<=	32'd0;
								state			<= S_LED2_ON;
							end
					end
					
					S_LED2_ON:
					begin
						if (delay250ms < DELAY_250MS)
							begin
								ledon			<=	4'b0010;
								delay250ms	<=	delay250ms + 32'd_1;
							end
						else
							begin
								delay250ms	<=	32'd0;
								state			<= S_LED3_ON;
							end
					end
					
					S_LED3_ON:
					begin
						if (delay250ms < DELAY_250MS)
							begin
								ledon			<=	4'b0100;
								delay250ms	<=	delay250ms + 32'd_1;
							end
						else
							begin
								delay250ms	<=	32'd0;
								state			<= S_LED4_ON;
							end
					end
					
					S_LED4_ON:
					begin
						if (delay250ms < DELAY_250MS)
							begin
								ledon			<=	4'b1000;
								delay250ms	<=	delay250ms + 32'd_1;
							end
						else
							begin
								delay250ms	<=	32'd0;
								state			<= S_LED1_ON;
							end
					end
				endcase
			end
	end
	
	// Output. LEDs
	assign leds	=	ledon;
	
endmodule