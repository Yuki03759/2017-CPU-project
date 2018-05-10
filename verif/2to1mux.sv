module mux2to1_tb;

	logic		x;
	logic		y;
	logic		sel;
	logic		out;
	
	mux2to1 dut
	(
		.x (x),
		.y (y),
		.sel (sel),
		.out (out)
	);
	
	initial begin
		#10;
		x <= 1'b1;
		y <= 1'b0;
		sel <= 1'b0;
		#10;
		sel <= 1'b1;
		#10;
	end

endmodule
