/* 
@brief	parity_bit.v
@details	This example shows how to model the parity bit circuit.


@return	N/A

@author	Manuel Caballero
@date		17/March/2026
@version	17/March/2026    The ORIGIN
@pre		This source code was tested using ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://x.com/aqueronteblog
*/
module parity_bit (
	input a, b, c,
	output odd, even
);

	wire xor_ab_output;
	
	xor (xor_ab_output, a, b);
	xor (odd, xor_ab_output, c);	// ODD output (impar)
	not (even, odd);					// EVEN output (par)

endmodule