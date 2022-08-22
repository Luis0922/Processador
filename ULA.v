module ULA(Entrada1, Entrada2, Entrada3, Zero, Resultado, Set, ULAOp);
input wire [7:0] Entrada1;
input wire [7:0] Entrada2;
input wire [7:0] Entrada3;
input [2:0] ULAOp;
reg signed[7:0] E1;
reg signed [7:0] E2; 
output  reg Zero;
output reg [7:0] Resultado;
output reg [7:0] Set;
always @(*)begin 
	E1 = Entrada1; // Transforma a Entrada1 em um número binario de 8 bits com sinal
	E2 = Entrada2; // Transforma a Entrada2 em um número binario de 8 bits com sinal
	if(ULAOp == 3'b010) begin
		Resultado = Entrada1 + Entrada3;
		Set = 8'bxxxxxxxx;	// No add não utiliza a saida Set
		Zero = 0;
	end
	if(ULAOp == 3'b001 || ULAOp == 3'b000) begin // sw OU lw
		Resultado = Entrada1 + Entrada2; // Soma as Entradas 1 e 2
		Set = 8'bxxxxxxxx;	// No add não utiliza a saida Set
		Zero = 1'bx;
	end
	if(ULAOp == 3'b101) begin // slt
		if(E2 - E1 < 0) begin
			Set = 8'b00000001; // Se Entrada1 < Entrada2 o set é 1
			Resultado = 8'bxxxxxxxx; // No slt não utiliza a saida Resultado
			Zero = 0;
		end
		else begin 
			Set = 8'b00000000; // Se Entrada1 > Entrada2 o set é 0
			Resultado = 8'bxxxxxxxx; // No slt não utiliza a saida Resultado
		end
	end
	if(ULAOp == 3'b011) begin // beq
			Set = 8'bxxxxxxxx; // No beq não utiliza a saida Set
			Resultado = 8'bxxxxxxxx; // No beq não utiliza a saida Resultado
			if(Entrada1 == Entrada3) begin
				Zero = 1;
			end
			else begin
				Zero = 0;
			end
	end
end
endmodule
