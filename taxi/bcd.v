`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:27:49 04/02/2017 
// Design Name: 
// Module Name:    bcd 
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
module bcd(
    input [31:0] money,
    output [7:0] num0,
    output [7:0] num1,
    output [7:0] num2,
    output [7:0] num3
    );
	 reg [3:0] tmp_4;
	 reg [3:0] tmp_3;
	 reg [3:0] tmp_2;
	 reg [3:0] tmp_1;
	 reg [3:0] tmp0;
	 reg [3:0] tmp1;
	 reg [3:0] tmp2;
	 reg [3:0] tmp3;
	 
	 integer i;
	 
always @ (money)
begin
	tmp_4=4'd0;
	tmp_3=4'd0;
	tmp_2=4'd0;
	tmp_1=4'd0;
	tmp0=4'd0;
	tmp1=4'd0;
	tmp2=4'd0;
	tmp3=4'd0;
	
	for(i=31;i>=0;i=i-1)
	begin
		if(tmp3>=5)
			tmp3=tmp3+3;
		if(tmp2>=5)
			tmp2=tmp2+3;
		if(tmp1>=5)
			tmp1=tmp1+3;
		if(tmp0>=5)
			tmp0=tmp0+3;
		if(tmp_1>=5)
			tmp_1=tmp_1+3;
		if(tmp_2>=5)
			tmp_2=tmp_2+3;
		if(tmp_3>=5)
			tmp_3=tmp_3+3;
		if(tmp_4>=5)
			tmp_4=tmp_4+3;
		
		tmp3=tmp3<<1;
		tmp3[0]=tmp2[3];
		tmp2=tmp2<<1;
		tmp2[0]=tmp1[3];
		tmp1=tmp1<<1;
		tmp1[0]=tmp0[3];
		tmp0=tmp0<<1;
		tmp0[0]=tmp_1[3];
		tmp_1=tmp_1<<1;
		tmp_1[0]=tmp_2[3];
		tmp_2=tmp_2<<1;
		tmp_2[0]=tmp_3[3];
		tmp_3=tmp_3<<1;
		tmp_3[0]=tmp_4[3];
		tmp_4=tmp_4<<1;
		tmp_4[0]=money[i];
	end
end

assign num0[0]=((tmp_1[0]&~tmp_1[1]&~tmp_1[2]&~tmp_1[3])|(~tmp_1[0]&~tmp_1[1]&tmp_1[2]&~tmp_1[3]));
assign num0[1]=((tmp_1[0]&~tmp_1[1]&tmp_1[2]&~tmp_1[3])|(~tmp_1[0]&tmp_1[1]&tmp_1[2]&~tmp_1[3]));
assign num0[2]=(~tmp_1[0]&tmp_1[1]&~tmp_1[2]&~tmp_1[3]);
assign num0[3]=((tmp_1[0]&~tmp_1[1]&~tmp_1[2]&~tmp_1[3])|(~tmp_1[0]&~tmp_1[1]&tmp_1[2]&~tmp_1[3])|(tmp_1[0]&tmp_1[1]&tmp_1[2]&~tmp_1[3]));
assign num0[4]=((tmp_1[0]&~tmp_1[1]&~tmp_1[2]&~tmp_1[3])|(tmp_1[0]&tmp_1[1]&~tmp_1[2]&~tmp_1[3])|(~tmp_1[0]&~tmp_1[1]&tmp_1[2]&~tmp_1[3])|(tmp_1[0]&~tmp_1[1]&tmp_1[2]&~tmp_1[3])|(tmp_1[0]&tmp_1[1]&tmp_1[2]&~tmp_1[3])|(tmp_1[0]&~tmp_1[1]&~tmp_1[2]&tmp_1[3]));
assign num0[5]=((tmp_1[0]&~tmp_1[1]&~tmp_1[2]&~tmp_1[3])|(~tmp_1[0]&tmp_1[1]&~tmp_1[2]&~tmp_1[3])|(tmp_1[0]&tmp_1[1]&~tmp_1[2]&~tmp_1[3])|(tmp_1[0]&tmp_1[1]&tmp_1[2]&~tmp_1[3]));
assign num0[6]=((~tmp_1[0]&~tmp_1[1]&~tmp_1[2]&~tmp_1[3])|(tmp_1[0]&~tmp_1[1]&~tmp_1[2]&~tmp_1[3])|(tmp_1[0]&tmp_1[1]&tmp_1[2]&~tmp_1[3]));
assign num0[7]=1;

assign num1[0]=((tmp0[0]&~tmp0[1]&~tmp0[2]&~tmp0[3])|(~tmp0[0]&~tmp0[1]&tmp0[2]&~tmp0[3]));
assign num1[1]=((tmp0[0]&~tmp0[1]&tmp0[2]&~tmp0[3])|(~tmp0[0]&tmp0[1]&tmp0[2]&~tmp0[3]));
assign num1[2]=(~tmp0[0]&tmp0[1]&~tmp0[2]&~tmp0[3]);
assign num1[3]=((tmp0[0]&~tmp0[1]&~tmp0[2]&~tmp0[3])|(~tmp0[0]&~tmp0[1]&tmp0[2]&~tmp0[3])|(tmp0[0]&tmp0[1]&tmp0[2]&~tmp0[3]));
assign num1[4]=((tmp0[0]&~tmp0[1]&~tmp0[2]&~tmp0[3])|(tmp0[0]&tmp0[1]&~tmp0[2]&~tmp0[3])|(~tmp0[0]&~tmp0[1]&tmp0[2]&~tmp0[3])|(tmp0[0]&~tmp0[1]&tmp0[2]&~tmp0[3])|(tmp0[0]&tmp0[1]&tmp0[2]&~tmp0[3])|(tmp0[0]&~tmp0[1]&~tmp0[2]&tmp0[3]));
assign num1[5]=((tmp0[0]&~tmp0[1]&~tmp0[2]&~tmp0[3])|(~tmp0[0]&tmp0[1]&~tmp0[2]&~tmp0[3])|(tmp0[0]&tmp0[1]&~tmp0[2]&~tmp0[3])|(tmp0[0]&tmp0[1]&tmp0[2]&~tmp0[3]));
assign num1[6]=((~tmp0[0]&~tmp0[1]&~tmp0[2]&~tmp0[3])|(tmp0[0]&~tmp0[1]&~tmp0[2]&~tmp0[3])|(tmp0[0]&tmp0[1]&tmp0[2]&~tmp0[3]));
assign num1[7]=2;

assign num2[0]=((tmp1[0]&~tmp1[1]&~tmp1[2]&~tmp1[3])|(~tmp1[0]&~tmp1[1]&tmp1[2]&~tmp1[3]));
assign num2[1]=((tmp1[0]&~tmp1[1]&tmp1[2]&~tmp1[3])|(~tmp1[0]&tmp1[1]&tmp1[2]&~tmp1[3]));
assign num2[2]=(~tmp1[0]&tmp1[1]&~tmp1[2]&~tmp1[3]);
assign num2[3]=((tmp1[0]&~tmp1[1]&~tmp1[2]&~tmp1[3])|(~tmp1[0]&~tmp1[1]&tmp1[2]&~tmp1[3])|(tmp1[0]&tmp1[1]&tmp1[2]&~tmp1[3]));
assign num2[4]=((tmp1[0]&~tmp1[1]&~tmp1[2]&~tmp1[3])|(tmp1[0]&tmp1[1]&~tmp1[2]&~tmp1[3])|(~tmp1[0]&~tmp1[1]&tmp1[2]&~tmp1[3])|(tmp1[0]&~tmp1[1]&tmp1[2]&~tmp1[3])|(tmp1[0]&tmp1[1]&tmp1[2]&~tmp1[3])|(tmp1[0]&~tmp1[1]&~tmp1[2]&tmp1[3]));
assign num2[5]=((tmp1[0]&~tmp1[1]&~tmp1[2]&~tmp1[3])|(~tmp1[0]&tmp1[1]&~tmp1[2]&~tmp1[3])|(tmp1[0]&tmp1[1]&~tmp1[2]&~tmp1[3])|(tmp1[0]&tmp1[1]&tmp1[2]&~tmp1[3]));
assign num2[6]=((~tmp1[0]&~tmp1[1]&~tmp1[2]&~tmp1[3])|(tmp1[0]&~tmp1[1]&~tmp1[2]&~tmp1[3])|(tmp1[0]&tmp1[1]&tmp1[2]&~tmp1[3]));
assign num2[7]=1;

assign num3[0]=((tmp2[0]&~tmp2[1]&~tmp2[2]&~tmp2[3])|(~tmp2[0]&~tmp2[1]&tmp2[2]&~tmp2[3]));
assign num3[1]=((tmp2[0]&~tmp2[1]&tmp2[2]&~tmp2[3])|(~tmp2[0]&tmp2[1]&tmp2[2]&~tmp2[3]));
assign num3[2]=(~tmp2[0]&tmp2[1]&~tmp2[2]&~tmp2[3]);
assign num3[3]=((tmp2[0]&~tmp2[1]&~tmp2[2]&~tmp2[3])|(~tmp2[0]&~tmp2[1]&tmp2[2]&~tmp2[3])|(tmp2[0]&tmp2[1]&tmp2[2]&~tmp2[3]));
assign num3[4]=((tmp2[0]&~tmp2[1]&~tmp2[2]&~tmp2[3])|(tmp2[0]&tmp2[1]&~tmp2[2]&~tmp2[3])|(~tmp2[0]&~tmp2[1]&tmp2[2]&~tmp2[3])|(tmp2[0]&~tmp2[1]&tmp2[2]&~tmp2[3])|(tmp2[0]&tmp2[1]&tmp2[2]&~tmp2[3])|(tmp2[0]&~tmp2[1]&~tmp2[2]&tmp2[3]));
assign num3[5]=((tmp2[0]&~tmp2[1]&~tmp2[2]&~tmp2[3])|(~tmp2[0]&tmp2[1]&~tmp2[2]&~tmp2[3])|(tmp2[0]&tmp2[1]&~tmp2[2]&~tmp2[3])|(tmp2[0]&tmp2[1]&tmp2[2]&~tmp2[3]));
assign num3[6]=((~tmp2[0]&~tmp2[1]&~tmp2[2]&~tmp2[3])|(tmp2[0]&~tmp2[1]&~tmp2[2]&~tmp2[3])|(tmp2[0]&tmp2[1]&tmp2[2]&~tmp2[3]));
assign num3[7]=1;

endmodule
