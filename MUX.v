module MUX(Entrada1, Entrada2, SinalControle, Saida);
input wire [7:0] Entrada1;
input wire [7:0] Entrada2;
input SinalControle;
output reg [7:0] Saida;
always @(*)begin 
 if(SinalControle == 0) begin
	Saida = Entrada2;
 end
 if(SinalControle == 1) begin
	Saida = Entrada1;
 end
end
endmodule
 
