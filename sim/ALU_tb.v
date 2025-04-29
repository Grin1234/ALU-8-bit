`timescale 1ns / 1ps

module ALU_tb;

reg clk, rst;
reg [17:0] code;
wire flag_zero, flag_overflow;
wire [15:0] rez;
wire [7:0] Q, M, A;
wire [7:0] cs;
wire start;
wire [2:0] countBooth;
wire [2:0] countNRD;
wire Q1;
wire count7Booth;
wire count7NRD;


ALU alu_inst (
    .clk(clk),
    .rst(rst),
    .code(code),
    .flag_zero(flag_zero),
    .flag_overflow(flag_overflow),
    .rez(rez),
    .A(A),
    .M(M),
    .Q(Q),
    .cs(cs),
    .countBooth(countBooth),
    .countNRD(countNRD),
    .count7Booth(count7Booth),
    .count7NRD(count7NRD),
    .Q1(Q1),
    .start(start)
);


always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;
    code = 0;
    #10 rst = 0;

    #10 code = 18'b000010100000010100; // 10 + 5

    #100;

    #10 rst = 1; #10 rst = 0;
    #10 code = 18'b000010100000010101; // 10 - 5

    #100;

    #10 rst = 1; #10 rst = 0;
    #10 code = 18'b000010100000010110; // 10 * 5

    #250;
    
    #10 rst = 1; #10 rst = 0;
    #10 code = 18'b000010100000010111; // 10 / 5
    
    
    #500;
    
    $finish;
end

initial begin
    $monitor("Time=%0t A=%h Q=%h M=%h rez=%h cs=%b count=%d", $time, A, Q, M, rez, cs, countNRD);
end

endmodule
