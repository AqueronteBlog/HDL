/* 
@brief	FULL_ADDER.v
@details	This example shows how to model a full adder circuit. 

			The model is using logic gates.


@return	N/A

@author	Manuel Caballero
@date		04/October/2024
@version	04/October/2024    The ORIGIN
@pre		This source code was tested using ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://twitter.com/aqueronteblog
*/
module FULL_ADDER(
	input a, b, cin,
	output s, cout
);

	wire s_semi, c_semi_a, c_semi_b;
	
	xor(s_semi, a, b);
	and(c_semi_a, a, b);
	
	xor(s, s_semi, cin);
	and(c_semi_b, s_semi, cin);
	
	or(cout, c_semi_a, c_semi_b);
endmodule