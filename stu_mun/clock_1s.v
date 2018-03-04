`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:16:07 03/30/2017 
// Design Name: 
// Module Name:    clock 
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
module clock(
    input clk,
    output p_500ms,
    output [3:0] p_625
    );
	 reg [31:0] q;
	 
always @ (posedge clk)
				if (q>=25000000)
					begin
					q<=0;
					p_500ms=~p_500ms;
					end
				else
				q<=q+1;

always @ (posedge clk)
				if (q>=25000000)
					begin
					q<=0;
					p_625<=p_625+1;
					end
				else
				q<=q+1;

endmodule
