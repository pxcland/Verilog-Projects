`timescale 1ns / 1ps
module LogicUnit(A, B, Op, Out);
	input[7:0] A, B;
	input[2:0] Op;	//000-NOT A, 001-A AND B, 010-A OR B, 100-A XOR B
	output reg[7:0] Out;
	
	always @ (Op or A or B) begin
		case(Op)
			3'b000: Out <= ~A;
			3'b001: Out <= A & B;
			3'b010: Out <= A | B;
			3'b100: Out <= A ^ B;
		endcase 
	end
	
endmodule
