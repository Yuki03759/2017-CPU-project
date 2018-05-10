module pc (in, out);

	input [31:0] in;
	output reg [31:0] out;
	
initial begin 
	out <= 0;
end

always @ ( in ) begin
		#1
	end

endmodule
	