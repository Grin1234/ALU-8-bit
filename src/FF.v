`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Georgescu Catalin
// 
// Create Date: 04/26/2025 04:26:04 PM
// Design Name: Flip-Flop
// Module Name: Flip-Flop
// Project Name: ALU-8-BIT
// Target Devices: Register
// Tool Versions: 
// Description: Flip Flop pentru Registers
// 
// Dependencies: Registers
// 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module FF(
    input wire clk, // clock
    input wire rst, // reset
    input wire D, // in 
    output reg Q
    );
    
always @(posedge clk, posedge rst)
begin
    if(rst)
       Q <= 0;
       else
       Q <= D;
end

endmodule
