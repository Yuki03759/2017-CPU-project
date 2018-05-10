module Instruction_Memory (address, clk, instruction, instruction_memory, memory_address);
	
	input clk;
	input [5:0] address;
	output [31:0] instruction;
	reg [31:0] instruction;
	
	reg [31:0] memory_address;
	reg [31:0] instruction_memory [64];
	
	initial
		assign instruction_memory[0] = 'h00078000;
		
	always @ (posedge clk) begin
		#100;
		memory_address = address;
		#100;
		instruction = Imem[memAddr];
	end
endmodule