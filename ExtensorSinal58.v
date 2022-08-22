module ExtensorSinal58(Entrada, Saida);
input wire [4:0] Entrada;
output reg [7:0] Saida;
always @(*)begin
 Saida = Entrada;
end
endmodule
