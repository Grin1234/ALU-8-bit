`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Georgescu Catalin
// 
// Create Date: 04/26/2025 04:26:04 PM
// Design Name: MUX2N
// Module Name: MUX2N
// Project Name: ALU-8-BIT
// Target Devices: ALU-8-BIT
// Tool Versions: 
// Description: Multiplexer that chooses between 2 inputs of WIDTH bits
// 
// Dependencies: 
// 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Mux2N #(
    parameter WIDTH = 8
)(
    input wire sel,
    input wire [WIDTH-1:0] D1,
    input wire [WIDTH-1:0] D2,
    output wire [WIDTH-1:0] Q
    );
    
    assign Q = (sel) ? D1 : D2;
endmodule
