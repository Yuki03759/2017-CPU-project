module shifter (a,b,mode,operation);
	
	input a;
	input b;
	input mode;
	input [2:0]operation;
	output c_out0;
	output c_out1;
	
	logic con1;
	logic con2;
	
	module mux2to1
	(
		.a (a),
		.b (b),
		.mode(mode),
		.out(c_out0)
	);
	
	module mux2to1
	(
		.a (a),
		.b (b),
		.operation(operation),
		.out(c_out1)
	);


endmodule	