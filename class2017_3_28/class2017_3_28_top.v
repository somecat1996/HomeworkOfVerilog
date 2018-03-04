`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:07:31 03/28/2017 
// Design Name: 
// Module Name:    class2017_3_28_top 
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
module class2017_3_28_top(
    input m,
    input n,
    input u,
    input v,
    output y,
    output z,
    output x
    );
	 
	 class2017_3_28_and u1(.a(m),
								  .b(n),
								  .y(x)
								  )
	 class2017_3_28_or u2(.a(m),
							  .b(u),
							  .y(y)
							  )
    class2017_3_28_xor u3(.a(m),
								  .b(v),
								  .y(z)
								  )

endmodule
