module SinalDeControle(OpCode, clock, reset, Halt, RegFonte, RegDst, 
EscReg, ULA1, ULA2, Beq, ULAOp, Salto, Set, LerMem, EscMem);
input [2:0] OpCode;
input clock, reset;
output reg [2:0] ULAOp;
output reg Halt, RegFonte, RegDst, EscReg, ULA1, ULA2, Beq, Salto, Set, LerMem, EscMem;
always @(*)//negedge clock  
begin
	if(OpCode == 3'b000) begin // lw
		Halt=0; 
		RegDst=1;
		RegFonte=0;
		EscMem=0; 
		LerMem=1; 
		Set=0;
		Salto=0; 
		Beq=0;
		ULA2=0; 
		ULA1=0; 
		EscReg=1;
		ULAOp=3'b000;
	end
	if(OpCode == 3'b001) begin // sw
		Halt=0; 
		RegDst=0;
		RegFonte=0; 
		EscMem=1; 
		LerMem=0; 
		Set=0; 
		Salto=0; 
		Beq=0;
		ULA2=0; 
		ULA1=0; 
		EscReg=0;
		ULAOp=3'b001;
	end
	if(OpCode == 3'b010) begin // add
		Halt=0; 
		RegDst=0; 
		RegFonte=1; 
		EscMem=0; 
		LerMem=0; 
		Set=1;
		Salto=0;
		Beq=0;
		ULA2=1; 
		ULA1=1; 
		EscReg=1;
		ULAOp=3'b010;
	end
	if(OpCode == 3'b011) begin // beq
		Halt=0; 
		RegDst=0;
		RegFonte=0;
		EscMem=0; 
		LerMem=0; 
		Set=0;
		Salto=0;
		Beq=1;
		ULA2=1; 
		ULA1=1; 
		EscReg=0;
		ULAOp=3'b011;
	end
	if(OpCode == 3'b100) begin // j
		Halt=0; 
		RegDst=0;
		RegFonte=0; 
		EscMem=0; 
		LerMem=0; 
		Set=0;
		Salto=1;
		Beq=0;
		ULA2=0; 
		ULA1=0; 
		EscReg=0; 
		ULAOp=3'b100;
	end
	if(OpCode == 3'b101) begin // slt
		Halt=0; 
		RegDst=0;
		RegFonte=1; 
		EscMem=0; 
		LerMem=0; 
		Set=0;
		Salto=0;
		Beq=0;
		ULA2=1; 
		ULA1=1; 
		EscReg=1;
		ULAOp=3'b101;
	end
	if(OpCode == 3'b111) begin // hlt
		Halt=1; 
		RegDst=0;  
		RegFonte=0; 
		EscMem=0; 
		LerMem=0; 
		Set=0; 
		Salto=0; 
		Beq=0; 
		ULA2=0; 
		ULA1=0; 
		EscReg=0; 
		ULAOp=3'b111;
	end
	if(reset) begin
	   Halt=1'bx; 
		RegDst=1'bx;  
		RegFonte=1'bx; 
		EscMem=1'bx; 
		LerMem=1'bx; 
		Set=1'bx; 
		Salto=1'bx; 
		Beq=1'bx; 
		ULA2=1'bx; 
		ULA1=1'bx; 
		EscReg=1'bx; 
		ULAOp=3'bxxx;
	end
end
endmodule
