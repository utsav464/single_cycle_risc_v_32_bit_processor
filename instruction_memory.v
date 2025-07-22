`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2025 22:16:51
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory(rst,A,RD);
input rst;
input [31:0] A;
output [31:0] RD;
reg[31:0]mem[1023:0];
assign RD=(~rst)?{32{1'b0}}:mem[A[31:2]];
   
   
   initial
      begin
        $readmemh ("memfile.mem", mem);
        $display("Memory[0] = %h", mem[0]);
        $display("Memory[1] = %h", mem[1]);
      end


 endmodule
