module sign_extend_tb;

	logic [15:0] in;
	logic [31:0] out;
	
	sign_extend dut
	(.*
	);
	
	initial begin
		#10;
		in = 16'hffff;
		#10;
		$display ("ffff is ", out);
		#10;
		in = 16'h0001;
		#10;
		$display ("0001 is ", out);
	end
endmodule
	