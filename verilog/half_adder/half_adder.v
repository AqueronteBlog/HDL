module HALF_ADDER (
	input[1:0] SW,
	output[1:0] LEDG
);

	xor(LEDG[0], SW[0], SW[1]);	// a = SW[0], b = SW[1], s = LEDG[0]
	and(LEDG[1], SW[0], SW[1]);	// a = SW[0], b = SW[1], c = LEDG[1]
endmodule