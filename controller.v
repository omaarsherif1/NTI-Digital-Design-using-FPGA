module controller
(
  input            zero,
  input wire [2:0] phase,
  input wire [2:0] opcode,

  output reg       sel,
  output reg       rd,
  output reg       ld_ir ,
  output reg       inc_pc,
  output reg       halt,
  output reg       ld_pc,
  output reg       data_e,
  output reg       ld_ac,
  output reg       wr  
);

always @(*) begin 
  if ( phase == 3'b000 ) begin
  	sel     = 1'b1;
	rd      = 1'b0;
	ld_ir   = 1'b0;
	inc_pc  = 1'b0;
	halt    = 1'b0;
	ld_pc   = 1'b0;
	data_e  = 1'b0;
	ld_ac   = 1'b0;
	wr      = 1'b0; 
  end
  else if ( phase == 3'b001 ) begin
  	sel     = 1'b1;
	rd      = 1'b1;
	ld_ir   = 1'b0;
	inc_pc  = 1'b0;
	halt    = 1'b0;
	ld_pc   = 1'b0;
	data_e  = 1'b0;
	ld_ac   = 1'b0;
	wr      = 1'b0; 
  end
  else if ( phase == 3'b010 ) begin
   	sel     = 1'b1;
	rd      = 1'b1;
	ld_ir   = 1'b1;
	inc_pc  = 1'b0;
	halt    = 1'b0;
	ld_pc   = 1'b0;
	data_e  = 1'b0;
	ld_ac   = 1'b0;
	wr      = 1'b0; 
  end
  else if ( phase == 3'b011 ) begin
  	sel     = 1'b1;
	rd      = 1'b1;
	ld_ir   = 1'b1;
	inc_pc  = 1'b0;
	halt    = 1'b0;
	ld_pc   = 1'b0;
	data_e  = 1'b0;
	ld_ac   = 1'b0;
	wr      = 1'b0;  
  end
  else if ( phase == 3'b100 ) begin
   	sel     = 1'b0;
	rd      = 1'b0;
	ld_ir   = 1'b0;
	inc_pc  = 1'b1;
	halt    = (opcode == 3'b000);//HALT
	ld_pc   = 1'b0;
	data_e  = 1'b0;
	ld_ac   = 1'b0;
	wr      = 1'b0;  
  end
  else if ( phase == 3'b101 ) begin
   	sel     = 1'b0;
	rd      = (opcode == 3'b010)||(opcode == 3'b011)||(opcode == 3'b100)||(opcode == 3'b101);//ALUOP
	ld_ir   = 1'b0;
	inc_pc  = 1'b0;
	halt    = 1'b0;
	ld_pc   = 1'b0;
	data_e  = 1'b0;
	ld_ac   = 1'b0;
	wr      = 1'b0;  
  end
  else if ( phase == 3'b110 ) begin
	sel     = 1'b0;
	rd      = (opcode == 3'b010)||(opcode == 3'b011)||(opcode == 3'b100)||(opcode == 3'b101);//ALUOP
	ld_ir   = 1'b0;
	inc_pc  = (opcode == 3'b001)&&(zero);//SKZ&&ZERO
	halt    = 1'b0;
	ld_pc   = (opcode == 3'b111);//JMP
	data_e  = (opcode == 3'b110);//STO
	ld_ac   = 1'b0;
	wr      = 1'b0;  
  end
  else if ( phase == 3'b111 ) begin
  	sel     = 1'b0;
	rd      = (opcode == 3'b010)||(opcode == 3'b011)||(opcode == 3'b100)||(opcode == 3'b101);//ALUOP
	ld_ir   = 1'b0;
	inc_pc  = 1'b0;
	halt    = 1'b0;
	ld_pc   = (opcode == 3'b111);//JMP
	data_e  = (opcode == 3'b110);//STO
	ld_ac   = (opcode == 3'b010)||(opcode == 3'b011)||(opcode == 3'b100)||(opcode == 3'b101);//ALUOP
	wr      = (opcode == 3'b110);//STO
  end
end
endmodule

