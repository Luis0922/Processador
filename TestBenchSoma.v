module TestBenchSoma;
reg [7:0] Entrada1;
reg [7:0] Entrada2;
wire [7:0] Saida;
initial begin
Entrada1 = 8'b10001000; Entrada2 = 8'b01110111;
#1 Entrada1 = 8'b10001000; Entrada2 = 1;
end
initial begin
$monitor("Time=%0d Entrada1=%b Entrada2=%b Saida=%b",
$time, Entrada1, Entrada2, Saida);
end
Soma Soma1(
 .Entrada1(Entrada1),
 .Entrada2(Entrada2),
 .Saida(Saida)
 );
endmodule
