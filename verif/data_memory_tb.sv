module data_memory_tb;

	logic W_en;
	logic [31:0] address;
	logic [31:0] write_data;
	logic [31:0] read_data;
	
	data_memory dut
	(
		.W_en(W_en),
		.address(address),
		.read_data(read_data),
		.write_data(write_data),
	);

	initial begin
		#10;
		address <=1'b1;
		W_en == 1'b1;
		wirte_data = 2'b10;
		#10;
		$display("address, write_data", address, write_data);
		$finish;
	end
	
endmodule