module combine_tb;

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
	end

endmodule
