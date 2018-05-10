   //////////////////////////////////////////////////////////////////////////////////
// Company: ZotComm
// Engineer: David Tiao
// 
// Create Date: 8/24/2017
// Design Name: 128 Bit ALU
// Module Name: 128BitALU
// Project Name: Midterm Project Summer 2 2017
// 
// Dependencies: Mux8to1, FullAdder, Mux2to1, 1BitALU
// 
// Revision: 1
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
   
   module alu_128bitex (x, y, mode, out, operation, carry_flag, zero_flag, sign_flag, overflow_flag);
    
	parameter LENGTH = 128;

    input logic [LENGTH -1:0] x;
    input logic [LENGTH -1:0] y;
    input logic [2:0] operation;
    input logic mode;
    output logic [LENGTH -1:0] out;
    output logic carry_flag;
    output logic zero_flag;
    output logic overflow_flag;
    output logic sign_flag;

    logic [LENGTH-1:0] carry_flagspan, zero_flagspan;
	
    logic carryvalid;

   

    assign zero_flag = & zero_flagspan;
    assign carry_flag = carry_flagspan[LENGTH - 1];
    assign sign_flag = out[LENGTH - 1];
    assign overflow_flag = (x[LENGTH - 1] ~^ y[LENGTH - 1]) & (out[LENGTH - 1] ^ x[LENGTH - 1]);
    assign carryvalid = (~operation[0] & operation[2]) |((operation[1] & ~operation[2]) & operation[0]);
	
    genvar i;
    generate
        for(i = 0; i < LENGTH; i = i+1) begin: g
            if (i == 0) begin: adder
                OnebitALU alu(
                    .a(x[i]),
                    .b(y[i]),
                    .operation(operation),
                    .mode(mode),
                    .cin(carryvalid),
                    .out(out[i]),
                    .carry_flag(carry_flagspan[i]),
                    .zero_flag(zero_flagspan[i])
                );
            end else begin: adder
                OnebitALU alu(
                    .a(x[i]),
                    .b(y[i]),
                    .operation(operation),
                    .mode(mode),
                    .cin(carry_flagspan[i-1]),
                    .out(out[i]),
                    .carry_flag(carry_flagspan[i]),
                    .zero_flag(zero_flagspan[i])
                );
				
            end
			
			/*
			shifter Shift (
				
				.c_out (x[i]),
				.c_in  (carry_flagspan[i-1]),
				.a	   (cin),
				.z	   (x[i])
				
				);
				*/
        end
    endgenerate
endmodule 

