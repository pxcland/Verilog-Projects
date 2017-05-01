`timescale 1ns / 1ps

module Adder_tb();
	reg[7:0] A, B;
	reg Cin;
	wire Cout;
	wire[7:0] S;
	integer i, j, k;
	
	
	Adder DUT(A, B, Cin, S, Cout);
	
	initial begin
		for(i = 0; i <= 1; i = i+1) begin
			for(j = 0; j <= 255; j = j+1) begin
				for(k = 0; k <= 255; k = k+1) begin
					Cin <= i;
					A <= j;
					B <= k;
					#5;
				end
			end
		end
		#0 $finish;
	end
endmodule
