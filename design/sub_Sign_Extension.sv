module sign_extend (in, out);

	input in [15:0];
	output out [31:0];
	
	initial begin
		if (in[15] == 1'b0) // if positive number
			assign out = {16'h0000, in};
		else
			assign out = {16'hffff, in};
		end
		
	endmodule 