`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2025 22:42:55
// Design Name: 
// Module Name: data_memory
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


module data_memory(A,WE,RD,WD,clk,rst);

input [31:0] A;
input [31:0]WD;
input WE,clk,rst;
output [31:0]RD;
reg [31:0] memory[1023:0];
 


assign RD=(rst)?memory[A]:{32'h00000000};


always@(posedge clk)
    begin
    if(WE)
        begin
            memory[A]<=WD;
        end
     end   
   initial begin
        memory[28] = 32'h00000020;
        //mem[40] = 32'h00000002;
    end  
endmodule
