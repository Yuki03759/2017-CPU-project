module pc_tb;

	logic [31:0] in;
	logic [31:0] out;
	
	pc dut
	(
		.in(in),
		.out(out)
	);

	
	initial begin
		#10;
		in <=1'b1;
		#10;
		$display("in, out", in, out);
	
		#1000;
		$display("in, out", in, out);
		$finish;
	end
	
endmodule