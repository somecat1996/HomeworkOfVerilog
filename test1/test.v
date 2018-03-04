`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:21:41 03/28/2017 
// Design Name: 
// Module Name:    test 
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
module test(
	input a,
	input c,
	output b,
	output reg [6:0]x,
	output reg [3:0]y = 4'b0001
    );
always @ (posedge c)
begin
	case(y)
	4'b0001:y<=4'b0010;
	4'b0010:y<=4'b0100;
	4'b0100:y<=4'b1000;
	default:y<=4'b0001;
	endcase
	case(y)
	4'b0001:x<=7'b1111001;
	4'b0010:x<=7'b0100100;
	4'b0100:x<=7'b0110000;
	default:x<=7'b0011001;
	endcase
end

assign b=a;
endmodule
