module TestBenchMemInst;
reg clock;
reg [7:0] Endereco;
wire [7:0] Instrucao;
initial begin
clock=0; Endereco=8'b00000000;
#1 clock=1; Endereco=8'b00000001;
#1 clock=0; Endereco=8'b00000010;
#1 clock=1; Endereco=8'b00000011;
#1 clock=0; Endereco=8'b00000010;
#1 clock=1; Endereco=8'b00000011;
end
initial begin
$monitor ("Time=%0d clock=%b Endereco=%b Instrucao=%b", $time, clock, Endereco, Instrucao);
end
memoria_de_instrucoes memoria_de_instrucoes1(
	.endereco (Endereco),
	.clock (clock),
	.instrucao(Instrucao)
	);
endmodule