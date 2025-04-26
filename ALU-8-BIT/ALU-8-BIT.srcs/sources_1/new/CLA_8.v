`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2025 06:49:53 PM
// Design Name: 
// Module Name: CLA_8
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


module CLA_8(
    input wire [7:0] A,
    input wire [7:0] B,
    input wire cin,
    output wire [7:0] out,
    output wire cout
    );
wire o_cout;
wire [3:0]o1_out;
wire [3:0]o2_out;

CLA_4 CLA_4_inst1(
.A(A[3:0]),
.B(B[3:0]),
.cin(cin),
.out(o1_out),
.cout(o_cout)
);    

CLA_4 CLA_4_inst2(
.A(A[7:4]),
.B(B[7:4]),
.cin(o_cout),
.out(o2_out),
.cout(cout)
);

assign out = {o2_out, o1_out};

    
endmodule
