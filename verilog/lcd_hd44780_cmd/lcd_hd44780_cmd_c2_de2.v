/* 
@brief	lcd_hd44780_cmd_c2_de2.v
@details	This example shows how use the Hitachi LCD HD44780 device in manula mode. 


@return	N/A

@author	Manuel Caballero
@date		27/December/2025
@version	27/December/2025    The ORIGIN
@pre		This source code was tested on the Altera’s DE2 board.
@warning	N/A.
@pre		This code belongs to AqueronteBlog.
				- GitHub:  https://github.com/AqueronteBlog
            - YouTube: https://www.youtube.com/user/AqueronteBlog
            - X:       https://x.com/aqueronteblog
*/
module lcd_hd44780_cmd_c2_de2 (
	input[12:0] SW,
	output[7:0] LCD_DATA,
	output LCD_RW,
	output LCD_RS,
	output LCD_ON,
	output LCD_BLON,
	output LCD_EN
);

	assign LCD_DATA[7:0] =	SW[7:0];
	assign LCD_RW = SW[8];
	assign LCD_RS = SW[9];
	assign LCD_ON = SW[10];
	assign LCD_BLON = SW[11];
	assign LCD_EN = SW[12];
	
endmodule