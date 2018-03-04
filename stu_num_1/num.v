`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:36:21 03/31/2017 
// Design Name: 
// Module Name:    num 
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
module num(
    input p_1s,
    input display,
    output reg [6:0] num1,
    output reg [6:0] num2,
    output reg [6:0] num3,
    output reg [6:0] num4
    );
	 
	 reg [1:0] count1=0;
	 reg [3:0] count2=0;
	 
	 always @ (posedge p_1s)
		begin
		if (display==1)
			begin
			case(count1)
			2'b00:begin
			  num1<=7'b0010010;
			  num2<=7'b1111001;
			  num3<=7'b0010010;
			  num4<=7'b1000000;
			  count1<=count1+1;
			  end
			2'b01:begin
			  num1<=7'b0110000;
			  num2<=7'b1000000;
			  num3<=7'b0010000;
			  num4<=7'b1111001;
			  count1<=count1+1;
			  end
			2'b10:begin
			  num1<=7'b1000000;
			  num2<=7'b1111001;
			  num3<=7'b0010000;
			  num4<=7'b0010010;
			  count1<=0;
			  end
			default:begin
			  num1<=7'b1111111;
			  num2<=7'b1111111;
			  num3<=7'b1111111;
			  num4<=7'b1111111;
			  count1<=0;
			  end
			endcase
			end
		if (display==0)
			begin
			case(count2)
			4'b0000:begin
			  num1<=7'b0010010;
			  num2<=7'b1111001;
			  num3<=7'b0010010;
			  num4<=7'b1000000;
			  count2<=count2+1;
			  end
			4'b0001:begin
			  num1<=7'b1111001;
			  num2<=7'b0010010;
			  num3<=7'b1000000;
			  num4<=7'b0110000;
			  count2<=count2+1;
			  end
			4'b0010:begin
			  num1<=7'b0010010;
			  num2<=7'b1000000;
			  num3<=7'b0110000;
			  num4<=7'b1000000;
			  count2<=count2+1;
			  end
			4'b0011:begin
			  num1<=7'b1000000;
			  num2<=7'b0110000;
			  num3<=7'b1000000;
			  num4<=7'b0010000;
			  count2<=count2+1;
			  end
			4'b0100:begin
			  num1<=7'b0110000;
			  num2<=7'b1000000;
			  num3<=7'b0010000;
			  num4<=7'b1111001;
			  count2<=count2+1;
			  end
			4'b0101:begin
			  num1<=7'b1000000;
			  num2<=7'b0010000;
			  num3<=7'b1111001;
			  num4<=7'b1000000;
			  count2<=count2+1;
			  end
			4'b0110:begin
			  num1<=7'b0010000;
			  num2<=7'b1111001;
			  num3<=7'b1000000;
			  num4<=7'b1111001;
			  count2<=count2+1;
			  end
			4'b0111:begin
			  num1<=7'b1111001;
			  num2<=7'b1000000;
			  num3<=7'b1111001;
			  num4<=7'b0010000;
			  count2<=count2+1;
			  end
			4'b1000:begin
			  num1<=7'b1000000;
			  num2<=7'b1111001;
			  num3<=7'b0010000;
			  num4<=7'b0010010;
			  count2<=0;
			  end
			default:begin
			  num1<=7'b1111111;
			  num2<=7'b1111111;
			  num3<=7'b1111111;
			  num4<=7'b1111111;
			  count2<=0;
			  end
			endcase
			end
		end

endmodule
