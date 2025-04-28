`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2025
// Design Name: Universal Counter
// Module Name: Counter
// Project Name: ALU
// Target Devices: 
// Tool Versions: 
// Description: General counter for Booth and NRD
//////////////////////////////////////////////////////////////////////////////////

module Counter(
    input clk,
    input rst,
    input enable_booth,
    input enable_nrd,
    output reg [2:0] countBooth,
    output reg [2:0] countNRD,
    output reg count7Booth,
    output reg count7NRD
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        countBooth <= 0;
        countNRD <= 0;
        count7Booth <= 0;
        count7NRD <= 0;
    end else begin
        // Booth Counter
        if (enable_booth) begin
            if (countBooth == 3'b111) begin
                count7Booth <= 1;
                countBooth <= 0;
            end else begin
                countBooth <= countBooth + 1;
                count7Booth <= 0;
            end
        end
        
        // NRD Counter
        if (enable_nrd) begin
            if (countNRD == 3'b110) begin
                count7NRD <= 1;
                countNRD <= 0;
            end else begin
                countNRD <= countNRD + 1;
                count7NRD <= 0;
            end
        end
    end
end

endmodule
