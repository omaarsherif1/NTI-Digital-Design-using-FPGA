module Decoder2_4
(
  input A,
  input B,
  input reg E,
  
  output reg[3:0] f
);
always@(*)
  if(E) begin
     case({A,B})
	     2'b00 : f = 4'b0001;
		 2'b01 : f = 4'b0010;
		 2'b10 : f = 4'b0100;
		 2'b11 : f = 4'b1000;
		 default f = 4'b0000;
	 endcase
  end
  else 
    f = 4'b0000;
endmodule

