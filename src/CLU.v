`timescale 1ns / 1ps

module CLU(
    input  wire        clk,
    input  wire        rst,
    input  wire        Q0,
    input  wire        Q1,
    input  wire        Asign,
    input  wire        start,
    input  wire [1:0]  opcode,
    input  wire        count7,
    output wire [7:0]  cs,
    output wire        stop
);
  // op code sa zicem: 
  // 00 - adaugare
  // 01 - scadere
  // 10 - inmultire
  // 11 - impartire


      parameter INIT = 8'b00000000;
      parameter LOAD = 8'b00000010;
      parameter ADD = 8'b00000100;
      parameter SUBSTRACT = 8'b00001000;
      parameter RSHIFT = 8'b00010000;
      parameter OUTPUT   = 8'b00100000;
      parameter WAIT_AFTER_LOAD= 8'b01000000;
      parameter WAIT_AFTER_OP   = 8'b10000000;
    
 
  wire [7:0] state;
  wire [7:0] next_state;
  
  wire [7:0] d_state;
  wire nstart = ~start;

   Mux2N #(.WIDTH(8)) state_mux(
    .sel(start),
    .D1(next_state),
    .D2(state),
    .Q(d_state)
  );

    RegisterN #(.WIDTH(8)) state_reg (
    .clk(clk),
    .rst(rst),
    .D(d_state),
    .Q(state)
  );
  
  assign cs = state;

   Mux2N #(.WIDTH(1)) stop_mux(
    .sel(state[5]),
    .D1(1'b1),
    .D2(stop),
    .Q(next_stop)
  );
  
  FF stop_ff (
    .clk(clk),
    .rst(rst),
    .D(next_stop),
    .Q(stop)
  );

  wire init_s    = (state == INIT);
  wire load_s    = state[1];
  wire add_s     = state[2];
  wire sub_s     = state[3];
  wire rsh_s     = state[4];
  wire wait_ld_s = state[6];
  wire wait_op_s = state[7];

  wire op0 = ~opcode[1] & ~opcode[0];  // 00 - adunare
  wire op1 = ~opcode[1] &  opcode[0];  // 01 - scadere
  wire op2 =  opcode[1] & ~opcode[0];  // 10 -inmultire
  wire op3 =  opcode[1] &  opcode[0];  // 11 -impartire

  wire q01    = ~Q0 &  Q1;  // {Q0,Q1} - 01 - adunare
  wire q10    =  Q0 & ~Q1;  // {Q0,Q1} - 10 - scadere
  wire q_else = ~(q01 | q10);

  assign next_state[0] = 1'b0;
  assign next_state[1] = init_s & ~stop;
  assign next_state[6] = load_s;
  assign next_state[2] = (wait_ld_s & op0) | (wait_ld_s & op2 & q01) | (wait_op_s & op2 & ~count7 & q01) | (wait_op_s & op3 & ~count7 & Asign);
  assign next_state[3] =(wait_ld_s & op1)| (wait_ld_s & op2 & q10)| (wait_op_s & op2 & ~count7 & q10)| (wait_op_s & op3 & ~count7 & ~Asign);
  assign next_state[4] = (wait_ld_s & op2 & q_else) | (wait_ld_s & op3) | (add_s & (op2 | (op3 & ~count7)))| (sub_s     & (op2 | (op3 & ~count7))) | (wait_op_s & op2 & ~count7 & q_else);
  assign next_state[7] = rsh_s;
  assign next_state[5] = (add_s & (op0 | op1 | (op3 & count7)))| (sub_s  & (op0 | op1 | (op3 & count7))) | (wait_op_s & (op0 | op1 | (op2 & count7) | (op3 & count7)));

endmodule
