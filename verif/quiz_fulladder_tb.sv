module fulladder_tb();
	
	logic x ;
	logic y ;
	logic cin ;
	logic sum ;
	logic cout ;
	
	fulladder dut_inst (.*);
	
	initial begin
		$monitor ("[@%4t ns] x: %b, y: %b, cin: %b ==>
					cout: %b, sum: %b", $time, x, y, cin, cout, sum );
	end;
	
	initial begin
		$system("clear; echo; echo");
		for ( int i = 0; i<8; i++) begin
			{x, y, cin} < = i[2:0];
			$display();
			#200;
		end
		$system("echo; echo; echo");
		$finish;
	end
endmodule