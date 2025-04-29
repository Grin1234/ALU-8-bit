`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2025 07:03:11 PM
// Design Name: 
// Module Name: CLA_tb
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


module CLA_tb;

 localparam WIDTH = 8;
 
    reg [WIDTH -1:0] A;
    reg [WIDTH -1:0] B;
    
    reg cin;
    wire [WIDTH-1:0] out;
    wire cout;
    
    reg ena, enb;
    
    
    CLA_8 CLA_8_inst(
    .A(A),
    .B(B),
    .cin(cin),
    .out(out),
    .cout(cout),
    .enable_add(ena),
    .enable_sub(enb)
    );
    
    initial begin
        A = 0;
        B = 0;
        cin = 0;
        ena = 1;
        enb = 0;
        
        #20;
    
        A = 12;
        B = 6;
        
        #20
        
        A = 8;
        B = 5;
        
        #20
        
        A = 0;
        B = 0;
        
        
     #20 $finish;
end



endmodule
