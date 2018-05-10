module mux_fa_logic (fa, log, ena, out);

	input fa, log, ena; //input
	output out; //output
	reg out; //variables
	
	always @ (fa or log or ena)
	begin: mux_fa_logic
		case(ena)
			1'b0: out = fa;
			1'b1: out = log;
		endcase
	end
endmodule
	