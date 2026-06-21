/* 
@brief	parity_checker.v
@details	This example shows how to model the parity bit checker circuit.


@return	N/A

@author	Manuel Caballero
@date		19/May/2026
@version	19/May/2026    The ORIGIN
@pre		This source code was tested using ModelSim-Altera.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://x.com/aqueronteblog
*/
module parity_checker(
	input a, b, c, p,
	output pc
);
	wire ab;
	wire cp;
	
	xor(ab, a, b);
	xor(cp, c, p);
	xor(pc, ab, cp);

endmodule