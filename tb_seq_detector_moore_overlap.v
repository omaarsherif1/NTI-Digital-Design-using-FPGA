`timescale 1ns / 100ps
module tb_seq_detector_moore_overlap;

reg clk;
reg reset;
reg x;
wire y;

seq_detector_moore_overlap DUT(.*);

always #5 clk = ~clk;

initial 
begin
clk = 0; reset = 0; x = 1;
	@(negedge clk) reset = 1;
	@(negedge clk) x = 1;
	@(negedge clk) x = 0;
	@(negedge clk) x = 1;
	@(negedge clk) x = 0;
	@(negedge clk) x = 1;
	@(negedge clk) x = 1;
	@(negedge clk) x = 0;
	@(negedge clk) x = 1;
	@(negedge clk) x = 0;
	@(negedge clk) x = 1;
	@(negedge clk) reset = 0;
	@(negedge clk) reset = 1;
	@(negedge clk) x = 1;
	@(negedge clk) x = 0;
	@(negedge clk) x = 1;
	@(negedge clk) x = 0;
	@(negedge clk) x = 1;
	#20;
	$stop;	
end
endmodule