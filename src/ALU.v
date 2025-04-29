`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2025 06:55:33 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input clk,
    input rst,
    input [17:0] code,
    output start, 
    output flag_zero,
    output flag_overflow,
    output  [15:0] rez,
    output  [7:0] A,
    output  [7:0] Q,
    output [2:0] countBooth,
    output [2:0] countNRD,
    output [7:0] M,
    output [7:0] cs,
    output  count7Booth,
    output  count7NRD,
    output  Q1,
    output stop
);


wire [7:0] A_out_addsub;
wire [7:0] A_out_shiftLeft;
wire [7:0] Q_out_shiftLeft;

wire [7:0] A_out_shiftRight;
wire [7:0] Q_out_shiftRight;

wire [7:0] Q_load;
wire [15:0] rez_temp;
wire [1:0] opcode;

wire cout;
wire Q1_load;
wire Q1_shift;



reg [17:0] prev_code;


wire isMult = (opcode == 2'b10);
wire isDiv = (opcode == 2'b11);
wire countUpDiv = (isDiv) && (cs[2] || cs[3]);

ALU_ControlUnit ALU_ControlUnit_inst (
    .clk(clk),
    .rst(rst),
    .opcode(opcode),
    .cs(cs),
    .A_out_addsub(A_out_addsub),
    .A_out_shiftLeft(A_out_shiftLeft),
    .Q_out_shiftLeft(Q_out_shiftLeft),
    .A_out_shiftRight(A_out_shiftRight),
    .Q_out_shiftRight(Q_out_shiftRight),
    .Q_load(Q_load),
    .Q1_load(Q1_load),
    .Q1_shift(Q1_shift),
    .stop(stop),
    .code(code),
    .A(A),
    .Q(Q),
    .Q1(Q1),
    .rez(rez),
    .start(start)
);


Decode_Load Decode_Load_inst(
    .rst(rst),
    .code(code),
    .load(cs[1]),
    .Q1_in(1'b0),
    .Q_in(code[17:10]),
    .M_in(code[9:2]),
    .rez_in(code[17:2]),
    .opcode(opcode),
    .Q_out(Q_load),    
    .M_out(M),
    .rez_out(rez_temp),
    .Q1_out(Q1_load)
);


CLU CLU_inst(
.clk(clk),
.rst(rst),
.Q0(Q[0]),
.Q1(Q1),
.Asign(A[7]),
.opcode(opcode),
.count7(isMult ? count7Booth : count7NRD),
.cs(cs),
.stop(stop),
.start(start)
);

CLA_8 CLA_8_inst(
    .A(A),
    .B(M),
    .cin(1'b0),
    .enable_add(cs[2]),
    .enable_sub(cs[3]),
    .out(A_out_addsub),
    .cout(cout)
);

BoothShift BoothShift_inst(
    .rst(rst),
    .A_in(A),
    .Q_in(Q),    
    .enable(cs[4]),
    .A_out(A_out_shiftRight),
    .Q_out(Q_out_shiftRight),
    .Q1(Q1_shift) 
);

NRDShift NRDShift_inst(
.rst(rst),
.A_in(A),
.Q_in(Q),
.enable(cs[4]),
.A_out(A_out_shiftLeft),
.Q_out(Q_out_shiftLeft)
);


Counter Counter_inst(
.clk(clk),
.enable_booth(cs[4]),
.enable_nrd(cs[2] || cs[3]),
.rst(rst),
.countBooth(countBooth),
.countNRD(countNRD),
.count7Booth(count7Booth),
.count7NRD(count7NRD)
);


endmodule

