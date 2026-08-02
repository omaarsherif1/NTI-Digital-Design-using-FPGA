module SIPO_reg
(
  input d,
  input rst,
  input clk,
  
  output reg [3:0] out
);

always @(posedge clk) begin
  if(!rst) //active low reset
    out <= 0;
  else 
  out <= {out[2:0],d};
end

endmodule