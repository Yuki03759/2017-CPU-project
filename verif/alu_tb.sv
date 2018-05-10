module alu_tb;

	parameter LENGTH = 32;

	logic [LENGTH -1:0] a;
	logic [LENGTH -1:0] b;
	logic [2:0] operation;
	logic [LENGTH -1:0] out;

	alu dut (
	.a(a),
	.b(b),
	.operation(operation),
	.out(out)
	);
	
	initial begin
		#10;
	 	a = 1'b1;
		b = 1'b1;
		operation = 3'b000;
		$display ("a, b, operation, out", a, b, operation, out);
		#50;
		
	
		
	end
endmodule