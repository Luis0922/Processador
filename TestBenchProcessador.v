module TestBenchProcessador;
reg clock, reset;
integer i;

initial begin:stop_at
	#59 $stop;
end

initial begin:Init
	reset = 0;
	clock = 0;
	i=0;
end

always begin:main_process
	#1 clock = ~clock;
end

always @(posedge clock)
begin
	i = i + 1;
	$display("---------------------------------------------------------------------------------------------------------------");
	$display("Saida PC: %b",Processador1.pc1.endereco);
	$display("Clock: %b Timer: %0d Reset: %b", clock, $time, reset);
	$display("Instrucao: %b",Processador1.memoria_de_instrucoes1.instrucao);
	$display("Controle: Halt=%b RegFonte=%b RegDst=%b EscReg=%b ULA1=%b ULA2=%b Beq=%b ULAOp=%b Salto=%b Set=%b LerMem=%b EscMem=%b",
				Processador1.SinalDeControle1.Halt, Processador1.SinalDeControle1.RegFonte, Processador1.SinalDeControle1.RegDst, Processador1.SinalDeControle1.EscReg, Processador1.SinalDeControle1.ULA1, Processador1.ULA2, Processador1.SinalDeControle1.Beq, Processador1.SinalDeControle1.ULAOp, Processador1.SinalDeControle1.Salto, Processador1.SinalDeControle1.Set, Processador1.SinalDeControle1.LerMem, Processador1.SinalDeControle1.EscMem);
	$display("RegLido1: %d RegLido2: %d DadoEscr: %d RegEsc:%d EscReg:%d Dado1: %d Dado2: %d DadoReg3: %d",
				Processador1.Registradores1.RegLido1, Processador1.Registradores1.RegLido2, Processador1.Registradores1.DadoEscr, Processador1.Registradores1.RegEsc, Processador1.Registradores1.EscReg, Processador1.Registradores1.Dado1, Processador1.Registradores1.Dado2, Processador1.Registradores1.DadoReg4);
	$display("Registradores: %d %d %d %d %d %d %d %d", 
	Processador1.Registradores1.Registrador[3'b000], Processador1.Registradores1.Registrador[3'b001], Processador1.Registradores1.Registrador[3'b010], Processador1.Registradores1.Registrador[3'b011], Processador1.Registradores1.Registrador[3'b100], Processador1.Registradores1.Registrador[3'b101], Processador1.Registradores1.Registrador[3'b110], Processador1.Registradores1.Registrador[3'b111]);
	$display("ULA: Zero: %b Resultado: %b Set: %b",Processador1.ZeroULA, Processador1.ResultadoULA, Processador1.SetULA);
	$display("MUX: MUX antes do Reg: %d MUX Entrada ULA1: %d MUX Entrada ULA2: %d MUX Set: %d MUX Dado Escr: %d MUX Beq: %d MUX Jump:%d",
				Processador1.SaidaMUX3bReg, Processador1.Entrada1ULA, Processador1.Entrada2ULA, Processador1.SaidaMUXSetResultado, Processador1.SaidaMUXDadoEscr, Processador1.SaidaMUXBeq, Processador1.SaidaMUXJump);
	$display("");
	$display("Memorias:");
	$display("Endereco Mem: %d DadoEsc: %d DadoLido: %d EscMem: %d LerMem: %d",
				Processador1.ResultadoULA, Processador1.Dado1, Processador1.DadoLido, Processador1.EscMem, Processador1.LerMem);
	for(i=0;i<8;i=i+1)
		$display("%d: %d",i,Processador1.Memoria_de_Dados1.Memoria_dados[i]);
end

Processador Processador1(
 .clock(clock),
 .reset(reset)
);
 
endmodule