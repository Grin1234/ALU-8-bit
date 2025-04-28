`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2025 04:07:04 PM
// Design Name: 
// Module Name: LRShift_tb
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


module LRShift_tb;

    reg [7:0] in;
    reg val;
    reg left_shift;
    reg right_shift;
    wire [7:0]out;


LRShift LRShift_inst(
.in(in),
.val(val),
.left_shift(left_shift),
.right_shift(right_shift),
.out(out)
);



initial begin
    in = 0;
    val = 1;
    right_shift = 0;
    left_shift = 0;
    
    #10
    in = 16;
    
    #10
    left_shift = 1;
    
    #10
    left_shift = 0;
    
    
    #10
    right_shift = 1;
    
    
    #10 $finish;
end


endmodule
