`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2025 22:31:09
// Design Name: 
// Module Name: register_file
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


module register_file(clk,rst,A1,A2,A3,WD3,RD1,RD2,WE3);

input clk,rst;
input [4:0]A1,A2,A3;
input[31:0]WD3;
input WE3;
output [31:0]RD1;
output [31:0]RD2;
reg [31:0]register[31:0];

integer i;
initial begin
    for (i = 0; i < 32; i = i + 1)
        register[i] = 32'b0;
    register[0] = 32'h00000005;
    register[2] = 32'h00000004;
end


always@(posedge clk)
begin   
    if(WE3)
        register[A3]<=WD3;
        
end
assign RD1= (~rst)?{32{1'b0}}:register[A1];
assign RD2= (~rst)?{32{1'b0}}:register[A2];



    


endmodule
