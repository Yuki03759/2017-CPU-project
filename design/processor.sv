//////////////////////////////////////////////////////////////////////////////////
// Company: ZotComm
// Engineer: David Tiao & Yuki Hayashi
//
// Create Date: 9/9/2017
// Design Name: Modified RISC-V CPU
// Module Name: processor
// Project Name: Final Project Summer 2 2017
//
// Dependencies: Check ZIP File. Too many to name.
//
// Revision: 1
// Additional Comments: This was a hella roller coaster to make.
//
//////////////////////////////////////////////////////////////////////////////////


module processor (reset, clk, in, out, c_flag, z_flag, s_flag, o_flag);
	parameter A = 32;
	parameter B = 6;

	input logic [B - 1:0] in;
	input logic clk;
	//input logic [B - 1: 0] operation;
	//input logic sel;
	input logic reset;
	output logic [B - 1:0] out;

	output logic c_flag;
	output logic z_flag;
	output logic s_flag;
	output logic o_flag;
	
	logic [5:0] PCout;

	// Program Counter
	Program_Counter PC (

		.clk(clk),
		.reset(reset),
		.in(in),
		.out(PCout)
	);

	// Assign PC Address to Temp Value
	
	assign out = PCout;
	logic [31:0] inst_memout;


	Instruction_Memory inst_mem
	(
		.address(PCout),
		.read_data(inst_memout)
	);


	// Define controller outputs
	logic [3:0] opcode; // 4 Bit Operation Code: MSB is MODE
	logic mux1; // Register File RD 2 or Sign EXT IMM -> ALU B
	logic mux2; // ALU Result or From Data Memory Select Bit
	logic we1;  // Write Enable 1 - Register File
	logic we2;  // Write Enable 2 - Data Memory
	logic ri;   // Register or Immediate Value
	logic [8:0] imm;	// Immediate
	logic [14:0] op2; 	// Immediate + Additional Value Output



	// Define register file outputs
	logic [5:0] ra1; // Read Address 1
	logic [5:0] ra2; // Read Address 2
	logic [5:0] wa;  // Write Address
	logic [31:0] wd;  // Write Data
	logic [31:0] rd1; // Read Data 1
	logic [31:0] rd2; // Read Data 2


	controller ctrl
	(
		.CODE(inst_memout),
		.clk(clk),
		.Operation(opcode),
		.Mux1(mux1),
		.Mux2(mux2),
		.WE1(we1),
		.WE2(we2),
		.RI(ri),
		.RS(ra1),
		.RD(wa),
		.RT(ra2),
		.IMM(imm),
		.Op2(op2)
	);


Register_File reg_file
(
	.clk(clk),
	.R1(ra1),
	.R2(ra2),
	.W(wa),
	.Data_in(wd),
	.W_en(we1),
	.Out1(rd1),
	.Out2(rd2),
	.reset(reset)
);

	// Define Sign Extend Out
	logic [31:0] ext_imm; // Sign Extended Output

Sign_Extend sign_ext
(
	.in(op2),
	.out(ext_imm)
);

	// Define Mux1 Values
	logic [31:0] mux1_out; // Reg or Ext Out

mux2to1_32bit mux1_selector
(
	.a(rd2),
	.b(ext_imm),
	.sel(mux1),
	.out(mux1_out)
);


	// Define ALU Ports

	logic [31:0] alu_out; // ALU Output

	logic modeval;
	assign modeval = opcode[3];

	logic [2:0] aluoperation;
	assign aluoperation = opcode[2:0];

alu_32bitex alu
(
	.op1(rd1),
	.op2(mux1_out),
	.mode(modeval),
	.out(alu_out),
	.operation(aluoperation),
	.carry_flag(c_flag),
	.zero_flag(z_flag),
	.sign_flag(s_flag),
	.overflow_flag(o_flag)
);

	// Define Data Mem Ports

	logic [31:0] data_mem_out; // ALU Output

Data_Memory data_mem
(
	.clk(clk),
	.W_en(we2),
	.address(alu_out),
	.write_data(rd2),
	.read_data(data_mem_out),
	.reset(reset)
);

	// Define Data Mem Ports

	logic [31:0] mux2_out; // Mux 2 Out

mux2to1_32bit secondmux
(
	.a(data_mem_out),
	.b(alu_out),
	.sel(mux2),
	.out(mux2_out)
);


endmodule
