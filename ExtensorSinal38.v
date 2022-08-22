module ExtensorSinal38(Entrada, Saida);
input wire [2:0] Entrada;
output reg [7:0] Saida;
always @(*)begin
 Saida = Entrada;
end
endmodule
