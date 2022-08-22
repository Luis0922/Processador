module MUX3E(Entrada1, Entrada2, Entrada3, SinalControle1, SinalControle2, Saida);
input wire [7:0] Entrada1;
input wire [7:0] Entrada2;
input wire [7:0] Entrada3;
input wire [2:0] SinalControle1;
input SinalControle2;
output reg [7:0] Saida;
always @(*)begin
	if(SinalControle1 == 3'b010) begin
		Saida = Entrada3;
	end
	else begin
	 if(SinalControle2 == 0) begin
		Saida = Entrada2;
	 end
	 if(SinalControle2 == 1) begin
		Saida = Entrada1;
	 end
	end
end
endmodule