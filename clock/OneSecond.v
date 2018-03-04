`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:40:47 03/28/2017 
// Design Name: 
// Module Name:    OneSecond 
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
module OneSecond(
    input clk,
    output puls_1
    );
	 
	reg [31:0]q;
	reg w;
	
	always @(posedge clk)
		if(q>=25000000)
			begin
			q<=0;
			w=~w;
			end
		else
			q<=q+1;

	assign puls_1=w;


endmodule
