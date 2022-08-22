module TestBenchMUX3b;
reg [1:0] Entrada1;
reg [2:0] Entrada2;
reg SinalControle;
wire [2:0] Saida;
initial begin
 Entrada1 = 2'b10; Entrada2 = 3'b101; SinalControle = 0;
 #1 Entrada1 = 2'b10; Entrada2 = 3'b101; SinalControle = 1;
end
initial begin
 $monitor("Time=%0d Entrada1=%b Entrada2=%b SinalControle=%b Saida=%b",
 $time, Entrada1, Entrada2, SinalControle, Saida);
end
MUX3b MUX3b1(
 .Entrada1(Entrada1),
 .Entrada2(Entrada2),
 .SinalControle(SinalControle),
 .Saida(Saida)
 );
endmodule 