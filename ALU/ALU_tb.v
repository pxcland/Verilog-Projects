`timescale 1ns / 1ps

module ALU_tb();
	reg[7:0] A, B;
	reg Cin;
	reg[2:0] Op;
	wire[7:0] Out;
	wire Cout;
	wire Zero;
	wire Sign;
	
	ALU DUT(A, B, Cin, Op, Out, Cout, Zero, Sign);
	
	initial begin
		A <= 8'b11110011;
		B <= 8'b11111111;
		Cin <= 1'b1;
		Op <= 3'b001;
		#5 $finish;
	end
	
endmodule
