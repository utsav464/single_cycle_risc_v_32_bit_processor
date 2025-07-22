`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2025 23:03:50
// Design Name: 
// Module Name: single_cycle
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
`include"instruction_memory.v"
`include"PC.v"
`include"data_memory.v"
`include"register_file.v"
`include"sign_extend.v"
`include"ALU.v"
`include"PC_ADDER.v"
`include"control_unit.v"
`include"Mux.v"

module single_cycle(clk,rst);
input clk,rst;
wire [31:0] PC_TOP,instr,RD1_TOP,RD2_TOP,imm_ext_top,aluresult,readdata,PC_PLUS,srcb,Result;
wire memwrite,alu_src,regwrite,result_src,branch;
wire [2:0]alucontrol;
wire [1:0]imm_src;
PC1 pc1(
   .clk(clk),
   .PC(PC_TOP),
   .PC_NEXT(PC_PLUS),
   .rst(rst)
   );
   
   
instruction_memory instruction_memory(
                                      .rst(rst),
                                      .A(PC_TOP),
                                      .RD(instr)
                                      );   


register_file register_file(
                             .clk(clk),
                             .rst(rst),
                             .A1(instr[19:15]),
                             .A2(instr[24:20]),
                             .A3(instr[11:7]),
                             .WD3(Result),
                             .RD1(RD1_TOP),
                             .RD2(RD2_TOP),
                             .WE3(regwrite)
                             );
data_memory  data_memory(
                         .A(aluresult),
                         .WE(memwrite),
                         .RD(readdata),
                         .WD(RD2_TOP),
                         .clk(clk),
                         .rst(rst)
                          );              
              
sign_extend sign_extend(
                       .in(instr),
                       .imm_src(imm_src),
                       .imm_ext(imm_ext_top)
                        ) ;    
                        
ALU alu(
        .A(RD1_TOP),
        .B(srcb),
        .alucontrol(alucontrol),
        .overflow(),
        .carry(),
        .zero(),
        .negative(),
        .Result(aluresult)
         );               
PC_ADDER  pc_adder(
                   .a(PC_TOP),
                   .b(32'd4),
                   .c(PC_PLUS)
                   );   
                   
control_unit control_unit(
                         .op(instr[6:0]),
                         .funct7(instr[31:25]),
                         .funct3(instr[14:12]),
                         .regwrite(regwrite),
                         .alu_src(alu_src),
                         .memwrite(memwrite),
                         .result_src(result_src),
                         .branch(),
                         .imm_src(imm_src),
                         .alucontrol(alucontrol)
                          );
                          
                          
 Mux register_to_alu(
                      .a(RD2_TOP),
                      .b(imm_ext_top),
                      .s(alu_src),
                      .c(srcb) 
                      
                      );           
                      
Mux data_memory_to_register_file  (  
                                   .a(aluresult),                                                               
                                   .b(readdata), 
                                   .s(result_src),
                                   .c(Result) 
                                   );





endmodule                             
                                          