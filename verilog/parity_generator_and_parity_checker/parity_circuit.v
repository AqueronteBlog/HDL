/* 
@brief	parity_circuit.v
@details	This example shows how to model the circuit to both generate a parity bit and parity checker.


@return	N/A

@author	Manuel Caballero
@date		21/June/2026
@version	21/June/2026    The ORIGIN
@pre		This source code was tested using ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://x.com/aqueronteblog
*/
module parity_circuit(
	input a, b, c,
	output pc
);
	
	wire odd, even;
	
	parity_bit 			parity0	(.a(a), .b(b), .c(c), .odd(odd), .even(even));
	parity_checker		checker0 (.a(a), .b(b), .c(c), .p(odd), .pc(pc));
	
endmodule