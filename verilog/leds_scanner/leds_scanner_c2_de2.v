module leds_scanner_c2_de2 (
	input CLOCK_50,
	output[7:0] LEDG
);

	leds_scanner #(.DELAY_TICKS(32'd_25_000_000)) uut0 (.clock(CLOCK_50), .leds(LEDG));
endmodule