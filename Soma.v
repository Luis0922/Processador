module Soma (Entrada1, Entrada2, Saida);
input wire [7:0] Entrada1;
input wire [7:0] Entrada2;
output reg [7:0] Saida;
always @(*) begin 
Saida = Entrada1 + Entrada2;
end 
endmodule