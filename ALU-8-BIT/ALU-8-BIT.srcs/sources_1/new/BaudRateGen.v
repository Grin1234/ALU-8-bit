// baud_rate_gen.v  - 50-MHz clk → 115 200-baud enables
module baud_rate_gen #(
    parameter integer CLK_FREQ = 50_000_000,
    parameter integer BAUD     = 115_200
)(
    input  wire clk_50m,
    input  wire rst,         // active-high, optional
    output wire rxclk_en,    // 16× oversample  (≈1.843 MHz)
    output wire txclk_en     // 1× baud strobe  (≈115.2 kHz)
);
    // ---------------------------------------------------------------------
    localparam integer RX_ACC_MAX = CLK_FREQ / (BAUD * 16);   // 27
    localparam integer TX_ACC_MAX = CLK_FREQ /  BAUD;         // 434

    localparam integer RXW = $clog2(RX_ACC_MAX);
    localparam integer TXW = $clog2(TX_ACC_MAX);

    reg [RXW-1:0] rx_acc = 0;
    reg [TXW-1:0] tx_acc = 0;

    assign rxclk_en = (rx_acc == 0);    // 1-clk-wide pulse
    assign txclk_en = (tx_acc == 0);

    always @(posedge clk_50m) begin
        if (rst || rx_acc == RX_ACC_MAX-1)
            rx_acc <= 0;
        else
            rx_acc <= rx_acc + 1'b1;

        if (rst || tx_acc == TX_ACC_MAX-1)
            tx_acc <= 0;
        else
            tx_acc <= tx_acc + 1'b1;
    end
endmodule