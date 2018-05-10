module test();

	bit[3:0] nibble[];
	bit a;
	
	initial begin
		$system("clear; echo; echo");
		$display ("nibble.size = %g", nibble.size() );
		
		nibble = new [ 8];
		
		nibble[0] = 4'hA;
		nibble[1] = 4'hB;
		nibble[2] = 4'hC;
		nibble[3] = 4'hD;
		nibble[4] = 4'hE;
		nibble[5] = 4'hF;
		
		$write("nibble.size = %g, Data=", nibble.size() );
		for( int i = 0; i<nibble.size(); i++ )
			$write("%H ", nibble [i] );
		$write("\n");
		
		nibble = new[ 4] (nibble);
		$write("nibble/size = %g, Data= ", nibble.size() );
		for (int i=0; i<nibble.size(); i++)
			$write("%H ", nibble[i]) ;
		$write("\n");
		
		nibble.delete();
		$write("nibble.size = %g, Data =", nibble.size() );
		for (int i = 0; i<nibble.size (); i++ )
			$write("%H ", nibble[i] );
		$write ("\n");
		
		$system("echo; echo; echo");
		$finish;
	end
endmodule
		