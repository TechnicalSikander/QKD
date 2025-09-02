`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IIT JAMMU
// Engineer: MOHAMMAD SIKANDER SHEIKH
// 
// Create Date: 02.09.2025 17:53:59
// Design Name: 
// Module Name: pop_cnt
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module ones_counter_6bit (
    input [5:0] data_in,
    output  [2:0] ones_count
);
wire [2:0] x1,x2,x3,x4;

  assign x1=data_in[0]+data_in[1];
  assign x2=data_in[4]+data_in[5];
  assign x3= data_in[3]+x1;
  assign x4= data_in[5]+x2;
  assign ones_count=x3+x4;

endmodule
