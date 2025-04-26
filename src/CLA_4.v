`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Georgescu Catalin
// 
// Create Date: 04/26/2025 06:38:49 PM
// Design Name: 
// Module Name: CLA_4
// Project Name: ALU-8-BIT
// Target Devices: 
// Tool Versions: 
// Description: Carry Look Ahead Adder 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module CLA_4(
    input wire [3:0] A,
    input wire [3:0] B,
    input wire cin,
    output wire[3:0] out,
    output wire cout
    );
    
wire p0, p1, p2, p3, g0, g1, g2, g3;
wire c1, c2, c3, c4;

assign p0 = A[0] ^ B[0],
       p1 = A[1] ^ B[1],
       p2 = A[2] ^ B[2],
       p3 = A[3] ^ B[3];
  
assign g0 = A[0] & B[0],
       g1 = A[1] & B[1],
       g2 = A[2] & B[2],
       g3 = A[3] & B[3];
       
assign c1 = g0 | (p0 & cin),
       c2 = g1 | (p1 & g0) | (p1 & p0 & cin),
       c3 = g2 | (p2 & g1) | (p2 & p1 & g0) | (p2 & p1 & p0 & cin),
       c4 = g3 | (p3 & g2) | (p3 & p2 & g1) | (p3 & p2 & p1 & g0) | (p3 & p2 & p1 & p0 & cin);
       
assign out[0] = p0 ^ cin,
       out[1] = p1 ^ c1,
       out[2] = p2 ^ c2,
       out[3] = p3 ^ c3;
    
assign cout = c4;
    
endmodule
