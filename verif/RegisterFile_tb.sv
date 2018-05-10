module RegisterFile_tb;

	logic [4:0] R1;
	logic [4:0] R2;
	logic [4:0] W;
	logic W_en;
	logic [15:0] Data_in;	
	logic [15:0] Out1;
	logic [15:0] Out2;
	//logic [15:0] Out1_val;
	//logic [15:0] Out2_val;
	logic [15:0] rf [32];
	
	RegisterFile dut
	( R1, R2, W, Data_in, W_en, Out1, Out2);
	
	initial begin
		#10;
		R1 = 5'b00001;
		R2 = 5'b00001;
		W  = 5'b00001;
		Data_in = 16'b0100000000000001;
		W_en = 1'b1;
		#10;
		W_en<=1'b0;
		$display (" rf ", Out1);
		#10;
	end
endmodule 
		