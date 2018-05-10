module mux_cin (d_0, d_1, sel_1, out);

	input d_0, d_1, sel_1; //input
	output out; //output
	reg out; //variables
	
	always @ (sel_1 or d_0 or d_1)
	begin: mux_cin
		case(sel_1)
			1'b0: out = d_0;
			1'b1: out = d_1;
		endcase
	end
endmodule
	
