module example_4();

logic 	[5:0] data1;
logic [5:0] data2;

initial begin

	$system("clear; scho; echo");
	data1 = { {3{1'b1}}, {3{1'b0}} };
	data2 = { {3{1}}	,{3{0}}		};
	
	$display("data1	= %g", data1);
	$display("data2 = %g", data2);
	#100;
	$system("echo; echo; echo");
	$finish;
	
	end
endmodule