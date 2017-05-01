`timescale 1ns / 1ps
module ALU(A, B, Cin, Op, Out, Cout, Zero, Sign);
	input[7:0] A, B;
	input Cin;
	//011-A+B, 111-A-B, 000-NOT A, 001-A AND B, 010-A OR B, 100-A XOR B
	input[2:0] Op;
	output reg[7:0] Out;
	output Cout;
	output reg Zero;
	output reg Sign;
	
	wire FinalCin;			//Final value of Cin fed to ALU after XOR
	wire[7:0] FinalB;		//Final value of B fed to ALU after XOR
	wire[7:0] AddResult;
	wire[7:0] LogicResult;
	
	Adder DEV_ADD(A, FinalB, FinalCin, AddResult, Cout);
	LogicUnit DEV_LOG(A, B, Op, LogicResult);
	
	
	assign FinalCin = Cin ^ Op[2];	//Cin XOR Subtract Line
	assign FinalB = B ^ {8{Op[2]}};	//XOR B with Subtract Line
	
	
	always @ (Op or AddResult or LogicResult) begin
		if(Op == 3'b011 || Op == 3'b111)
			Out <= AddResult;
		else if(Op == 3'b000 || Op == 3'b001 || Op == 3'b010 || Op == 3'b100)
			Out <= LogicResult;
		else
			Out <= 8'b00000000;
	end
		
	
	always @ (Out) begin
		if(Out == 8'b00000000)
			Zero <= 1'b1;
		else
			Zero <= 1'b0;
		
		Sign <= Out[7];
	end
endmodule
