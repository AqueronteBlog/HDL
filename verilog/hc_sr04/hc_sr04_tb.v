/* 
@brief	hc_sr04_tb.v
@details	This is a testbecnh for the hc_sr04.v model. 


@return	N/A

@author	Manuel Caballero
@date		29/November/2025
@version	29/November/2025   The ORIGIN
@pre		This source code was tested with the hc_sr04.v file and ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://x.com/aqueronteblog
*/
`timescale 1ns/1ns

module hc_sr04_tb;
	reg trigger;
	reg echo;
	reg clock;			// f_clock = 50MHz (T_clock = 0.02us)
	wire[31:0] range;
	wire busy;
	
	hc_sr04 uut0 (.clock(clock), .trigger(trigger), .echo(echo), .range(range), .busy(busy));
	
	initial begin
		clock <= 1'b0;
		trigger <= 1'b0;
		echo <= 1'b0;
		#200;
		
		// New measurement
		trigger <= 1'b1;
		#10000;
		trigger <= 1'b0;
		#20000;
		
		// Echo_time(us) =  (2cm*1000)/17 ~ 118us(~2cm)
		echo <= 1'b1;
		#118000
		echo <= 1'b0;
		wait (busy == 1'b0);
		$display("time%0t echo_counter %d | range %f cm", $time, range, (17.0*range)/(1000.0*50.0));
		
		// New measurement
		trigger <= 1'b1;
		#10000;
		trigger <= 1'b0;
		#20000;
		
		// Echo_time(us) =  (10cm*1000)/17 ~ 588us(~10cm)
		echo <= 1'b1;
		#588000
		echo <= 1'b0;
		wait (busy == 1'b0);
		$display("time%0t echo_counter %d | range %f cm", $time, range, (17.0*range)/(1000.0*50.0));
		
		// New measurement
		trigger <= 1'b1;
		#10000;
		trigger <= 1'b0;
		#20000;
		
		// Echo_time(us) =  (400cm*1000)/17 ~ 23529us(~400cm)
		echo <= 1'b1;
		#23529000
		echo <= 1'b0;
		wait (busy == 1'b0);
		$display("time%0t echo_counter %d | range %f cm", $time, range, (17.0*range)/(1000.0*50.0));
		
		#1000; $stop;
	end
	
	// clock 50MHz (T = 20ns)
	always @(*) begin
		#10; clock <= ~clock;
	end
	
 endmodule