module Instruction_Memory(address, read_data);

	input logic  [5:0] address;						//address of instruction memory
	output logic [31:0] read_data;					//output for the controller

	logic [31:0] instruction_memory [64];		//instruction memory

	initial begin
		for(int i =0; i<64; i++) begin			//creates 64 indexes for memory
			instruction_memory[i] = 0;
		end

		instruction_memory [0] = 32'b0_000000_000000_1111_000000_000000000; //BOTH
		instruction_memory [1] = 32'b1_000001_000001_1111_000001_000000001; //BOTH

		instruction_memory [2] = 32'b0_000010_000010_0000_000010_000000010;
		instruction_memory [3] = 32'b1_000011_000011_0000_000011_000000011;

		instruction_memory [4] = 32'b0_000100_000100_0011_000100_000000100;
		instruction_memory [5] = 32'b1_000101_000101_0011_000101_000000101;

		instruction_memory [6] = 32'b0_000111_000111_1000_000111_000000111;
		instruction_memory [7] = 32'b1_001000_000000_1000_001000_000001000;

		instruction_memory [8] = 32'b0_001001_001001_1001_001001_000001001;
		instruction_memory [9] = 32'b1_001010_001010_1001_000000_000001010;

		instruction_memory [10] = 32'b0_001011_001011_1011_001011_000001011; //BOTH
		instruction_memory [11] = 32'b1_001100_001100_1011_000000_000001100; //BOTH

		instruction_memory [12] = 32'b0_001101_001101_1010_001101_000001101;
		instruction_memory [13] = 32'b1_001111_001111_1010_001111_000001111;

		instruction_memory [14] = 32'b0_010000_010000_1101_010000_000010000;
		instruction_memory [15] = 32'b1_010001_010001_1101_010001_000010001;

		instruction_memory [16] = 32'b0_010010_010010_0010_010010_000010010;
		instruction_memory [17] = 32'b1_010011_010011_0010_010011_000010011;

		instruction_memory [18] = 32'b0_010100_010100_0100_010100_000010010; //BOTH
		instruction_memory [19] = 32'b1_010101_010101_0100_010101_000010101; //BOTH

		instruction_memory [20] = 32'b0_010110_010110_0110_010110_000010110; //BOTH
		instruction_memory [21] = 32'b1_010111_010111_0110_010111_000010111; //BOTH


	end

	assign read_data = instruction_memory[address]; //assign the instruction memory to output based on the address

endmodule
