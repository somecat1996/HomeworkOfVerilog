`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:49:35 04/02/2017 
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
    input pause,
    input sum,
    input settlement,
    input [1:0] light,
    output reg [3:0] en,
    output reg [7:0] num,
	 output reg start,
	 output reg flag
    );
	 reg p_500ms;
	 reg p_625;
	 reg [31:0] q1;
	 reg [31:0] q2;
	 reg [3:0] tmp=0;
	 reg [1:0] num_1=0;
	 reg [1:0] pos=0;
	 reg [31:0] meter=0;
	 reg [31:0] money=100000;
	 reg [31:0] all;
    wire [7:0] num0;
    wire [7:0] num1;
    wire [7:0] num2;
    wire [7:0] num3;
    wire [7:0] num0_s;
    wire [7:0] num1_s;
    wire [7:0] num2_s;
    wire [7:0] num3_s;
	 
	 bcd u1(money,num0,num1,num2,num3);
	 bcd u2(all,num0_s,num1_s,num2_s,num3_s);

	 always @ (posedge clk)
				if (q1>=625)
					begin
					q1<=0;
					p_625=~p_625;
					end
				else
				q1<=q1+1;
				
	 always @ (posedge clk)
				if (q2>=25000000)
					begin
					q2<=0;
					p_500ms=~p_500ms;
					end
				else
				q2<=q2+1;
				
	 always @ (posedge settlement)
			begin
			if(start==0)
				start<=1;
			else
				begin
				start<=0;
				all<=all+money;
				end
			end
	 
	 always @ (posedge p_500ms)
	 begin
		if(start==1)
		begin
		meter<=meter+100;
		if(pause==0)
			begin
			if(meter>=3000&&meter<=10000)
				money<=money+2400;
			else if(meter>10000)
				money<=money+3600;
			end
		else
			money<=money+5000;
		end
		else
		begin
			meter<=0;
			money<=100000;
		end
	 end
	 
	 always @ (posedge sum)
			flag=~flag;
	 
	 always @ (posedge p_625)
			begin
					if(tmp==0)
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
					if(!flag)
						begin
						case(num_1)
						0:num<=num0;
						1:num<=num1;
						2:num<=num2;
						3:num<=num3;
						endcase
						end
					else
						begin
						case(num_1)
						0:num<=num0_s;
						1:num<=num1_s;
						2:num<=num2_s;
						3:num<=num3_s;
						endcase
						end
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
