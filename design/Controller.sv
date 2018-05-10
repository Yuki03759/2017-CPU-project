module controller(

	input [31:0] CODE, //Define instruction memory input
	input clk,	//Defines clk for testbenching
	output [3:0] Operation, //Defining function operation for ALU
	logic Mux1, 	//Defines all wires and outputs
	logic Mux2,
	logic WE1,
	logic WE2,
	output RI,
	output [5:0] RS,
	output [5:0] RD,
	output [5:0] RT,
	output [8:0] IMM,
	output [14:0] Op2

	);

	alias RI = CODE[31]; //Alias for the R type or I type
	alias RS = CODE[30:25]; //Alias for RS bits
	alias RD = CODE[24:19]; //Alias for RD bits
	alias Operation = CODE[18:15]; //Alias Function
	alias RT = CODE[14:9]; //Alias RT bits
	alias IMM = CODE[8:0]; //Alias Immediate bits
	alias Op2 = CODE[14:0]; //Alias RT and IMM bits combined

	assign Mux1 = RI; //Assigns the Mux1 output as the RI bit so it can be used as the select bit for Mux1

	always @(negedge clk,Operation) begin //Creates always statement that holds the condition that if the function bit is No Op or Store, it sets the write enable bit for Reg File to 0
		if (Operation == 4'b1111) begin //For NOP
			assign WE1 = 1'b0;
			end
		else if (Operation == 4'b0110) begin //For Store
			assign WE1 = 1'b0;
			end
		else begin //All other operations set WE1 to 1
			assign WE1 = 1'b1;
			end
		end

	always @* begin //Always statment that sets the output to take from the Data Memory if operation is load
		if (Operation == 4'b0100) begin // For Load
			assign Mux2 = 1'b0;
			end
		else begin //If not take from Reg File value
			assign Mux2 = 1'b1;
			end
		end


	always @* begin //Always statement that enables Data memory when operation is Store
		if (Operation == 4'b0110) begin //If from Data memory
			assign WE2 = 1'b1;
			end
		else begin //If not from Data Memory
			assign WE2 = 1'b0;
			end
		end


endmodule
