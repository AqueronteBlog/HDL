module BINARY_TO_GRAY (
	input a, b, c, d,
	output g3, g2, g1, g0
);

	assign g3 = d;
	xor(g2, d, c);
	xor(g1, c, b);
	xor(g0, b, a);
endmodule
