`timescale 1ns / 1ps

module ALU_ControlUnit(
    input clk,
    input rst,
    input [1:0] opcode,
    input [7:0] cs,
    input [7:0] A_out_addsub,
    input [7:0] A_out_shiftLeft,
    input [7:0] Q_out_shiftLeft,
    input [7:0] A_out_shiftRight,
    input [7:0] Q_out_shiftRight,
    input [7:0] Q_load,
    input Q1_load,
    input Q1_shift,
    input stop,
    input [17:0] code,
    output reg [7:0] A,
    output reg [7:0] Q,
    output reg Q1,
    output reg [15:0] rez,
    output reg start
);

reg [17:0] prev_code;
wire isMult = (opcode == 2'b10);
wire isDiv  = (opcode == 2'b11);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        prev_code <= 18'b0;
        start <= 0;
        A <= 8'b0;
        Q <= 8'b0;
        rez <= 16'b0;
        Q1 <= 0;
    end else begin
        if (code != prev_code)
            start <= 1;
        else if (stop)
            start <= 0;

        prev_code <= code;

        if (cs[1] && (opcode == 2'b00 || opcode == 2'b01)) begin
        A <= Q_load;
        end
    
        if (cs[1]) begin
            Q <= Q_load;
            Q1 <= Q1_load;
        end 
        else if (cs[2] || cs[3]) begin
            A <= A_out_addsub;
            if (isDiv) begin
              if (A_out_addsub[7] == 1'b0)
                 Q[0] <= 1'b1; 
                else
                 Q[0] <= 1'b0; 
            end
        end 
        else if (cs[4]) begin
            if (isMult) begin
                A <= A_out_shiftRight;
                Q <= Q_out_shiftRight;
                Q1 <= Q1_shift;
            end else if (isDiv) begin
                A <= A_out_shiftLeft;
                Q <= Q_out_shiftLeft;
            end
        end

        if (cs[5]) begin
            if (opcode == 2'b00 || opcode == 2'b01) begin
                rez <= {{8{A[7]}}, A};
            end else if (opcode == 2'b10) begin
                Q[0] <= 0; 
                rez <= {A, Q};
            end else if (opcode == 2'b11) begin
                rez <= {A, Q};
            end
        end
    end
end

endmodule
