module example_fulladder_tb;

	logic a;
	logic b;
	logic cin;
	logic cout;
	logic sum;
	
	example_fulladder dut
	(
		.a (a),
		.b (b),
		.cin (cin),
		.cout (cout),
		.sum (sum)
	);
	
	initial begin
		#10;
		a <= 1'b1;
		b <= 1'b1;
		cin <= 1'b1;
		#10;
	end
		
endmodule;