`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2025 22:54:17
// Design Name: 
// Module Name: PC
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


module PC1(clk,PC,PC_NEXT,rst);

input clk,rst;
input [31:0] PC_NEXT;
output [31:0]PC;
reg [31:0]PC;



always@(posedge clk)
    begin
        if(~rst)
            begin
                PC<={32{1'b0}};
            end
        else
            begin
                PC<=PC_NEXT;
            end
            
      end
       
endmodule
