module GRAY_TO_BINARY (
	input g3, g2, g1, g0,
	output d, c, b, a
);

	assign d = g3;
	xor(c, g3, g2);
	xor(b, c, g1);
	xor(a, b, g0);
endmodule