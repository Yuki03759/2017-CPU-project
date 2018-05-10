module mux4to1_tb;
	logic		a;
	logic		b;
	logic		c;
	logic		d;
	logic [1:0] sel;
	logic		out;
	
	mux4to1 dut(
		.a (a),
		.b (b),
		.c (c),
		.d (d),
		.sel (sel),
		.out (out)
		);
		
	initial begin
		a = 1'b0;
		b = 1'b1;
		c = 1'b0;
		d = 1'b1;
		sel = 2'b00;
		#10;
		sel = 2'b01;
		#10;
		sel = 2'b10;
		#10;
		sel = 2'b11;
		#10;
		
		a = 1'b1;
		b = 1'b0;
		c = 1'b1;
		d = 1'b0;
		sel = 2'b00;
		#10;
		sel = 2'b01;
		#10;
		sel = 2'b10;
		#10;
		sel = 2'b11;
		
	end 
endmodule
