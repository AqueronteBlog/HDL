module HALF_ADDER_behav (
	input[1:0] SW,
	output reg[1:0] LEDG
);
	
	always @(SW[0], SW[1]) begin
		LEDG[0] <= SW[0]^SW[1];		// a = SW[0], b = SW[1], s = LEDG[0]
		LEDG[1] <= SW[0]&SW[1];		// a = SW[0], b = SW[1], c = LEDG[1]
	end
endmodule