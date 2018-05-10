module clk_tb;

	
	clk dut
	(
	.clk(clk)
	);
	
	initial begin
		#100;
		$display ("clk", clk);
		#100;
		$display ("clk", clk);
		#100;
		$display ("clk", clk);
		
	end
	
endmodule 