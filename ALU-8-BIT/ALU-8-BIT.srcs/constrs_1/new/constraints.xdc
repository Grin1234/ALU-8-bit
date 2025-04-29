set_property -dict { PACKAGE_PIN C4 IOSTANDARD LVCMOS33 } [get_ports rx]; # RX
set_property -dict { PACKAGE_PIN D4 IOSTANDARD LVCMOS33 } [get_ports UART_TXD]; # TX
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk];
set_property -dict { PACKAGE_PIN E3 IOSTANDARD LVCMOS33 } [get_ports clk];

# Reset button
set_property -dict { PACKAGE_PIN M18 IOSTANDARD LVCMOS33 } [get_ports rst_n]

set_property -dict { PACKAGE_PIN J15 IOSTANDARD LVCMOS33 } [get_ports sw_0];
set_property -dict { PACKAGE_PIN L16 IOSTANDARD LVCMOS33 } [get_ports sw_1];