module TestBechSinalDeControle;
reg [3:0] OpCode;
reg clock;
wire [3:0] ULAOp;
wire Halt, RegFonte, RegDst, EscReg, ULA1, ULA2, Beq, Salto, Set, LerMem, EscMem;
initial begin
	clock=0; OpCode=3'b000;
	#1 clock=1; OpCode=3'b001;
	#1 clock=0; OpCode=3'b001;
	#1 clock=1; OpCode=3'b010;
	#1 clock=0; OpCode=3'b010;
	#1 clock=1; OpCode=3'b011;
	#1 clock=0; OpCode=3'b011;
	#1 clock=1; OpCode=3'b100;
	#1 clock=0; OpCode=3'b100;
	#1 clock=1; OpCode=3'b101;
	#1 clock=0; OpCode=3'b101;
	#1 clock=1; OpCode=3'b111;
	#1 clock=0; OpCode=3'b111;
end
initial begin
	$monitor("time=%0d Clock=%b OpCode=%b Halt=%b, RegFonte=%b, RegDst=%b, EscReg=%b, ULA1=%b, ULA2=%b, Beq=%b, Salto=%b, Set=%b, LerMem=%b, EscMem=%b",
	$time, clock, OpCode, Halt, RegFonte, RegDst, EscReg, ULA1, ULA2, Beq, Salto, Set, LerMem, EscMem);
end
SinalDeControle SinalDeControle1(
	.OpCode(OpCode), 
	.clock(clock), 
	.Halt(Halt), 
	.RegFonte(RegFonte), 
	.RegDst(RegDst),	
	.EscReg(EscReg),
	.ULA1(ULA1), 
	.ULA2(ULA2), 
	.Beq(Beq), 
	.ULAOp(ULAOp), 
	.Salto(Salto), 
	.Set(Set), 
	.LerMem(LerMem), 
	.EscMem(EscMem)
	);
endmodule
