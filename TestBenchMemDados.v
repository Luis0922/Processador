module TestBenchMemDados;
reg [7:0]Endereco_mem; // Le o Endereço
reg [7:0]DadoEscr; // Le o dado que vai ser escrito na memoria
reg EscMem, LerMem, clock;
wire [7:0] DadoLido;
initial begin
clock=1; Endereco_mem=8'b00000000; DadoEscr=8'b11111111; EscMem=1; LerMem=0;
#1 clock=0; Endereco_mem=8'b00000000; DadoEscr=8'b10101010; EscMem=0; LerMem=1;
#1 clock=1; Endereco_mem=8'b00000000; DadoEscr=8'b10101010; EscMem=1; LerMem=0;
#1 clock=0; Endereco_mem=8'b00000000; DadoEscr=8'b10000000; EscMem=1; LerMem=1;
#1 clock=1;
#1 clock=0;
#1 clock=1; EscMem=0;
#1 clock=0; Endereco_mem=8'b00000001; DadoEscr=8'b10000000; EscMem=0; LerMem=1;
end
initial begin
$monitor("Time=%0d Clock=%b Memoria_dados[%b]=%b DadoEscr=%b EscMem=%b LerMem=%b", 
$time, clock, Endereco_mem, DadoLido, DadoEscr, EscMem, LerMem);
end
Memoria_de_Dados Memoria_de_Dados1(
.Endereco_mem (Endereco_mem),
.DadoEscr(DadoEscr), 
.DadoLido(DadoLido), 
.EscMem(EscMem), 
.LerMem(LerMem), 
.clock(clock)
);
endmodule
