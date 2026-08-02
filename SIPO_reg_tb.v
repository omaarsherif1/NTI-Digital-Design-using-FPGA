`timescale 1ns/100ps

module SIPO_reg_tb;

reg d;
reg clk;
reg rst;
wire [3:0] out;

SIPO_reg R0(
.d(d),
.rst(rst),
.clk(clk),
.out(out)
);

always #5 clk = ~clk; // clock period 10ns

initial begin
  clk = 0;
  d = 0;
  rst = 0; // rst active
  
  @(negedge clk) rst = 1;
  
  @(negedge clk) d = 1; // expected out = 4'b0001
  @(negedge clk) d = 0; // expected out = 4'b0010
  @(negedge clk) d = 1; // expected out = 4'b0101
  @(negedge clk) d = 1; // expected out = 4'b1011
  
  @(negedge clk) rst = 0; // expected out = 4'b0000
  @(negedge clk) rst =1; // expected out = 4'b0000
  
  @(negedge clk);
  $stop;
end
endmodule