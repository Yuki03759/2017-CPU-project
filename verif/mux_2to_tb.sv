module mux2to1_tb;

	logic a;
	logic b;
	logic sel;
	wire y;

	module mux2to1(
		input A,
		input B,
		input sel,
		output Y
	);
	
	assign Y =(sel == 1'b0) ? A:B;
	
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
	
	$display ("a, b, sel", a, b, sel);
	end

endmodule
