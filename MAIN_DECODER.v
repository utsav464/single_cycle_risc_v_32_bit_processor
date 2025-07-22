`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.07.2025 00:03:42
// Design Name: 
// Module Name: MAIN_DECODER
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


module MAIN_DECODER(op,regwrite,imm_src,alu_src,memwrite,result_src,branch,aluop);
input [6:0]op;
output regwrite, alu_src,memwrite,result_src,branch;
output [1:0]aluop,imm_src;


assign regwrite=(op==7'b0000011||op==7'b0110011|| op == 7'b0010011)?1'b1:1'b0;
assign imm_src=(op==7'b0100011) ? 2'b01:
              (op==7'b1100011) ? 2'b10:
                              2'b00;
assign alu_src=(op==7'b0000011||op==7'b0100011)?1'b1 :1'b0;

assign memwrite=(op==7'b0100011)?1'b1:1'b0;
assign result_src=(op==7'b0000011)?1'b1:1'b0;
assign branch=(op==7'b1100011)?1'b1:1'b0;
assign aluop=(op==7'b0110011)? 2'b10:
             (op == 7'b0010011) ? 2'b11 :
             (op==7'b1100011)? 2'b01:
                            2'b00;                            
              

endmodule
