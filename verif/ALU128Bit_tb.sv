module ALU128Bit_tb;

	parameter LENGTH = 128;

	logic [LENGTH -1:0] op1;
	logic [LENGTH -1:0] op2;
	logic [2:0] operation;
	logic mode;

	logic [LENGTH -1:0] out;
	logic carry_flag;
	logic zero_flag;
	logic overflow_flag;
	logic sign_flag;

	alu_128bitex dut (
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
	 	op1 = 1'b1;
		op2 = 1'b1;
		mode = 0;
		operation = 3'b000;
		#50;
		op1 = 1'd1;
		op2 = 0;
		mode = '1;
		operation = 3'b101;
		#50;
		op1 = 1'b1;
		op2 = 0;
		mode = '0;
		operation = 3'b010;
		#50;
		op1 = 1;
		op2 = 0;
		mode = '0;
		operation = 3'b011;
		#50;
		op1 = 1'b1;
		op2 = 0;
		mode = '1;
		operation = 3'b100;
		#50;
		op1 = 1;
		op2 = 0;
		mode = '0;
		operation = 3'b101;
		#50;
		op1 = 1'b1;
		op2 = 0;
		mode = '1;
		operation = 3'b101;
		#50;
		
		
	end
endmodule
