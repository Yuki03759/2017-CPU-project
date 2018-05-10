module generate_statement_tb();
	
	logic [7:0] x;
	logic [15:0] y;
	logic [7:0] z;
	
	genvar i;
	generate
		for (i=0; i<=$clog2(8); i = i +1)
		begin: g
			assign z[i] = x[i] & y [i+8];
		end
	endgenerate
endmodule
	