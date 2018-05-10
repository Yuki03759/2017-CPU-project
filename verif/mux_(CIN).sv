module mux_cin (d0, d1, sel_1, out);

	input d0,d1, sel_1;
	output out;
	reg out;
	
	always @ (sel_1 or d0 or d1)
	begin: mux_2_cin
		case(sel_1)
			1'b0: out = d0;
			1'b0: out = d1;
		endcase
	end
endmodule
	
