
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2025 04:38:34 PM
// Design Name: 
// Module Name: FF_tb
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


module FF_tb;

    reg clk;
    reg rst;
    reg D;
    wire Q;
    
    FF uut(
        .clk(clk),
        .rst(rst),
        .D(D),
        .Q(Q)
    );
    
    always begin
        #5 clk = ~clk;
    end

    initial begin
        clk = 0;
        rst = 0;
        D = 0;
        
        #10 rst = 1;
        #10 rst = 0;
        
        #10 D = 1;
        #10 D = 0;
        #10 D = 1;
        #10 D = 0;
        
        #10 rst = 1;
        #10 rst = 0;
        
        #20 $finish;
        
end       

initial begin
    $monitor("Time = %0t, rst = %b, D = %b, Q = %B", $time, rst, D, Q);
end
  
        
endmodule
