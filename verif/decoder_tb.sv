module decoder_tb;

logic [2:0] I;
logic [7:0] L;

int a;

decoder DUT(
    I,
    L    
    );

initial begin
    I = 'd0;    
    for (a = 0; a < 8; a++) begin
        I = a;
        #10;
		$display ("value", I);
    end
end
		
endmodule

