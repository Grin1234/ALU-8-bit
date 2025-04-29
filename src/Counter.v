`timescale 1ns / 1ps


module Counter(
    input clk,
    input rst,
    input enable_booth,
    input enable_nrd,
    output reg [2:0] countBooth,
    output reg [2:0] countNRD,
    output reg count7Booth,
    output reg count7NRD
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
      countBooth <= 0;
      countNRD <= 0;
     count7Booth <= 0;
     count7NRD <= 0;
    end else begin
        if (enable_booth) begin
            if (countBooth == 3'b111) begin
             count7Booth <= 1;
             countBooth <= 0;
            end else begin
              countBooth <= countBooth + 1;
              count7Booth <= 0;
            end
        end
        if (enable_nrd) begin
            if (countNRD == 3'b110) begin
            count7NRD <= 1;
          countNRD <= 0;
            end else begin
            countNRD <= countNRD + 1;
             count7NRD <= 0;
            end
        end
    end
end

endmodule
