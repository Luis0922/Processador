module TestBenchMUX;
reg [7:0] Entrada1;
reg [7:0] Entrada2;
reg SinalControle;
wire [7:0]Saida;
initial begin
 Entrada1 = 8'b10101010; Entrada2 = 8'b111111101; SinalControle=0;
 #1 Entrada1 = 8'b10101010; Entrada2 = 8'b111111101; SinalControle=1; 
end
initial begin
 $monitor("Time=%0d Entrada1=%b Entrada2=%b SinalControle=%b Saida=%b",
 $time, Entrada1, Entrada2, SinalControle, Saida);
end
MUX MUX1(
 .Entrada1(Entrada1),
 .Entrada2(Entrada2),
 .SinalControle(SinalControle),
 .Saida(Saida)
 );
endmodule
