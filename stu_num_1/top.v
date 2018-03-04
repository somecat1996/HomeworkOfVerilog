`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:24:18 03/31/2017 
// Design Name: 
// Module Name:    top 
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
module top(
    input clk,
    input [1:0] light,
    input display,
    output [6:0] num,
    output [3:0] en
    );
	 wire p_1s;
	 wire p625;
	 wire [6:0] num1;
	 wire [6:0] num2;
	 wire [6:0] num3;
	 wire [6:0] num4;
    wire [6:0] num0;
    wire [3:0] en0;
	 
clk_1s u1(.clk(clk),.out(p_1s));
clk625 u2(.clk(clk),.out(p625));
num u3(.p_1s(p_1s),.display(display),.num1(num1),.num2(num2),.num3(num3),.num4(num4));
en u4(.p625(p625),.num1(num1),.num2(num2),.num3(num3),.num4(num4),.light(light),.num(num),.en(en));

endmodule
