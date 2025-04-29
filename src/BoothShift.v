module BoothShift #(
    parameter WIDTH = 8
)(
    input  wire [WIDTH-1:0] A_in,
    input  wire [WIDTH-1:0] Q_in,
    input  wire             rst,
    input  wire             enable,
    output wire [WIDTH-1:0] A_out,
    output wire [WIDTH-1:0] Q_out,
    output wire             Q1
);

  assign Q1 = Q_in[0];

  wire [WIDTH-1:0] shiftA = { A_in[WIDTH-1], A_in[WIDTH-1:1]};
  wire [WIDTH-1:0] shiftQ = { A_in[0], Q_in[WIDTH-1:1]};
  wire [WIDTH-1:0] zero   = {WIDTH{1'b0} };
  wire [1:0] sel = {rst, enable};

  Mux4N #
  (.WIDTH(WIDTH))
   muxA (
    .sel(sel),
    .D1(A_in),
    .D2(shiftA),
    .D3(zero),
    .D4(zero),
    .Q(A_out)
  );

  Mux4N #(.WIDTH(WIDTH))
  muxQ (
    .sel(sel),
    .D1(Q_in),
    .D2(shiftQ),
    .D3(zero),
    .D4(zero),
    .Q(Q_out)
  );

endmodule