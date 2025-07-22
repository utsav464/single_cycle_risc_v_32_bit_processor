`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2025 23:20:59
// Design Name: 
// Module Name: sign_extend
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


module sign_extend(in,imm_src,imm_ext);

input [31:0]in;
input [1:0] imm_src;
output[31:0] imm_ext;


assign imm_ext=(imm_src==2'b01)?{{20{in[31]}},in[31:25],in[11:7]}:
               (imm_src==2'b00)? {{20{in[31]}},in[31:20]}:32'h00000000;


endmodule
