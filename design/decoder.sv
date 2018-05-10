module decoder(
    input [31:0] read_data,
    output logic [7:0] L
    );
    
    always_comb begin
        case (I)
        3'd0 : L = 8'b00000001;  
        3'd1 : L = 8'b00000010;
        3'd2 : L = 8'b00000100;
        3'd3 : L = 8'b00001000;
        3'd4 : L = 8'b00010000;
        3'd5 : L = 8'b00100000;
        3'd6 : L = 8'b01000000;
        default : L = 8'b10000000;
		endcase
		
	end
	
endmodule
