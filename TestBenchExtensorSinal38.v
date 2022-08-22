module TestBenchExtensorSinal38;
reg [2:0] Entrada;
wire [7:0] Saida;
initial begin
Entrada = 3'b101;
#1 Entrada = 3'b001;
#1 Entrada = 3'b100;
end
initial begin
$monitor("Time=%0d Entrada=%b Saida=%b",
$time, Entrada, Saida);
end
ExtensorSinal38 ExtensorSinal381(
 .Entrada(Entrada),
 .Saida(Saida)
 );
endmodule
