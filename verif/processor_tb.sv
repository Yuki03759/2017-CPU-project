module processor_tb;

	parameter A = 32;
	parameter B = 6;

	logic [B - 1:0] in = 0;

	//logic [B -1:0] operation;
	//logic sel;

	logic [B - 1:0] out;
	logic clk = 0;
	logic reset;
	
	always #2 clk <= ~clk;
	
	always #4 in <= in + 1;
	always #4 out <= in;
	
	initial begin
		#1 reset = 1'b1;
		#1 reset = 1'b0;
		
	end
	
	processor dut
	(
		.reset(reset),
		.clk(clk),
		.in(in),
		.out(out)
	);
endmodule
