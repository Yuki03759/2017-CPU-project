//////////////////////////////////////////////////////////////////////////////////
// Company: ZotComm
// Engineer: David Tiao
//
// Create Date: 8/24/2017
// Design Name: One Bit ALU
// Module Name: OneBitALU
// Project Name: Midterm Project Summer 2 2017
//
// Dependencies: Mux8to1, FullAdder, Mux2to1
//
// Revision: 1
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module ALU32Bit (a, b, mode, out, cin, operation, carry_flag, zero_flag, shiftleft);

	parameter LENGTH = 32;

    // Define all inputs and outputs.
    input logic [LENGTH-1:0] a;
    input logic [LENGTH-1:0] b;
    input logic [2:0] operation;
	input logic [LENGTH-1:0] shiftleft;
    input logic mode;
    input logic cin;
    output logic [LENGTH-1:0] out;
    output logic carry_flag;
    output logic zero_flag;
    //output logic sign_flag;
    //output logic overflow_flag;

    // Carry Flags
    logic carry_flags;

	// Shift # of Times
	integer shiftint;
	always @ (shiftint)
		shiftint = shiftleft;

    // Intermediate Values
    assign x1 = a & b; // Bitwise AND
    assign x2 = a | b; //Bitwise OR
    assign x3 = (a ^ b); //Bitwise XOR
    assign x4 = (~ a);    //NOT a

    // Aritmetic MUX Values
    assign z1 = ~ b; // NOT B
    assign z2 = 32'b0; // 0
    assign z3 = 32'b1; // -1

    // Mux Outputs
    logic  [LENGTH-1:0] muxoutarithmetic;
    logic  [LENGTH-1:0] logicout;

    // FA Output
    logic [LENGTH-1:0] faoutput;

    // Zero Flag Output
    assign zero_flag = ~out;

    // Arithmetic Mux
    mux8to1 Arithmetic (
        .a (b[LENGTH-1:0]),  // Add
        .b ('0), // NOT USED
        .c (z2), // MOV
        .d (z1 + 1), // SUB
        .e (z2), // LOAD
        .f ('0), // NOT USED
        .g ('0),   // STORE
        .h ('0), // NOT USED
        .sel (operation), // OpCode
        .out (muxoutarithmetic) //Mux Out
    );


    // Logic Mux
    mux8to1 Logic (
        .a (x1),  // A & B
        .b (x2), // A | B
        .c (x3), // A ^ B
        .d (x4), // Invert A
        .e ('0), // NOT USED
        .f (a <<< shiftint), // SHIFT LEFT
        .g ('0),   // NOT USED
        .h ('0),  // NOP
        .sel (operation), // OpCode
        .out (logicout) // Mux Out
    );

    // Full Adder
    fulladder32 FA (
        .a (a[LENGTH-1:0]),
        .b (muxoutarithmetic[LENGTH-1:0]),
        .c_in (cin),
        .sum (faoutput[LENGTH-1:0]),
        .c_out (carry_flag)

    );

    // Select Logic or Arithmetic Output
    mux2to1_32bit LogicOrArithmetic (
        .a (faoutput[LENGTH-1]),
        .b (logicout[LENGTH-1]),
        .sel (mode),
        .out (out[LENGTH-1])
    );
endmodule
		