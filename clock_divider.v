module clock_divider
#(parameter width = 27)
(
  input clk,
  input reset, 
  
  output reg [width - 1:0] counterout
);

always @(posedge clk) begin
  if(reset)
    counterout[width - 1:0] = 0;
  else 
    counterout = counterout + 1'b1;
end
endmodule
// counterout[26] = clk / 2**27 approax = 7.5*10^-9clk