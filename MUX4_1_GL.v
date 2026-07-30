module MUX4_1_GL
(
  input s0,
  input s1,
  
  input a0,
  input a1,
  input a2,
  input a3,
  
  output y
);
wire not_s0 , not_s1,out_A1,out_A2,out_A3,out_A4;

assign not_s0 = ~ s0;
assign not_s1 = ~ s1;

assign out_A1 = not_s0&not_s1&a0;
assign out_A2 = s0 & not_s1 & a1; 
assign out_A3 = not_s0 & s1 & a2; 
assign out_A4 = s0&s1&a3;

assign y =  out_A1|out_A2|out_A3|out_A4;
endmodule
