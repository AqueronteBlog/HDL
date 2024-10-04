/* 
@brief	full_adder_tb.v
@details	This is a testbecnh for the full_adder.v model. 


@return	N/A

@author	Manuel Caballero
@date		04/October/2024
@version	04/October/2024    The ORIGIN
@pre		This source code was tested with the full_adder.v file and ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
`timescale 1ns/1ns

module full_adder_tb;
	reg a, b, cin;
	wire s, cout;
	
	FULL_ADDER uut0(.a(a), .b(b), .cin(cin), .s(s), .cout(cout)); 
	
	initial begin
		{a, b, cin} = 0;
		
		$monitor("time%0t a=%0b b=%0b cin=%0b | s=%0b cout=%0b", $time, a, b, cin, s, cout);
		
		#10; a <= 1;
		#10; a <= 0;
			  b <= 1;
			  cin <= 0;
		#10; a <= 1;
			  b <= 1;
			  cin <= 0;
		#10; a <= 0;
			  b <= 0;
			  cin <= 1;
		#10; a <= 1;
			  b <= 0;
			  cin <= 1;
		#10; a <= 0;
			  b <= 1;
			  cin <= 1;
		#10; a <= 1;
			  b <= 1;
			  cin <= 1;
		#10; $stop;
	end
endmodule
		