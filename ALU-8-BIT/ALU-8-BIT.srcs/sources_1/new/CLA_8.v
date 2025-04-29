module CLA_8(
    input wire [7:0] A,
    input wire [7:0] B,
    input wire cin,
    input wire enable_add,
    input wire enable_sub,
    output wire [7:0] out,
    output wire cout
);

wire o_cout;
wire [3:0] o1_out;
wire [3:0] o2_out;

wire cin_int;
wire [7:0] B_int;

assign B_int = (enable_sub) ? ~B : B;
assign cin_int = (enable_sub) ? 1'b1 : 1'b0;

CLA_4 CLA_4_inst1(
    .A(A[3:0]),
    .B(B_int[3:0]),
    .cin(cin_int),
    .out(o1_out),
    .cout(o_cout)
);    

CLA_4 CLA_4_inst2(
    .A(A[7:4]),
    .B(B_int[7:4]),
    .cin(o_cout),
    .out(o2_out),
    .cout(cout)
);

assign out = (enable_add || enable_sub) ? {o2_out, o1_out} : 8'b0;

endmodule
