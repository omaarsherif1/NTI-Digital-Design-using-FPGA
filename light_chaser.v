module light_chaser
(
  input            clk,
  input            rst,
  input            Hold,
  
  output reg [3:0] out
);

initial 
  out = 4'b0111;
  
always @(posedge clk) begin
  if (!rst) //active-low reset
    out <= 4'b0111; //MSB is on and the rest is off
  else if (Hold)  // if hold is on, stay at same state
    out <= out;
  else 
    out <= {out[0],out[3:1]};   
end 
endmodule