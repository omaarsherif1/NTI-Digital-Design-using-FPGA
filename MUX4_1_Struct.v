module MUX4_1_Struct
(
   input s0,
  input s1,
  
  input a0,
  input a1,
  input a2,
  input a3,
  
  output y
);
wire out_m0 , out_m1;

MUX2_1 mux0 (.a0(a0),.a1(a1),.s(s0),.y(out_m0));

MUX2_1 mux1 (.a0(a2),.a1(a3),.s(s0),.y(out_m1));

MUX2_1 mux2 (.a0(out_m0),.a1(out_m1),.s(s1),.y(y));

endmodule










