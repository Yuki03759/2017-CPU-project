module fulladder_tb;


    logic a;
	logic b;
	logic c_in;
	logic c_out;
	logic sum;
    
  
    fulladder dut
    (
	
        .c_in  (c_in ),
        .c_out (c_out),
        .a (a),
        .b (b),
        .sum  (sum)
	
    );
  

	
    initial begin
        #10;
		c_in <= 1'b1;
        a <= 1'b1;
        b <= 1'b1;
        #10;
		
		c_in <= 1'b0;
        a <= 1'b0;
        b <= 1'b1;
        #10;
		
		c_in <= 0;
        a <= 1;
        b <= 0;
        #10;
		
    end
    
endmodule