module shifter_tb;

	logic a;
	logic b;
	logic mode;
	logic operation;
	logic c_out0;
	logic c_out1;
	
	

	shifter dut
	(
		.a (a), //.<Name> Refers to previous module
        .b (b),
		.mode (mode),
		.operation (operation),
		.c_out0 (c_out0),
		.c_out1 (c_out1)
		
	);
	
	
	initial begin
        #15;
		a <= 1'b1;
		b <= 1'b0;
		operation <= 101;
		mode <= 1;
        #15;
		$finish;
    end
	
	
	
endmodule
