`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:29:00 03/31/2017 
// Design Name: 
// Module Name:    clk_1s 
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
module clk_1s(
    input clk,
    output reg out
    );
	 reg q;
	 
always @ (posedge clk)
				if (q>=25000000)
					begin
					q<=0;
					out=~out;
					end
				else
				q<=q+1;


endmodule
