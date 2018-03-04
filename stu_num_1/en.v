`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:40:35 03/31/2017 
// Design Name: 
// Module Name:    en 
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
module en(
    input p625,
    input [6:0] num1,
    input [6:0] num2,
    input [6:0] num3,
    input [6:0] num4,
	 input [1:0] light,
    output reg [6:0] num,
    output reg [3:0] en
    );
	 reg [3:0] tmp=0;
	 reg [1:0] num_1=0;
	 reg [1:0] pos=0;
	 
	always @ (posedge p625)
			begin
			if(tmp==4'b0000)
				begin
				if(num_1==3)
					num_1<=0;
				else
					num_1<=num_1+1;
				if(pos==3)
					pos<=0;
				else
					pos<=pos+1;
				end
			case(num_1)
			0:num<=num1;
			1:num<=num2;
			2:num<=num3;
			3:num<=num4;
			endcase
			if(tmp>=4*light[0]+8*light[1]+3)
				begin
				en[0]<=1;
				en[1]<=1;
				en[2]<=1;
				en[3]<=1;
				end
			else
				begin
				en[0]<=~(~pos[0]&~pos[1]);
				en[1]<=~(pos[0]&~pos[1]);
				en[2]<=~(~pos[0]&pos[1]);
				en[3]<=~(pos[0]&pos[1]);
				end
			tmp<=tmp+1;
			end



endmodule
