module example_5();

	logic 	[5:0] data1 = 6'b111000;
	logic 	[5:0] data2 = 6'b1xxz00;
	logic	[5:0] data3 = 6'b1xxz00;
	
	initial begin
		$system("clear; echo; echo");
		
		$display("data_1 == data_2 => %b", data1 == data2);
		$display("data_1 === data_2 => %b", data1 === data2);
		$display("data_2 == data_3 => %b", data2 == data3);
		$display("data_2 === data_3 => %b", data2 === data3);
		#100;
		$System("echo; echo; echo");
		$finish;
	end
endmodule
		
	