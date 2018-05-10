module shifternew_tb;

	logic a;
	logic c_in;
	logic c_out;
	
	shifternew dut
	(
		.a(a),
		.c_in(c_in),
		.c_out(c_out)
	);
	
	initial begin
		a = 1'b0;
		
	end
endmodule