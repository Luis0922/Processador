module TestBenchPortaAND;
reg Entrada1;
reg Entrada2;
wire Saida;
initial begin
 Entrada1=0; Entrada2=0;
 #1 Entrada1=0; Entrada2=1;
 #1 Entrada1=1; Entrada2=0;
 #1 Entrada1=1; Entrada2=1;
end
initial begin
$monitor("Time=%0d Entrada1=%b Entrada2=%b Saida=%b",
$time, Entrada1, Entrada2, Saida);
end
PortaAND PortaAND1(
 .Entrada1(Entrada1),
 .Entrada2(Entrada2),
 .Saida(Saida)
 );
endmodule 