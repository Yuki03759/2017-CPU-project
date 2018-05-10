module mux_8 (d, sel, out);
	
	input [7:0]d;
	input [2:0]sel;
	output out;
	
	reg out;
	always @ (d or sel)
	
	begin
		case(sel)
			3'b000: out =d[0];
			3'b001: out =d[1];
			3'b010: out =d[2];
			3'b011: out =d[3];
			3'b100: out =d[4];
			3'b101: out =d[5];
			3'b110: out =d[6];
			3'b111: out =d[7];
		endcase
	end
endmodule