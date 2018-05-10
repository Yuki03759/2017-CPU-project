module mux4to1( i0, i1, i2, i3, sel, mux);

input logic [4:0] i0, i1, i2, i3;

input logic [1:0] sel;

output logic [4:0] mux;

assign mux = (sel == 2’b00) ? i0 :

			((sel == 2’b01) ? i1 :

			((sel == 2’b10) ? i2 :

			((sel == 2’b11) ? i3 :

			4’bz)));

endmodule