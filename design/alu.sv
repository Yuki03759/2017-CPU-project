module alu(a, b, operation, out);


	input [31:0] a; 
	input [31:0] b;
	input [5:0] operation;
	output [31:0] out;
	
			
	//add/sub	
	//---------------------------------------------------------------------------
	reg [31:0]	AdderInputB;
	reg			AdderCarryIn;
	reg [31:0]	AdderOut;
								
	//and/or/xor/nor 
	//---------------------------------------------------------------------------

	
	//slt	
	//---------------------------------------------------------------------------
	reg [31:0] SltOut;
	
	//----------------------------------------------------------------------------
	//branches
	reg Sign;
	reg Zero;
	
	always @(*) begin
		//add/sub		
		if (operation[1]) begin
			AdderInputB = ~b;
		end else begin
			AdderInputB = b;
		end
		
		AdderOut = a + AdderInputB + operation[1];
		
		//logic
		case (operation[2:0])
			3'b000:						//ADD
			out = a & b;		
			//3'b001:					//Not used
			
			3'b010:						//Move
			out = 32'b0;			
			3'b011:						//SUB
			out = a + b + 1; 
			3'b100:						//LOAD
			out = 32'b0;
			3'b101:						//NOT USED
			out = 32'b0;
			3'b110:						//STORE
			out = 32'b0;		
			3'b111:
			out = 32'b0;			//NOT USED
		endcase
*/

		//set less thans
		//------------------------------------------------
		if (operation[0]) begin
			SltOut = a < b;
		end else begin
			SltOut = $signed(a) < $signed(b);
		end

		//branches and jumps
		//---------------------------------------------------------

		
		Sign = a[31];
		Zero = a[31:0] == 32'b0;

	
		
	
	
		//calculate final alu result
		//---------------------------------------------------------


	end
			
endmodule