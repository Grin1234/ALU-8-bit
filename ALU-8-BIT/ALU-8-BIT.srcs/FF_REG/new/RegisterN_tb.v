
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2025 04:58:36 PM
// Design Name: 
// Module Name: RegisterN_tb
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


module RegisterN_tb;
    
localparam WIDTH = 8;
    
    reg clk;
    reg rst;
    reg [WIDTH -1: 0]D;
    wire [WIDTH -1: 0]Q;
    
    RegisterN RegisterN_inst(
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
        D = 8'b0;
        
        #10 rst = 1;
        #10 rst = 0;
        
        #10 D = 16;
        #10 D = 0;
        #10 D = 8;
        #10 D = 0;        
    
        #10 rst = 0;
        #10 rst = 1;
    
        #20 $finish;
    end
    
    initial begin
    $monitor("Time: %t, rst = %b, D = %b, Q = %b", $time, rst, D, Q);
    end
    
endmodule
