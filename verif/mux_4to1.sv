module mux_4to1 ( i_0, i_1, i_2, i_3, sel, mux);

	input logic [4:0] i_0, i_1, i_2, i_3;

	input logic [1:0] sel;

	output logic [4:0] mux;

	assign mux = (sel == 2’b00) ? i_0 :

			((sel == 2’b01) ? i_1 :

			((sel == 2’b10) ? i_2 :

			((sel == 2’b11) ? i_3 :

			4’bz)));

endmodule