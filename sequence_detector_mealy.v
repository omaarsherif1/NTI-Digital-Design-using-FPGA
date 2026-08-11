module sequence_detector_mealy
(
	input  clk,
	input  reset,
	input  x,
	
	output y
);
localparam s0 = 3'b000,
           s1 = 3'b001,
		   s2 = 3'b010,
		   s3 = 3'b011,
		   s4 = 3'b100,
		   s5 = 3'b101,
		   s6 = 3'b110;
		   
reg [2:0] present_state,next_state;

always @(posedge clk , negedge reset)
begin
	if(!reset)
		present_state <= s0;
	else 
		present_state <= next_state;
end

always @(*)
begin
	case(present_state)
		s0:
		begin
			if(x)
				next_state = s1;
			else 
				next_state = s0;
		end
		s1:
		begin
			if(x)
				next_state = s2;
			else 
				next_state = s0;		
		end
		s2:
		begin
			if(x)
				next_state = s1;
			else 
				next_state = s3;		
		end
		s3:
		begin
			if(x)
				next_state = s4;
			else 
				next_state = s0;		
		end
		s4:
		begin
			if(x)
				next_state = s1;
			else 
				next_state = s5;		
		end
		s5:
		begin
			if(x)
				next_state = s6;
			else 
				next_state = s0;		
		end
		s6:
		begin
			if(x)
				next_state = s1;
			else 
				next_state = s0;		
		end
		default next_state = s0;
	endcase
end
assign y = x & present_state[2] & ~present_state[1] & present_state[0];
endmodule 