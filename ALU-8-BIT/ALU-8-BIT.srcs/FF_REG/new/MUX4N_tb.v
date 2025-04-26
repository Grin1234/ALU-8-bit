`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2025 05:26:21 PM
// Design Name: 
// Module Name: MUX2N_tb
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


module MUX4N_tb;

localparam WIDTH = 8;

    reg clk;
    reg rst;
    
    reg [WIDTH -1: 0]D1;
    wire [WIDTH -1: 0]Q1;
    
    reg [WIDTH -1: 0]D2;
    wire [WIDTH -1: 0]Q2;
    
    reg [WIDTH -1: 0]D1;
    wire [WIDTH -1: 0]Q1;
    
    reg [WIDTH -1: 0]D3;
    wire [WIDTH -1: 0]Q3;
    
    reg [WIDTH -1: 0]D4;
    wire [WIDTH -1: 0]Q4;
    
    
    wire [WIDTH -1: 0] OUT;
    reg [1:0]sel;
    
    Mux4N MUX4N_inst(
        .sel(sel),
        .D1(D1),
        .D2(D2),
        .D3(D3),
        .D4(D4),
        .Q(OUT)
    );
    
    RegisterN RegisterN_inst1(
    .clk(clk),
    .rst(rst),
    .D(D1),
    .Q(Q1)
    );
    
 
    RegisterN RegisterN_inst2(
    .clk(clk),
    .rst(rst),
    .D(D2),
    .Q(Q2)
    );
    
     RegisterN RegisterN_inst3(
    .clk(clk),
    .rst(rst),
    .D(D3),
    .Q(Q3)
    );
    
     RegisterN RegisterN_inst4(
    .clk(clk),
    .rst(rst),
    .D(D3),
    .Q(Q4)
    );
    
    

    
    always begin
        #5 clk = ~clk;
    end
    
    
      initial begin
        clk = 0;
        rst = 0;
        sel = 0;
        D1 = 8'b0;
        D2 = 8'b0;
        D3 = 8'b0;
        D4 = 8'b0;
        
        #10 rst = 1;
        #10 rst = 0;
        
        #10 D1 = 16;
        #10 D2 = 8;  
        #10 D3 = 9;
        #10 D4 = 23;    
        
        #10 sel = 1;
        #10 sel = 2;
        #10 sel = 3;
    
    
        #20 $finish;
    end
    
    initial begin
    $monitor("Time: %t, rst = %b, D1 = %b, D2 = %b, Q = %b, sel = %b", $time, rst, D1, D2, OUT, sel);
    end
    
endmodule
