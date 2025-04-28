`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Georgescu Catalin

// 
// Create Date: 04/27/2025 03:48:29 PM
// Design Name: 
// Module Name: LRShift
// Project Name: ALU-8BIT
// Target Devices: 
// Tool Versions: 
// Description: Left/Right Shifter
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module LRShift #(
parameter WIDTH = 8)(
    input [WIDTH -1: 0] in,
    input val,  // valoarea care o sa fie shiftata
    input left_shift,
    input right_shift,
    output reg [WIDTH -1: 0] out
    );
    
    always @(*)
    begin
    if(left_shift)
        out = { in[WIDTH -2 : 0], val};
    else if(right_shift)
        out = { val, in[WIDTH-1 : 1]};
        else
        out = in;
    end
endmodule
