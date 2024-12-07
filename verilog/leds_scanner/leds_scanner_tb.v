`timescale 1ms/1ms

module leds_scanner_tb();
	reg clock = 1'b1;
	wire[7:0] leds;
	
	leds_scanner #(.DELAY_TICKS(32'd_50)) uut0 (.clock(clock), .leds(leds));
	
	initial begin
		#4000; $stop;
	end
	
	always @(*) begin
		#1; clock <= ~clock;
	end
endmodule