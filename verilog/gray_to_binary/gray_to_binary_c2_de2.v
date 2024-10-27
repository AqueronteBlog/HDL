module GRAY_TO_BINARY_c2_de2 (
	input[3:0] SW,
	output[3:0] LEDG
);

	assign LEDG[3] = SW[3];
	xor(LEDG[2], SW[3], SW[2]);
	xor(LEDG[1], LEDG[2], SW[1]);
	xor(LEDG[0], LEDG[1], SW[0]);
endmodule