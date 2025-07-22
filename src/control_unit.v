`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2025 23:59:49
// Design Name: 
// Module Name: control_unit
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

module control_unit(op,funct7,funct3,regwrite,alu_src,memwrite,result_src,branch,imm_src,alucontrol);
input [6:0]op;
input [6:0] funct7;
input [2:0] funct3;
output regwrite,alu_src,memwrite,result_src,branch;
output wire [2:0]alucontrol;
output [1:0]imm_src;
wire [1:0]aluop_internal;

ALU_DECODER alu_decoder(
                       .aluop(aluop_internal),
                       .funct3(funct3),
                       .funct7(funct7),
                       .op(op),
                       .alucontrol(alucontrol)
                         
                         );
                         
MAIN_DECODER main_decoder(
                          .op(op),
                          .regwrite(regwrite),
                          .imm_src(imm_src),
                          .alu_src(alu_src),
                          .memwrite(memwrite),
                          .result_src(result_src),
                          .branch(branch),
                          .aluop(aluop_internal)
                           );                         

endmodule
