 module full_adder_4bit;

    logic         cin ;
    logic [4-1:0] in_a;
    logic [4-1:0] in_b;
    logic [4-1:0] sum ;
    logic         cout;
    
    
    full_adder_4bit dut
    (
        .cin  (cin),
        .cout (cout),
        .in_a (in_a),
        .in_b (in_b),
        .sum  (sum)
    );
    
    initial begin
        #10;
        cin  <= 1'b1;
        in_a <= 4'b0001;
        in_b <= 4'b0011;
        #10;
    end
    
endmodule