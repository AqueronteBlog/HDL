module MAGNITUDE_COMPARATOR_c2_de2 (
	input[1:0] SW,
	output reg[2:0] LEDG
);

	always @(SW[0], SW[1]) begin
		LEDG[0] <= SW[0] & ~SW[1];
		LEDG[1] <= ~(SW[0]^SW[1]);
		LEDG[2] <= ~SW[0] & SW[1];
	end
endmodule