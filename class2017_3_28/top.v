`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:21:43 03/28/2017 
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
    input m,
    input n,
    input u,
    input v,
    output x,
    output y,
    output z
    );
	 and1 u1(.a(m),
				.b(n),
				.y(x)
				);
	 or1 u2(.a(m),
			  .b(u),
			  .y(y)
			  );
	 xor1 u3(.a(m),
				.b(v),
				.y(z)
				);


endmodule
