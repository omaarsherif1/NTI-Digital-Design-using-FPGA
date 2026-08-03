module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output reg [15:0] q
);

always @(posedge clk) begin
  if(!resetn)
    q <= 16'b0000_0000_0000_0000;
  else begin
    case(byteena)
	  2'b00 : q <= q;
	  2'b01 : q <= {q[15:8],d[7:0]};
	  2'b10 : q <= {d[15:8],q[7:0]};
	  2'b11 : q <= d;
	  endcase
    	 
  end
end

endmodule
// another solution
/*
// synthesis verilog_input_version verilog_2001
module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output reg [15:0] q   // FIXED: Added 'reg'
);

    always @(posedge clk) begin
        if (!resetn) begin // FIXED: Changed to 'resetn'
            q <= 16'h0000;
        end else begin
            // Lower byte control
            if (byteena[0]) begin
                q[7:0] <= d[7:0];
            end
            
            // Upper byte control
            if (byteena[1]) begin
                q[15:8] <= d[15:8];
            end
        end
    end

endmodule
*/
