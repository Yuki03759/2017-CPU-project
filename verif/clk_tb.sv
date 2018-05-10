module clk_tb;

	logic a = 0;
	
	clk dut
	(
	.a(a)
	);
	
	initial begin
		#10;
		$display ("clk", a);
		#10;
		$display ("clk", a);
		#10;
		$display ("clk", a);
		
	end
	
endmodule 