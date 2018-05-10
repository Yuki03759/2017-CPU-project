module Instruction_Memory (address, read_data);

	input logic  [5:0] address;						//address of instruction memory
	output logic [31:0] read_data;					//output for the controller

	logic [31:0] instruction_memory [64];		//instruction memory

	initial begin
		for(int i =0; i<64; i++) begin			//creates 64 indexes for memory
			instruction_memory[i] = 0;
		end

		instruction_memory [0] = 32'b000000000_000000_1111_000000_000000_0; //BOTH
		instruction_memory [1] = 32'b100000000_100000_1111_100000_100000_1; //BOTH

		instruction_memory [2] = 32'b010000000_010000_0000_010000_010000_0;
		instruction_memory [3] = 32'b110000000_110000_0000_110000_110000_1;

		instruction_memory [4] = 32'b001000000_001000_1100_001000_001000_0;
		instruction_memory [5] = 32'b101000000_101000_1100_101000_101000_1;

		instruction_memory [6] = 32'b011000000_111000_0001_111000_111000_0;
		instruction_memory [7] = 32'b111000000_000100_0001_000000_000100_1;

		instruction_memory [8] = 32'b000100000_100100_1001_100100_100100_0;
		instruction_memory [9] = 32'b100100000_000000_1001_010100_010100_1;

		instruction_memory [10] = 32'b010100000_110100_1101_110100_110100_0; //BOTH
		instruction_memory [11] = 32'b110100000_000000_1101_001100_001100_1; //BOTH

		instruction_memory [12] = 32'b001100000_101100_0101_101100_101100_0;
		instruction_memory [13] = 32'b101100000_111100_0101_111100_111100_1;

		instruction_memory [14] = 32'b011100000_000010_1011_000010_000010_0;
		instruction_memory [15] = 32'b111100000_100010_1011_100010_100010_1;

		instruction_memory [16] = 32'b000010000_010010_0100_010010_010010_0;
		instruction_memory [17] = 32'b100010000_110010_0100_110010_110010_1;

		instruction_memory [18] = 32'b010010000_001010_0010_001010_001010_0; //BOTH
		instruction_memory [19] = 32'b110010000_101010_0010_101010_101010_1; //BOTH

		instruction_memory [20] = 32'b001010000_011010_0110_011010_011010_0; //BOTH
		instruction_memory [21] = 32'b101010000_111010_0110_111010_111010_1; //BOTH


	end

	assign read_data = instruction_memory[address]; //assign the instruction memory to output based on the address

endmodule
