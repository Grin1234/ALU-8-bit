`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2025 08:54:17 PM
// Design Name: 
// Module Name: Decode_Load
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


module Decode_Load(
    input rst,
    input wire [17:0] code,
    input wire load,
    input wire Q1_in,
    input wire [7:0]Q_in,
    input wire [7:0]M_in,
    input wire [15:0]rez_in,
    output [1:0] opcode,
    output  [7:0] Q_out,
    output  [7:0] M_out,
    output  [15:0] rez_out,
    output reg [7:0] A,
    output Q1_out
    );
    
    
    assign opcode = code[1:0];
    
    
RegisterN #(
        .WIDTH(8)  
    ) Q_inst(
        .clk(load),
        .rst(rst),
        .D(Q_in),
        .Q(Q_out)
    );
    
    RegisterN #(
        .WIDTH(8)  
    ) M_inst(
        .clk(load),
        .rst(rst),
        .D(M_in),
        .Q(M_out)
    );
    
    RegisterN #(
        .WIDTH(16)  
    ) rez_inst(
        .clk(load),
        .rst(rst),
        .D(rez_in),
        .Q(rez_out)
    );
    
RegisterN #(
        .WIDTH(1)  
    ) Q1_inst(
        .clk(load),
        .rst(rst),
        .D(Q1_in),
        .Q(Q1_out)
    );

endmodule