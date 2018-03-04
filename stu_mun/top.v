`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:14:24 03/30/2017 
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
    output reg [6:0] num,
    output reg [3:0] en,
    input [1:0] light,
    input display
    );
	 reg p_500ms;
	 reg p_625;
	 reg [6:0] num1;
	 reg [6:0] num2;
	 reg [6:0] num3;
	 reg [6:0] num4;
	 reg [1:0] count1=0;
	 reg [3:0] count2=0;
	 reg [3:0] tmp=0;
	 reg [1:0] num_1=0;
	 reg [1:0] pos=0;
	 reg [31:0] q1;
	 reg [31:0] q2;
	 reg q3=1;
	 
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
	 always @ (posedge p_500ms)
		begin
		q3=~q3;
		if ((display==1)&&(q3==1))
			begin
			count2<=0;
			case(count1)
			2'b00:begin
			  num1=7'b0010010;
			  num2=7'b1111001;
			  num3=7'b0010010;
			  num4=7'b1000000;
			  count1<=count1+1;
			  end
			2'b01:begin
			  num1=7'b0110000;
			  num2=7'b1000000;
			  num3=7'b0010000;
			  num4=7'b1111001;
			  count1<=count1+1;
			  end
			2'b10:begin
			  num1=7'b1000000;
			  num2=7'b1111001;
			  num3=7'b0010000;
			  num4=7'b0010010;
			  count1<=0;
			  end
			default:begin
			  num1=7'b1111111;
			  num2=7'b1111111;
			  num3=7'b1111111;
			  num4=7'b1111111;
			  count1<=0;
			  end
			endcase
			end
		if (display==0)
			begin
			count1<=0;
			case(count2)
			4'b0000:begin
			  num1=7'b0010010;
			  num2=7'b1111001;
			  num3=7'b0010010;
			  num4=7'b1000000;
			  count2<=count2+1;
			  end
			4'b0001:begin
			  num1=7'b1111001;
			  num2=7'b0010010;
			  num3=7'b1000000;
			  num4=7'b0110000;
			  count2<=count2+1;
			  end
			4'b0010:begin
			  num1=7'b0010010;
			  num2=7'b1000000;
			  num3=7'b0110000;
			  num4=7'b1000000;
			  count2<=count2+1;
			  end
			4'b0011:begin
			  num1=7'b1000000;
			  num2=7'b0110000;
			  num3=7'b1000000;
			  num4=7'b0010000;
			  count2<=count2+1;
			  end
			4'b0100:begin
			  num1=7'b0110000;
			  num2=7'b1000000;
			  num3=7'b0010000;
			  num4=7'b1111001;
			  count2<=count2+1;
			  end
			4'b0101:begin
			  num1=7'b1000000;
			  num2=7'b0010000;
			  num3=7'b1111001;
			  num4=7'b1000000;
			  count2<=count2+1;
			  end
			4'b0110:begin
			  num1=7'b0010000;
			  num2=7'b1111001;
			  num3=7'b1000000;
			  num4=7'b1111001;
			  count2<=count2+1;
			  end
			4'b0111:begin
			  num1=7'b1111001;
			  num2=7'b1000000;
			  num3=7'b1111001;
			  num4=7'b0010000;
			  count2<=count2+1;
			  end
			4'b1000:begin
			  num1=7'b1000000;
			  num2=7'b1111001;
			  num3=7'b0010000;
			  num4=7'b0010010;
			  count2<=0;
			  end
			default:begin
			  num1=7'b1111111;
			  num2=7'b1111111;
			  num3=7'b1111111;
			  num4=7'b1111111;
			  count2<=0;
			  end
			endcase
			end
		end
		
		always @ (posedge p_625)
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
