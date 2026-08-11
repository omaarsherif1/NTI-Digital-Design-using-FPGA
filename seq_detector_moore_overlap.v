module seq_detector_moore_overlap (
	input wire clk,
	input wire reset,
	input wire x,
	
	output wire y 
);

localparam s0 = 3'b000,
           s1 = 3'b001,
           s2 = 3'b010,
           s3 = 3'b011,
           s4 = 3'b100,
           s5 = 3'b101,
           s6 = 3'b110;	
		   
reg [2:0] presentState,nextState;

always @(posedge clk , negedge reset)
begin 
	if(~reset)
		presentState <= s0;
	else
		presentState <= nextState;
end

always @(*)
begin
	case(presentState)
		s0:
		begin
			if(x)
				nextState = s1;
			else 
				nextState = s0;
		end
		s1:
		begin
			if(x)
				nextState = s2;
			else 
				nextState = s0;		
		end
		s2:
		begin
			if(x)
				nextState = s2;
			else 
				nextState = s3;		
		end
		s3:
		begin
			if(x)
				nextState = s4;
			else 
				nextState = s0;		
		end
		s4:
		begin
			if(x)
				nextState = s2;
			else 
				nextState = s5;		
		end
		s5:
		begin
			if(x)
				nextState = s6;
			else 
				nextState = s0;		
		end
		s6:
		begin
			if(x)
				nextState = s2;
			else 
				nextState = s0;		
		end
		default nextState = s0;
	endcase
end

assign y = (presentState == s6);
endmodule