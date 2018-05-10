module Register_File (clk, R1, R2, W, Data_in, W_en, Out1, Out2, reset);

	input logic clk;
	input logic [5:0] R1;
	input logic [5:0] R2;
	input logic [5:0] W;
	input logic reset;

	input logic W_en;

	input  logic [31:0] Data_in;
	output logic [31:0] Out1;
	output logic [31:0] Out2;

	logic [63:0][31:0] rf; //reg-file


	

	always_ff @(clk, posedge reset)
		begin	
			if(reset) begin	
				$display ("Resetting");
				for(int i = 0; i<64; i++) begin	//assign all 0 in reg-file
					rf[i] <= 32'b0;
				end
			end
			if (~clk & W_en) begin				//if not clk, and W_en are on, Datain goes to reg-file
				rf[W] <= Data_in;
			end else if (clk) begin				//if clk is on, rf based on the address of R1 and R2, goes to Out1 and Out2
				Out1 <= rf[R1];
				Out2 <= rf[R2];
			end
			
		end
endmodule
