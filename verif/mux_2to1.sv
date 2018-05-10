module mux_2to1_tb;

	logic a;
	logic b;
	logic sel;
	wire y;

	mux_2to1 L1(
	.A(a),
	.B(b),
	.sel(sel),
	.Y(y)
	);

	initial begin

	a=1'b0;
	b=1'b0;
	sel = 1'b0;
	#5;
	a = 1'b0;
	b =1'b1;
	sel = 1'b0;
	#5;
	a=1'b0;
	b=1'b1;
	sel = 1'b1;
	#5;
	a = 1'b0;
	b = 1'b1;
	sel = 1'b0;
	#5;
	a = 1'b0;
	b = 1'b0;
	sel = 1'b0;
	end

endmodule
