`timescale 1ns/100ps

module light_chaser_tb;

reg        clk;
reg        rst;
reg        Hold;
wire [3:0] out;

light_chaser tb_light
(
.clk(clk),
.rst(rst),
.Hold(Hold),
.out(out)
);

always #5 clk = ~ clk ;

initial begin
  clk  = 0;
  rst  = 0;
  Hold = 0;  //reset active 
  #10;
  rst = 1; //reset not active
  #20;
  Hold = 1;
  #10;
  Hold = 0;
  #20;
  rst = 0;
  #10;
  rst = 1;
  #20;
  $stop; 
end 
endmodule