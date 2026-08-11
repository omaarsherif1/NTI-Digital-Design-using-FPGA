module rising_edge_det_mealy
(
	input clk,
	input rst,
	input level,
	
	output reg tick
);

// state encoding
localparam s0    = 2'b00,
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
			next_state = s1;
		else
			next_state = s0;
	end
	s1:next_state = s0;
	
	default next_state = s0;
	endcase
end
//output equation
	//2)mealy
always @(*)
begin
	if(level == 1'b1 && next_state == s1)
		tick = 1'b1;
	else 
		tick = 1'b0;
end
endmodule
