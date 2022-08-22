module PortaAND(Entrada1, Entrada2, Saida);
input wire Entrada1;
input wire Entrada2;
output reg Saida;
always @(*)begin
 Saida = Entrada1 & Entrada2;
end
endmodule
