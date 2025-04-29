`timescale 1ns/1ps

module BoothShift_tb;
    parameter WIDTH = 8;

    reg                  rst;
    reg                  enable;
    reg  [WIDTH-1:0]     A_in_reg;
    reg  [WIDTH-1:0]     Q_in_reg;

    wire [WIDTH-1:0]     A_out;
    wire [WIDTH-1:0]     Q_out;
    wire                 Q1;

    BoothShift #(.WIDTH(WIDTH)) dut (
        .rst    (rst),
        .enable (enable),
        .A_in   (A_in_reg),
        .Q_in   (Q_in_reg),
        .A_out  (A_out),
        .Q_out  (Q_out),
        .Q1     (Q1)
    );

    initial begin

        rst = 1; enable = 0; A_in_reg = 0; Q_in_reg = 0;
        #10 rst = 0;


        #10 A_in_reg = 8'b10101010; 
            Q_in_reg = 8'b11001100;
            enable   = 1;
        #20 enable = 0;


        #10 A_in_reg = 8'b11110000;
            Q_in_reg = 8'b00001111;
            enable   = 1;
        #20 $stop;
    end
endmodule
