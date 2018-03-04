`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Compnumny: 
// Engineer: 
// 
// Crenumte Dnumte:    18:09:11 03/29/2017 
// Design Nnumme: 
// Module Nnumme:    test2 
// Project Nnumme: 
// Tnumrget Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Crenumted
// numdditionnuml Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module test2(
	 input clk,
	 input [1:0] a,
    output reg [6:0] c,
    output reg [3:0] d
    );
	 
	 reg [3:0] num=0;
	 reg [1:0] pos=0;
	 reg [31:0] q;
	 reg p_500ms;
	 reg [3:0]tmp=0;
	 
	 always @ (posedge clk)
				if (q>=625)
					begin
					q<=0;
					tmp<=tmp+1;
					p_500ms=~p_500ms;
					end
				else
				q<=q+1;
				
	 always @ (posedge p_500ms)
		begin
		
		//else
		//begin
		if(tmp==4'b0000)
		begin
			if(num==3)
				num<=0;
			if(num<3)
				num<=num+1;
			if(pos==3)
				pos<=0;
			if(pos<3)
				pos<=pos+1;
		//end
		end
		
		
		c[0]<=((num[0]&~num[1]&~num[2]&~num[3])|(~num[0]&~num[1]&num[2]&~num[3]));
		c[1]<=((num[0]&~num[1]&num[2]&~num[3])|(~num[0]&num[1]&num[2]&~num[3]));
		c[2]<=(~num[0]&num[1]&~num[2]&~num[3]);
		c[3]<=((num[0]&~num[1]&~num[2]&~num[3])|(~num[0]&~num[1]&num[2]&~num[3])|(num[0]&num[1]&num[2]&~num[3]));
		c[4]<=((num[0]&~num[1]&~num[2]&~num[3])|(num[0]&num[1]&~num[2]&~num[3])|(~num[0]&~num[1]&num[2]&~num[3])|(num[0]&~num[1]&num[2]&~num[3])|(num[0]&num[1]&num[2]&~num[3])|(num[0]&~num[1]&~num[2]&num[3]));
		c[5]<=((num[0]&~num[1]&~num[2]&~num[3])|(~num[0]&num[1]&~num[2]&~num[3])|(num[0]&num[1]&~num[2]&~num[3])|(num[0]&num[1]&num[2]&~num[3]));
		c[6]<=((~num[0]&~num[1]&~num[2]&~num[3])|(num[0]&~num[1]&~num[2]&~num[3])|(num[0]&num[1]&num[2]&~num[3]));
		if(tmp>=4*a[0]+8*a[1]+3)
		begin
			d[0]<=1;
			d[1]<=1;
			d[2]<=1;
			d[3]<=1;
		end
		else
		begin
			d[0]<=~(~pos[0]&~pos[1]);
			d[1]<=~(pos[0]&~pos[1]);
			d[2]<=~(~pos[0]&pos[1]);
			d[3]<=~(pos[0]&pos[1]);
		end
		end


endmodule
