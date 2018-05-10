module mux2to1_tb;

	logic		a;
	logic		b;
	logic		sel;
	logic		out;
	
	mux2to1 dut
	(
		.a (a),
		.b (b),
		.sel (sel),
		.out (out)
	);
	
	initial begin
		#10;
		a <= 1'b0;
		b <= 1'b1;
		sel <= 1'b0;
		#10;
		$display ("a, b, ,sel out", a, b, sel, out);
	end

endmodule
