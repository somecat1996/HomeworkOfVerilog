`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:20:16 03/12/2017 
// Design Name: 
// Module Name:    Counter_V 
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
module Counter_V(
    input clk,
    input clr,
    input en,
    output reg [7:0] ld
    );
	 
	 reg [31:0]q;
	 reg p_500ms;
	 always @ (posedge clk)
				if (q>=25000000)
					begin
					q<=0;
					p_500ms=~p_500ms;
					end
				else
				q<=q+1;
	
	always @ (posedge p_500ms or posedge clr)
			if(clr==1)
			ld<=0;
			else if(en==1)
				ld<=ld+1;


endmodule