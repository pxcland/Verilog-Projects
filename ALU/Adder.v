`timescale 1ns / 1ps
module Adder(A, B, Cin, S, Cout);
	input[7:0] A, B;
	input Cin;
	output wire[7:0] S;
	output wire Cout;
	
	assign {Cout, S} = A + B + Cin;

endmodule
