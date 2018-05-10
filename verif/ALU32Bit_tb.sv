module ALU32Bit_tb;

	parameter LENGTH = 32;

	logic [LENGTH -1:0] op1;
	logic [LENGTH -1:0] op2;
	logic [2:0] operation;
	logic mode;

	logic [LENGTH -1:0] out;
	logic carry_flag;
	logic zero_flag;
	logic overflow_flag;
	logic sign_flag;

	alu_32bitex dut (
		.op1(op1),
		.op2(op2),
		.operation(operation),
		.mode(mode),
		.out(out),
		.carry_flag(c_flag),
		.zero_flag(z_flag),
		.overflow_flag(o_flag),
		.sign_flag(s_flag)
	);

	
	initial begin
	 	op1 = 32'b1;
		op2 = 32'b1;
		mode = 0;
		operation = 3'b000;
		#50;
		op1 = 32'd1;
		op2 = 1;
		mode = '0;
		operation = 3'b001;
		#50;
		op1 = 32'b1;
		op2 = 1;
		mode = '0;
		operation = 3'b010;
		#50;
		op1 = 0;
		op2 = 1;
		mode = '0;
		operation = 3'b011;
		#50;
		op1 = 32'b1;
		op2 = 1;
		mode = '0;
		operation = 3'b100;
		#50;
		op1 = 32'b1;
		op2 = 1;
		mode = '0;
		operation = 3'b101;
		#50;
		op1 = 1;
		op2 = 1;
		mode = '0;
		operation = 3'b110;
		#50;
		op1 = 32'b1;
		op2 = 1;
		mode = '0;
		operation = 3'b111;
		#50;
			 	op1 = 32'b1;
		op2 = 32'b1;
		mode = 1;
		operation = 3'b000;
		#50;
		op1 = 32'd1;
		op2 = 1;
		mode = '1;
		operation = 3'b001;
		#50;
		op1 = 32'b1;
		op2 = 1;
		mode = '1;
		operation = 3'b010;
		#50;
		op1 = 1;
		op2 = 1;
		mode = '1;
		operation = 3'b011;
		#50;
		op1 = 32'b1;
		op2 = 1;
		mode = '1;
		operation = 3'b100;
		#50;
		op1 = 32'b11;
		op2 = 32'b0;
		mode = '1;
		operation = 3'b101;
		#50;
		op1 = 1;
		op2 = 1;
		mode = '1;
		operation = 3'b110;
		#50;
		op1 = 32'b0;
		op2 = 32'b1;
		mode = 1'b1;
		operation = 3'b111;
		#50;
		//$display ("op1, op2, mode, operation, out", op1, op2, mode, operation, out);
		//#50;
		
	end
	
endmodule
