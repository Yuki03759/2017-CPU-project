module mux8to1_tb;
	logic		a;
	logic		b;
	logic		c;
	logic		d;
	logic		e;
	logic		f;
	logic		g;
	logic		h;
	logic [2:0] sel;
	logic		out;
	
	mux8to1 dut(
		.a (a),
		.b (b),
		.c (c),
		.d (d),
		.e (e),
		.f (f),
		.g (g),
		.h (h),
		.sel (sel),
		.out (out)
		);
		
	initial begin
		a = 1'b0;
		b = 1'b0;
		c = 1'b0;
		d = 1'b0;
		e = 1'b1;
		f = 1'b1;
		g = 1'b1;
		h = 1'b1;
		sel = 3'b000;
		#10;
		sel = 3'b001;
		#10;
		sel = 3'b010;
		#10;
		sel = 3'b011;
		#10;
		sel = 3'b100;
		#10;
		sel = 3'b101;
		#10;
		sel = 3'b110;
		#10;
		sel = 3'b111;
		#10;
		
		a = 1'b1;
		b = 1'b1;
		c = 1'b1;
		d = 1'b1;
		e = 1'b0;
		f = 1'b0;
		g = 1'b0;
		h = 1'b0;
		sel = 3'b000;
		#10;
		sel = 3'b001;
		#10;
		sel = 3'b010;
		#10;
		sel = 3'b011;
		#10;
		sel = 3'b100;
		#10;
		sel = 3'b101;
		#10;
		sel = 3'b110;
		#10;
		sel = 3'b111;
		#10;
		
		a = 1'b1;
		b = 1'b0;
		c = 1'b1;
		d = 1'b0;
		e = 1'b1;
		f = 1'b0;
		g = 1'b1;
		h = 1'b0;
		sel = 3'b000;
		#10;
		sel = 3'b001;
		#10;
		sel = 3'b010;
		#10;
		sel = 3'b011;
		#10;
		sel = 3'b100;
		#10;
		sel = 3'b101;
		#10;
		sel = 3'b110;
		#10;
		sel = 3'b111;
		#10;
	end
endmodule

