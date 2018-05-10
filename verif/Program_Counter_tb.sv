module Program_Counter_tb;

	logic reset;
	logic clk;
	logic [5:0] in;
	logic [5:0] out;
	
	Program_Counter dut
	(
		.reset(reset),
		.clk(clk),
		.in(in),
		.out(out)
	);

	
	always #100 clk <= ~clk;
	
	initial begin
		clk <= 1'b0;
		reset <= 1'b0;
	end
	
	initial begin
		#10;
		in <=1'b1;
		reset <= 1'b0;
	
		#10;
		$display("in, out", in, out);
	
		#1000;
		$display("in, out", in, out);
		#200;
		$display("in, out", in, out);
		$finish;
	end
	
endmodule