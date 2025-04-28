module BoothShift #(
    parameter WIDTH = 8
)(
    input wire rst,
    input wire [WIDTH-1:0] A_in,
    input wire [WIDTH-1:0] Q_in,
    input wire enable,
    output reg [WIDTH-1:0] A_out,
    output reg [WIDTH-1:0] Q_out,
    output wire Q1
);

assign Q1 = Q_in[0];

always @(*) begin
    if (rst) begin
        A_out = 0;
        Q_out = 0;
    end else if (enable) begin
        A_out = {A_in[WIDTH-1], A_in[WIDTH-1:1]}; 
        Q_out = {A_in[0], Q_in[WIDTH-1:1]};     
    end else begin
        A_out = A_in;
        Q_out = Q_in;
    end
end


endmodule
