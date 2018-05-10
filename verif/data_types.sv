module data_types();
	bit	data;
	initial begin
		data = {32{4'b1111}};
		$display("data 		= %0d",data);
		#1 $finish;
	end
endmodule