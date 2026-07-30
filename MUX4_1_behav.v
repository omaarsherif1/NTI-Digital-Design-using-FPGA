module MUX4_1_behav
(
  input s0,
  input s1,
  
  input a0,
  input a1,
  input a2,
  input a3,
  
  output reg y
);
always @ (*) begin
  case({s1,s0})
     2'b00 : y = a0;
	 2'b01 : y = a1;
	 2'b10 : y = a2;
	 2'b11 : y = a3;

end 
  

endmodule
