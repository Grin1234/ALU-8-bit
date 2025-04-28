`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/28/2025 04:31:05 AM
// Design Name: 
// Module Name: NRDShift
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


module NRDShift #(
    parameter WIDTH = 8
)(
    input wire rst,
    input wire [WIDTH-1:0] A_in,
    input wire [WIDTH-1:0] Q_in,
    input wire enable,
    output reg [WIDTH-1:0] A_out,
    output reg [WIDTH-1:0] Q_out
);

always @(*) begin
    if (rst) begin
        A_out = 0;
        Q_out = 0;
    end else if (enable) begin
        A_out = {A_in[WIDTH-2:0], Q_in[WIDTH-1]};
        Q_out = {Q_in[WIDTH-2:0], 1'b0};
    end else begin
        A_out = A_in;
        Q_out = Q_in;
    end
end

endmodule

