`timescale 1ns / 1ps


module top (
    input  wire        clk,        
    input  wire        rst,        
    input  wire [17:0] code,       


    output wire        start,  
    output wire        flag_zero,
    output wire        flag_overflow,


    output wire [15:0] rez,
    output wire [7:0]  A,
    output wire [7:0]  Q,
    output wire        Q1,
    output wire        stop,


    output wire [7:0]  cs,
    output wire [7:0]  M,
    output wire [2:0]  countBooth,
    output wire [2:0]  countNRD,
    output wire        count7Booth,
    output wire        count7NRD
);

  ALU alu_inst (
    .clk        (clk),
    .rst        (rst),
    .code       (code),
    .start      (start),
    .flag_zero  (flag_zero),
    .flag_overflow(flag_overflow),
    .rez        (rez),
    .A          (A),
    .Q          (Q),
    .countBooth (countBooth),
    .countNRD   (countNRD),
    .M          (M),
    .cs         (cs),
    .count7Booth(count7Booth),
    .count7NRD  (count7NRD),
    .Q1         (Q1),
    .stop       (stop)
  );

endmodule
