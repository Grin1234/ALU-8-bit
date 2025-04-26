`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2025 05:38:38 PM
// Design Name: 
// Module Name: Mux4N
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


module Mux4N #(
    parameter WIDTH = 8
)(
    input wire [1:0] sel,
    input wire [WIDTH -1:0] D1,
    input wire [WIDTH -1:0] D2,
    input wire [WIDTH -1:0] D3,
    input wire [WIDTH -1:0] D4,
    output reg [WIDTH -1:0] Q
    );

always @(*) begin
    case(sel)
        2'b00 : Q = D1;
        2'b01 : Q = D2;
        2'b10 : Q = D3;
        2'b11 : Q = D4;
        default : Q = D1;
    endcase
 end
    

endmodule
