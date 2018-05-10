module fulladder_tb;

    logic 		a;
    logic 		b;
    logic 		c_in;
    logic 		sum;
    logic 		c_out;
    
    fulladder dut
	(
		.c_in (c_in), //.<Name> Refers to previous module
        .c_out (c_out),
        .sum (sum),
		.a (a),
		.b (b)
	);
	
	
    initial begin
        #5;
		c_in <= 1'b0;
        a <= 1'b1;
        b <= 1'b0;
        #5;
		$display ("cin a b", cin a b);
		$finish;
    end
	
    
endmodule
