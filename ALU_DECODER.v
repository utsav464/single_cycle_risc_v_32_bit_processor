`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.07.2025 00:03:21
// Design Name: 
// Module Name: ALU_DECODER
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


module ALU_DECODER(
    input [1:0] aluop,
    input [2:0] funct3,
    input [6:0] funct7, op,
    output reg [2:0] alucontrol
);

always @(*) begin
    case (aluop)
        2'b00: alucontrol = 3'b000; // load/store → ALU does add
        2'b01: alucontrol = 3'b001; // branch     → ALU does subtract
        2'b10: begin // R-type
            case (funct3)
                3'b000: alucontrol = (funct7[5] == 1'b0) ? 3'b000 : 3'b001; // ADD or SUB
                3'b111: alucontrol = 3'b010; // AND
                3'b110: alucontrol = 3'b011; // O
                3'b010: alucontrol = 3'b101; // SLT
                default: alucontrol = 3'b000;
            endcase
        end
        default: alucontrol = 3'b000;
    endcase
end



endmodule
