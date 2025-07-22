`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.07.2025 16:48:29
// Design Name: 
// Module Name: ALU
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


module ALU(A,B,alucontrol,overflow,carry,zero,negative,Result);
input [31:0] A,B;
input[2:0]alucontrol;
output overflow,carry,zero,negative;
output [31:0]Result;

wire cout;
wire [31:0] sum;

assign{cout,sum}=(alucontrol[0] == 1'b0) ? A + B :
                                          (A + (~B+1)) ;
                 
                 
                 
                 

 assign Result =    (alucontrol == 3'b000) ? sum :
                    (alucontrol == 3'b001) ? sum :
                    (alucontrol == 3'b010) ? A & B :
                    (alucontrol == 3'b011) ? A | B :
                    (alucontrol == 3'b101) ? {{31{1'b0}},(sum[31])} : {32{1'b0}};
    

assign overflow=(sum[31]^B[31])&(~alucontrol[0]^A[31]^B[31])&(alucontrol[1]);
assign carry=(alucontrol == 3'b000 || alucontrol == 3'b001) ? cout : 1'b0;
assign negative=Result[31];
assign zero=&(~Result);
endmodule

