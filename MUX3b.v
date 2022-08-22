module MUX3b(Entrada1, Entrada2, SinalControle, ULAOp, Saida);
input wire [1:0] Entrada1;
input wire [2:0] Entrada2;
input [2:0] ULAOp;
input SinalControle;
output reg [2:0] Saida;
always @(*)begin
	if(ULAOp == 3'b101) begin
		Saida = 3'b101;
	end
	else begin
		 if(SinalControle == 1) begin
			Saida = Entrada1;
		 end
		 if(SinalControle == 0) begin
			Saida = Entrada2;
		 end
	 end
end
endmodule
