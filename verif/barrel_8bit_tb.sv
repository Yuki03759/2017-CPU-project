module barrel_8bit_tb;

	reg [7:0] a;
	reg [2:0] sel;
	reg [7:0] out;
	
	barrel dut(
		.a(a),
		.out(out),
		.sel(sel)
		);
		
	initial begin
		a = 8'd0;
		sel = 3'd0;
		#100;
		
		a = 8'16;
		sel = 3'd2;
		#20;
		
		a = 8'd4;
		sel = 3'd2;
		
	end
endmodule