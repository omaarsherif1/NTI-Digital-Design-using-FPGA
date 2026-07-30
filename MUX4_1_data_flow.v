module MUX4_1_data_flow
(
  input s0,
  input s1,
  
  input a0,
  input a1,
  input a2,
  input a3,
  
  output y
);
assign y = s1?(s0?a3:a2):(s0?a1:a0);
endmodule