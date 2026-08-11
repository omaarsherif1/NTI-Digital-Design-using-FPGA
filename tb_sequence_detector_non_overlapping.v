`timescale 1ns / 100ps
module tb_sequence_detector_non_overlapping;

parameter clock_per = 10;

reg  clk;
reg  reset;
reg  x;
wire y_moore;
wire y_mealy;

sequence_detector_moore DUT0
(
	.clk(clk),
	.reset(reset),
	.x(x),
	
	.y(y_moore)
);

sequence_detector_mealy DUT1
(
	.clk(clk),
	.reset(reset),
	.x(x),
	
	.y(y_mealy)
);

always #(clock_per/2) clk = ~clk;

initial  
begin
	$monitor ("Time = %t , input = %b , mealy out = %b , moore out = %b",$time , x , y_mealy , y_moore);
	clk = 0; reset = 0; x = 0;
	#20; reset = 1;
	@(negedge clk) x = 0;
	@(negedge clk) x = 1;
	@(negedge clk) x = 1;
	@(negedge clk) x = 0;
	@(negedge clk) x = 1;
	@(negedge clk) x = 0;
	@(negedge clk) x = 1;
	@(negedge clk) x = 1;
	@(negedge clk) x = 0;
	@(negedge clk) reset = 0;
	@(negedge clk) reset = 1;
	@(negedge clk) x = 1;
	@(negedge clk) x = 1;
	@(negedge clk) x = 0;
	@(negedge clk) x = 1;
	@(negedge clk) x = 0;
	@(negedge clk) x = 1;	
	#20;
	$stop;
end
endmodule