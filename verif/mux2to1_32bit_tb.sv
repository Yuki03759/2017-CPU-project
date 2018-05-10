module mux2to1_32bit_tb;

	logic [31:0] a;
	logic [31:0] b;
	logic sel;
	wire out;
	
	module mux2to1_32bit dut
	(
		.a(a),
		.b(b),
		.sel(sel),
		.out(out)
	);
		
	
	initial begin
		#5;
		a <= 32'h1111;
		b <= 32'h1111;
		sel <= 1'b0;
		#5;
	
		$display ("a, b, sel, out", a, b, sel, out);
	end
	
endmodule