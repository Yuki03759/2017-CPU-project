   //////////////////////////////////////////////////////////////////////////////////
// Company: ZotComm
// Engineer: David Tiao
//
// Create Date: 8/24/2017
// Design Name: 128 Bit ALU
// Module Name: 128BitALU
// Project Name: Midterm Project Summer 2 2017
//
// Dependencies: Mux8to1, FullAdder, Mux2to1, 1BitALU, mux2to1_128
//
// Revision: 1
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module alu_128bitex (op1, op2, mode, out, operation, carry_flag, zero_flag, sign_flag, overflow_flag);

	parameter LENGTH = 128;

	// Define all inputs and outputs.
    input logic [LENGTH -1:0] op1;
    input logic [LENGTH -1:0] op2;
    input logic [2:0] operation;
    input logic mode;

    output logic [LENGTH -1:0] out;
    output logic carry_flag;
    output logic zero_flag;
    output logic overflow_flag;
    output logic sign_flag;

// Define wires interconnecting all carry and zero flags between ALUs
    logic [LENGTH-1:0] carry_flagspan, zero_flagspan;

// Used as next carry in.
    logic carryvalid;

// Shifter
	logic [LENGTH-1:0] a_shift;
	assign a_shift = op1<<1;

// Final Flag Assignments
    assign zero_flag = & zero_flagspan; // AND all zero flag bits and set
    assign sign_flag = out[LENGTH - 1]; // Sets the sign of the number.
    assign overflow_flag = (op1[LENGTH - 1] ~^ op2[LENGTH - 1]) & (out[LENGTH - 1] ^ op1[LENGTH - 1]); // Compares the final output length to the initial value lengths.
    assign carryvalid = (~operation[0] & operation[2]) | ((operation[1] & ~operation[2]) & operation[0]); // Final Carry in

    // Temporary ALU Output Storage
	logic [LENGTH-1:0] temp_out;

    // Calculate the Minterm for shift operation
    logic MintermShift;
	assign MintermShift = mode & operation[2] & (~operation[1]) & operation[0];

    // Select the proper final output.
	assign out = MintermShift ? a_shift : temp_out;

	// Begin Generate
    genvar i;
    generate
        for(i = 0; i < LENGTH; i = i+1) begin: g
		//	Begin instantiation of other ALU bits.
            if (i == 0) begin: adder
                OnebitALU_128 alu(
                    .a(op1[i]), // i bit of x
                    .b(op2[i]), // i bit of y
                    .operation(operation), //OpCode
                    .mode(mode), // Logic or Arithmetic
                    .cin(carryvalid), // Carry in
                    .out(temp_out[i]), // Output at i bit
                    .carry_flag(carry_flagspan[i]), // Carry bit at i
                    .zero_flag(zero_flagspan[i]) // Zero flag at i
                );	// First ALU initialization
            end else begin: adder
                OnebitALU_128 alu(
                    .a(op1[i]), // i bit of x
                    .b(op2[i]), // i bit of y
                    .operation(operation), //OpCode
                    .mode(mode), // Logic or Arithmetic
                    .cin(carry_flagspan[i-1]), // Carry in
                    .out(temp_out[i]), // Output at i bit
                    .carry_flag(carry_flagspan[i]), // Carry bit at i
                    .zero_flag(zero_flagspan[i]) // Zero flag at i
                );
            end
        end
    endgenerate

	// Assign proper carry out value.
	mux2to1 CarryOutFlagSelect (
	.a (op1[LENGTH - 1]),
	.b (carry_flagspan[LENGTH - 1]),
	.sel (MintermShift),
	.out (carry_flag)
	);

endmodule
