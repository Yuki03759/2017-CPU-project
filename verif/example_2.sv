module example_2();

	logic 	[5:0] packed_arr;
	logic 		  unpacked_arr[5:0];
	
	initial begin
		$system("clear; echo; echo");
		packed_arr = 6'b010011;
		unpacked_arr = {1'b1,2,1024,4,4,0};
		
		$display("Packed Array = %b", packed_arr);
		
		$write("Unpacked Array = " );
		foreach( unpacked_arr[i] )
			$write("%b", unpacked_arr[i]);
		$write("\n");
		#100;
		$system("echo; echo; echo");
		$finish;
		
	end
endmodule