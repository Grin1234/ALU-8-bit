`timescale 1ns/1ps

module BoothShift_tb;

    parameter WIDTH = 8;

    reg clk;
    reg rst;
    reg enable;
    
 
    reg [WIDTH-1:0] A_in_reg;
    reg [WIDTH-1:0] Q_in_reg;
    
    wire [WIDTH-1:0] A_out;
    wire [WIDTH-1:0] Q_out;
    wire Q1;


    assign A_out = A_in_reg;
    assign Q_out = Q_in_reg;


    BoothShift #(
        .WIDTH(WIDTH)
    ) dut (
        .clk(clk),
        .rst(rst),
        .A_in(A_out),  
        .Q_in(Q_out),
        .enable(enable),
        .A_out(A_out),
        .Q_out(Q_out),
        .Q1(Q1)
    );

    always begin
        #5 clk = ~clk;
    end

    initial begin

        clk = 0;
        rst = 1;
        enable = 0;
        A_in_reg = 8'b0;
        Q_in_reg = 8'b0;


        #10;
        rst = 0;


        #10;
        A_in_reg = 8'b10101010; 
        Q_in_reg = 8'b11001100;
        enable = 1;

    
        #20;
        
     
        enable = 0;

        #10;
        
 
        A_in_reg = 8'b11110000;
        Q_in_reg = 8'b00001111;
        enable = 1;

        #20;

       
        $stop;
    end

endmodule
