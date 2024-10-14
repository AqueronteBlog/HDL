module MAGNITUDE_COMPARATOR (
	input a, b,
	output reg a_greater_b, a_equal_b, a_lower_b
);

	always @(a, b) begin
		a_greater_b <= a & ~b;
		a_equal_b <= ~(a^b);
		a_lower_b <= ~a & b;
	end
endmodule