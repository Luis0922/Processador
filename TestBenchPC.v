module TestBenchPC;
 reg teste_clock;
 reg [7:0] teste_EntradaPC;
 wire [7:0] teste_SaidaPC;
 initial begin
 teste_EntradaPC=8'b00000000; 
 #1 teste_clock = 0;
 teste_EntradaPC=8'b00000001;
 #1 teste_clock = 1;
 teste_EntradaPC=8'b00000001;
 #1 teste_clock = 0;
 teste_EntradaPC=8'b00000010;
 #1 teste_clock = 1;
 teste_EntradaPC=8'b00000010;
 #1 teste_clock = 0;
  teste_EntradaPC=8'b00000011;
 #1 teste_clock = 1;
 teste_EntradaPC=8'b00000011;
 #1 teste_clock = 0;
 teste_EntradaPC=8'b00000100;
 #1 teste_clock = 1;
 teste_EntradaPC=8'b00000100;
 #1 teste_clock = 0;
 teste_EntradaPC=8'b00000101;
 #1 teste_clock = 1;
 teste_EntradaPC=8'b00000101;
 #1 teste_clock = 0;
 teste_EntradaPC=8'b00000110;
 #1 teste_clock = 1;
 teste_EntradaPC=8'b00000110;
 #1 teste_clock = 0;
 teste_EntradaPC=8'b00000110;
 #1 teste_clock = 1;
 teste_EntradaPC=8'b00000111;
 end
 initial begin
 $monitor("Time=%0d teste_clock=%b teste_EntradaPC=%b teste_SaidaPC=%b", $time, teste_clock, teste_EntradaPC, teste_SaidaPC);
 end
 pc pc1(
	.entrada (teste_EntradaPC), 
	.clock (teste_clock), 
	.endereco(teste_SaidaPC)
);

endmodule