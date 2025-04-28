`timescale 1ns / 1ps

module Decode_Load_tb;

    
    reg rst;
    reg [17:0] code;  
    reg load;
    reg Q1_in;
    reg [7:0] Q_in, M_in;
    reg [15:0] rez_in;
    wire [1:0] opcode;
    wire [7:0] Q_out, M_out;
    wire [15:0] rez_out;
    wire [7:0] A;
    wire Q1_out;


    Decode_Load decode_load_inst (
        .rst(rst),
        .code(code),
        .load(load),
        .Q1_in(Q1_in),
        .Q_in(Q_in),
        .M_in(M_in),
        .rez_in(rez_in),
        .opcode(opcode),
        .Q_out(Q_out),
        .M_out(M_out),
        .rez_out(rez_out),
        .A(A),
        .Q1_out(Q1_out)
    );

   
    always begin
        #5 load = ~load;  
    end


    initial begin
        load = 0;
        rst = 0;
        code = 18'b0;
        Q1_in = 0;
        Q_in = 8'b0;
        M_in = 8'b0;
        rez_in = 16'b0;
        #10 rst = 1;  
        #10 rst = 0; 


        #10 code = 18'b000010100000010100; 
        #10 Q_in = 8'b00001010;  
        #10 M_in = 8'b00000101; 
        #10 rez_in = 16'b0000000000000000; 

       
        #10 load = 1; 
        #10 load = 0;  

        #10 code = 18'b000010100000010101; 
        #10 Q_in = 8'b00001010;  
        #10 M_in = 8'b00000101; 
        #10 rez_in = 16'b0000000000000000; 
        #10 load = 1; 
        #10 load = 0;  

       
        #10 code = 18'b000010100000101010; 
        #10 Q_in = 8'b00001010;  
        #10 M_in = 8'b00000101;  
        #10 rez_in = 16'b0000000000000000; 
        #10 load = 1; 
        #10 load = 0;  

     
        #100 $finish;
    end

  
    initial begin
        $monitor("At time %t, Q = %h, M = %h, opcode = %b, A = %h, Q1_in = %b, Q1_out = %b, rez_out = %h",
                    $time, Q_in, M_in, opcode, A, Q1_in, Q1_out, rez_out);
    end
endmodule
