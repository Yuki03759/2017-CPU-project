module   full_adder_4bit (
          cin,
          cout,
          in_a,
          in_b,
          sum
    );
    
    parameter   reg_size = 4;
    
    input   cin;
    input   [reg_size-1:0] in_a;
    input   [reg_size-1:0] in_b;
    output  [reg_size-1:0] sum;
    output  cout;
    
    assign   {cout,sum} = in_a + in_b + cin;
    
endmodule