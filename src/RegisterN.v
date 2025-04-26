`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Georgescu Catalin
// 
// Create Date: 04/26/2025 04:26:04 PM
// Design Name: Register
// Module Name: Register
// Project Name: ALU-8-BIT
// Target Devices: Register
// Tool Versions: 
// Description: Register using Flip Flops N bits
// 
// Dependencies: FF
// 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module RegisterN #(
    parameter WIDTH = 8
)
(  
    input wire clk,
    input wire rst,
    input wire [WIDTH-1:0]D,
    output wire [WIDTH-1:0]Q
 );
 
 genvar i;
 
 generate
    for(i = 0; i < WIDTH; i = i +1 ) begin: regBits // sa identific daca e o problema la un flip flop
        FF ff_inst(
            .clk(clk),
            .rst(rst),
            .D(D[i]),
            .Q(Q[i])
        );
        end
        
 endgenerate
 
    
endmodule
