module Instruction_Memory_tb;

	logic [5:0] address;
	logic [31:0] read_data;
	logic [31:0] instruction_memory [64];
	
	Instruction_Memory dut
	(
		.address(address),
		.read_data(read_data)
	);

	initial begin
		address <=6'b0;
		#10;
		address <=6'b1;				
		#10;
		address <=6'b10;
		#10;
		address <=6'b11;
		#10;
		address <=6'b100;
		#10;
		address <=6'b101;
		#10;
		address <=6'b110;
		#10;
		address <=6'b111;
		#10;
		address <=6'b1000;
		#10;
		address <=6'b1001;
		#10;
		address <=6'b1010;
		#10;
		address <=6'b1011;
		#10;
		address <=6'b1100;
		#10;
		address <=6'b1101;
		#10;
		address <=6'b1110;
		#10;
		address <=6'b1111;
		#10;
		address <=6'b10000;
		#10;
		address <=6'b10001;
		#10;
		address <=6'b10010;
		#10;
		address <=6'b10011;
		#10;
		address <=6'b10100;
		#10;
		address <=6'b10101;
		#10;
		$finish;
	end
	
endmodule