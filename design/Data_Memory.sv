module Data_Memory (clk, W_en, address, write_data, read_data, reset);

	input logic reset;
	input logic W_en;
	input logic clk;
	input logic [31:0] address;
	input logic [31:0] write_data;
	output logic [31:0] read_data;

	logic [127:0][31:0] memory; 					//create data memory



	always_ff @(clk, posedge reset) begin		
		if(reset) begin								
			for(int i = 0; i<128; i++) begin	//assign value 0 on every memory
				memory[i] <= 32'b0;
			end
		end else if (~clk & W_en) begin			//if not clk and W_en is on, writing data goes to memory based on the address
			memory[address] <= write_data;
		end else if (clk) begin					//if clk is on, memory based on the address goes to readdata
			read_data <= memory[address];
		end
	end
endmodule
