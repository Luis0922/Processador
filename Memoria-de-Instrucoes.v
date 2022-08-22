module memoria_de_instrucoes (endereco, clock, instrucao);
input clock; // Clock do pc
input [7:0] endereco; // Contador do pc
output reg [7:0] instrucao; // Instrução que vai sair
reg [7:0] memoria_instrucoes [51:0]; // 51 instruções de tamanho 8 bits
initial begin
  $readmemb("C:/Users/Usuario/Desktop/Processador/instrucoes.dat", memoria_instrucoes);
end
// instrucao recebe a instrução que está na posicao counter da memoria
always @(*) begin 
	instrucao = memoria_instrucoes[endereco];
end
endmodule
