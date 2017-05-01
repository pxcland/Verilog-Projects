`timescale 1ns / 1ps

module LogicUnit_tb();
	reg[7:0] A, B;
	reg[2:0] Op;
	wire[7:0] Out;
	
	LogicUnit DUT(A, B, Op, Out);
	
	initial begin
		A <= 8'b01010101;
		B <= 8'b11111111;
		Op <= 2'b000;
		#5 Op <= 2'b001;
		#5 Op <= 2'b010;
		#5 Op <= 2'b011;
		#5 $finish;
	end
endmodule
