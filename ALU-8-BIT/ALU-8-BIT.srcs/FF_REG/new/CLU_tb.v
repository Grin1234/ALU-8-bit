`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Georgescu Catalin
// 
// Create Date: 04/27/2025 08:55:16 PM
// Design Name: CLU
// Module Name: CLU_tb
// Project Name: ALU-8-BIT
// Target Devices: 
// Tool Versions: 
// Description: Testbench for Control Logic Unit (CLU)
// 
//////////////////////////////////////////////////////////////////////////////////

module CLU_tb;


    reg clk;
    reg rst;
    reg Q0;
    reg Q1;
    reg [1:0] opcode;
    reg count7;


    wire [5:0] cs;
    wire stop;


    CLU uut (
        .clk(clk),
        .rst(rst),
        .Q0(Q0),
        .Q1(Q1),
        .opcode(opcode),
        .count7(count7),
        .cs(cs),
        .stop(stop)
    );


    always begin
        #5 clk = ~clk; 
    end


    initial begin

        clk = 0;
        rst = 0;
        Q0 = 0;
        Q1 = 0;
        opcode = 2'b00;  
        count7 = 0;
        

        rst = 1; 
        #10;
        rst = 0; 
        

        opcode = 2'b00; 
        #20; 
        

        rst = 1;
        #5;
        rst = 0;
        opcode = 2'b01; 
        #20;

         rst = 1;
        #5;
        rst = 0;
        opcode = 2'b10;
        Q0 = 1;
        Q1 = 0; 
        #20;
        
        Q0 = 0;
        Q1 = 1;
        #100;

        Q0 = 1;
        Q1 = 1; 
        #20;

        opcode = 2'b11;
        count7 = 1; 
        #20;
        
        count7 = 0; 
        #20;
        

        #20;
        opcode = 2'b00; 
        #20;
        $stop;
    end

    initial begin
        $monitor("At time %t, cs = %b, stop = %b", $time, cs, stop);
    end

endmodule
