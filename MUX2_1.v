module MUX2_1
(
  input a0,
  input a1,
  input s,
  
  output y
);
wire A1,A2,not_s;
assign not_s = ~s;
assign A1 = not_s & a0;
assign A2 = s & a1;
assign y = A1|A2;
endmodule