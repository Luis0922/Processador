module TestBenchExtensorSinal58;
reg [4:0] Entrada;
wire [7:0] Saida;
initial begin
Entrada = 5'b11101;
#1 Entrada = 5'b00001;
#1 Entrada = 5'b10100;
end
initial begin
$monitor("Time=%0d Entrada=%b Saida=%b",
$time, Entrada, Saida);
end
ExtensorSinal58 ExtensorSinal581(
 .Entrada(Entrada),
 .Saida(Saida)
 );
endmodule