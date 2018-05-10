module Program_Counter (reset, clk, in, out);

	input reset;
	input clk;
	input [5:0] in;
	output logic [5:0] out;

	/*
	always_ff @ (posedge clk, out, in) begin			//clock
		in = in + 1;									//add
		out = in;
	end
*/
	
	
	always @ (posedge clk)
    begin
        if(reset)
            begin
                out <= 0;
            end
        else
            begin
                out <= in + 1;
            end             
    end
	
	
endmodule
