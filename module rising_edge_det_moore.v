module rising_edge_det_moore
(
	input clk,
	input rst,
	input level,
	
	output tick
);

// state encoding
localparam s0    = 2'b00,
		   sedge = 2'b01,
		   s1    = 2'b10;
//registers
reg [1:0] state,next_state;
always @(posedge clk , posedge rst)
begin
	if(rst) // active high
		state <= s0;
	else 
		state <= next_state;
end
//next_state logic
always @(*)
begin
	case(state)
	s0:
	begin 
		if(level)
			next_state = sedge;
		else
			next_state = s0;
	end
	sedge:
	begin 
		if(level)
			next_state = s1;
		else
			next_state = s0;
	end
	s1:
	begin 
		if(level)
			next_state = s1;
		else
			next_state = s0;
	end
	default next_state = s0;
	endcase
end
//output logic
	//1)moore
assign tick = (state == sedge);
endmodule

	
