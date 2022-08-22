module TestBenchULA;
reg [7:0] Entrada1;
reg [7:0] Entrada2;
reg [3:0] ULAOp;
wire [7:0] Resultado;
wire [7:0]Set;
wire Zero;
initial begin
	Entrada1=8'b00000000; Entrada2=8'b11111111; ULAOp=3'b010; 
	#1 Entrada1=8'b00000001; Entrada2=8'b11111111; ULAOp=3'b010; 
	#1 Entrada1=8'b00000001; Entrada2=8'b11111111; ULAOp=3'b010; 
	#1 Entrada1=8'b00000000; Entrada2=8'b11111111; ULAOp=3'b101;
	#1 Entrada1=8'b11111111; Entrada2=8'b00000000; ULAOp=3'b101; 
	#1 Entrada1=8'b11111111; Entrada2=8'b00000000; ULAOp=3'b011;
	#1 Entrada1=8'b00000000; Entrada2=8'b00000000; ULAOp=3'b011;
	#1 Entrada1=8'b00000010; Entrada2=8'b11111111; ULAOp=3'b000;
	#1 Entrada1=8'b00000010; Entrada2=8'b00000001; ULAOp=3'b001;
end
initial begin
	$monitor("Time=%0d ULAOp=%b Entrada1=%b Entrada2=%b Resultado=%b Set=%b Zero=%b",
		$time, ULAOp, Entrada1, Entrada2, Resultado, Set, Zero);
end
ULA ULA1( 
	.Entrada1(Entrada1), 
	.Entrada2(Entrada2), 
	.Zero(Zero), 
	.Resultado(Resultado), 
	.Set(Set), 
	.ULAOp(ULAOp)
	);
endmodule