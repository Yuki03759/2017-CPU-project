module example_3();

	logic		[5:0] data1;
	logic		[5:0] data2;
	
initial begin

	$system("clear; echo; echo");
	data1	=	'b1;
	data2 	=	'1;
	$display("data1	= %g", data1);
	$display("data2	= %g", data2);
	#100;
	$system("echo; echo; echo");
	$finish;
end

endmodule