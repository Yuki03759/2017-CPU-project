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


module OnebitALU_128 (a, b, mode, out, cin, operation, carry_flag, zero_flag);

    // Define all inputs and outputs.
    input logic a;
    input logic b;
    input logic [2:0] operation;
    input logic mode;
    input logic cin;
    output logic out;
    output logic carry_flag;
    output logic zero_flag;
    //output logic sign_flag;
    //output logic overflow_flag;

    // Carry Flags
    logic carry_flags;


    // Intermediate Values
    assign x1 = a & b; // Bitwise AND
    assign x2 = a | b; //Bitwise OR
    assign x3 = (a ^ b); //Bitwise XOR
    assign x4 = (~ a);    //NOT a

    // Aritmetic MUX Values
    assign z1 = ~ b; // NOT B
    assign z2 = 1'b0; // 0
    assign z3 = 1'b1; // -1
    // Mux Outputs
    logic  muxoutarithmetic;
    logic  logicout;

    // FA Output
    logic faoutput;

    // Zero Flag Output
    assign zero_flag = ~out;

    // Arithmetic Mux
    mux8to1 Arithmetic (
        .a (b),  // value b
        .b (z1), // NOT B
        .c (z2), // 0
        .d (z1), // NOT B
        .e (z2), // 0
        .f (z3), // 1
        .g (b),   // B
        .h (1'b0), // Blank
        .sel (operation), // OpCode
        .out (muxoutarithmetic) //Mux Out
    );


    // Logic Mux
    mux8to1 Logic (
        .a (x1),  // A & B
        .b (x2), // A | B
        .c (x3), // A ^ B
        .d (x4), // Invert A
        .e (1'b0), // ?
        .f (1'b0), // ?
        .g (1'b0),   // ?
        .h (1'b0),  // ?
        .sel (operation), // OpCode
        .out (logicout) // Mux Out
    );

    // Full Adder
    fulladder FA (
        .a (a),
        .b (muxoutarithmetic),
        .c_in (cin),
        .sum (faoutput),
        .c_out (carry_flag)
    );

    // Select Logic or Arithmetic Output
    mux2to1 LogicOrArithmetic (
        .a (faoutput),
        .b (logicout),
        .sel (mode),
        .out (out)
    );
endmodule
