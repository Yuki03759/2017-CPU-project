module abc (a, c_in, c_out);

	input a;
	input c_in;
	output c_out;

		assign c_out = a;
		assign a = c_in[i-1];
		assign a[i] = c_in[i];

endmodule

	
