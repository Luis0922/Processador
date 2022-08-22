module TestBenchReg;
reg [1:0] RegLido1;
reg [1:0] RegLido2;
reg [2:0] RegEsc;
reg EscReg;
reg [7:0] DadoEscr;
reg clock;
wire [7:0] Dado1;
wire [7:0] Dado2;
initial begin
clock=1;RegLido1=2'b00;RegLido2=2'b10;RegEsc=3'b010;EscReg=0;DadoEscr=8'b00000000;
#1 clock=0;RegLido1=2'b01;RegLido2=2'b10;RegEsc=3'b010;EscReg=1;DadoEscr=8'b11111111;
#1 clock=1;RegLido1=2'b11;RegLido2=2'b10;RegEsc=3'b010;EscReg=1;DadoEscr=8'b10101010;
#1 clock=0;RegLido1=2'b01;RegLido2=2'b10;RegEsc=3'b010;EscReg=1;DadoEscr=8'b11111111;
#1 clock=1;RegLido1=2'b10;RegLido2=2'b10;RegEsc=3'b010;EscReg=0;DadoEscr=8'b10000001;
end
initial begin
$monitor("Time=%0d clock=%b Registrador[%b]=%b Registrador[%b]=%b EscReg=%b Reg a ser escrito: %b DadoEscr=%b",
$time, clock, RegLido1, Dado1, RegLido2, Dado2, EscReg, RegEsc, DadoEscr);
end
Registradores Reg1(
	.RegLido1(RegLido1),
	.RegLido2(RegLido2),
	.DadoEscr(DadoEscr),
	.RegEsc(RegEsc),
	.EscReg(EscReg),
	.Dado1(Dado1),
	.Dado2(Dado2),
	.clock(clock)
	);
endmodule
