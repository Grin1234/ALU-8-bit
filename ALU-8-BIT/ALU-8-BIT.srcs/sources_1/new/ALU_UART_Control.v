`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/28/2025 08:41:25 AM
// Design Name: 
// Module Name: ALU_UART_Control
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


`timescale 1ns / 1ps

module ALU_UART_Control(
    input clk,
    input rst,
    input [7:0] rx_data,
    input rx_valid,
    input tx_busy,
    input [15:0] rez,
    output reg [17:0] code,
    output reg send,
    output reg [7:0] tx_data
);

// FSM states
localparam IDLE  = 3'b000;
localparam LOAD1 = 3'b001;
localparam LOAD2 = 3'b010;
localparam LOAD3 = 3'b011;
localparam WAIT_ALU = 3'b100;
localparam SEND1 = 3'b101;
localparam SEND2 = 3'b110;

reg [2:0] state;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        state <= IDLE;
        send <= 0;
        code <= 0;
        tx_data <= 0;
    end else begin
        send <= 0; 

        case (state)
            IDLE: begin
                if (rx_valid) begin
                    code[17:10] <= rx_data;
                    state <= LOAD1;
                end
            end

            LOAD1: begin
                if (rx_valid) begin
                    code[9:2] <= rx_data;
                    state <= LOAD2;
                end
            end

            LOAD2: begin
                if (rx_valid) begin
                    code[1:0] <= rx_data[1:0];
                    state <= WAIT_ALU;
                end
            end

            WAIT_ALU: begin
                // Wait 1 cycle
                state <= SEND1;
            end

            SEND1: begin
                if (!tx_busy) begin
                    send <= 1;
                    tx_data <= rez[15:8];
                    state <= SEND2;
                end
            end

            SEND2: begin
                if (!tx_busy) begin
                    send <= 1;
                    tx_data <= rez[7:0];
                    state <= IDLE;
                end
            end

            default: state <= IDLE;
        endcase
    end
end

endmodule

