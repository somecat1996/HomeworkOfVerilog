`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:07:54 03/28/2017 
// Design Name: 
// Module Name:    class2017_3_28_xor 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module class2017_3_28_xor(
    input a,
    input b,
    output y
    );
	 assign y = (a&!b)|(!a&b)

endmodule
