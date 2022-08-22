module Processador(clock, reset);
input clock;
input reset;

wire [7:0] SaidaPC;
wire [7:0] Instrucao;
wire Halt, RegFonte, RegDst, EscReg, ULA1, ULA2, Beq, Salto, Set, LerMem, EscMem;
wire [2:0] ULAOp;
wire [2:0] SaidaMUX3bReg;
wire [7:0] SinalExtendido8bitsEntrada2MUX;
wire [7:0] Dado1;
wire [7:0] Dado2;
wire [7:0] DadoReg4;
wire [7:0] Entrada1ULA;
wire [7:0] Entrada2ULA;
wire ZeroULA;
wire [7:0] ResultadoULA;
wire [7:0] SetULA;
wire [7:0] DadoLido;
wire [7:0] SaidaMUXSetResultado;
wire [7:0] SaidaMUXDadoEscr;
wire SaidaAND;
wire [7:0] SaidaMUXBeq;
wire [7:0] SaidaExtensorSinal58;
wire [7:0] SaidaMUXJump;
wire [7:0] SaidaSoma1;
wire [7:0] SaidaSoma2;

pc pc1(
 .entrada(SaidaSoma2),
 .clock(clock),
 .endereco(SaidaPC),
 .sinalcontrole(Halt),
 .reset(reset)
 );

memoria_de_instrucoes memoria_de_instrucoes1(
 .endereco(SaidaPC),
 .clock(clock),
 .instrucao(Instrucao)
 );

SinalDeControle SinalDeControle1(
 .OpCode(Instrucao[7:5]),
 .clock(clock),
 .reset(reset),
 .Halt(Halt),
 .RegFonte(RegFonte),
 .RegDst(RegDst),
 .EscReg(EscReg),
 .ULA1(ULA1),
 .ULA2(ULA2),
 .Beq(Beq),
 .ULAOp(ULAOp),
 .Salto(Salto),
 .Set(Set),
 .LerMem(LerMem),
 .EscMem(EscMem)
 );

MUX3b MUX3bReg(
 .Entrada1(Instrucao[4:3]),
 .Entrada2(Instrucao[2:0]),
 .SinalControle(RegDst),
 .ULAOp(ULAOp),
 .Saida(SaidaMUX3bReg)
 );

Registradores Registradores1(
 .RegLido1(Instrucao[4:3]),
 .RegLido2(Instrucao[2:1]),
 .DadoEscr(SaidaMUXDadoEscr),
 .ULAOp(ULAOp),
 .RegEsc(SaidaMUX3bReg),
 .EscReg(EscReg),
 .Dado1(Dado1),
 .Dado2(Dado2),
 .DadoReg4(DadoReg4),
 .clock(clock),
 .reset(reset)
 );

ExtensorSinal38 ExtensorSinal381(
 .Entrada(Instrucao[2:0]),
 .Saida(SinalExtendido8bitsEntrada2MUX)
 );

MUX MUXEntrada1ULA(
 .Entrada1(Dado1),
 .Entrada2(8'b00000000),
 .SinalControle(ULA1),
 .Saida(Entrada1ULA)
 );

MUX MUXEntrada2ULA(
 .Entrada1(Dado2),
 .Entrada2(SinalExtendido8bitsEntrada2MUX),
 .SinalControle(ULA2),
 .Saida(Entrada2ULA)
 );

ULA ULAProcessador(
 .Entrada1(Entrada1ULA),
 .Entrada2(Entrada2ULA),
 .Entrada3(DadoReg4),
 .Zero(ZeroULA),
 .Resultado(ResultadoULA),
 .Set(SetULA),
 .ULAOp(ULAOp)
 );

MUX MUXSetResultado(
 .Entrada1(ResultadoULA),
 .Entrada2(SetULA),
 .SinalControle(Set),
 .Saida(SaidaMUXSetResultado)
 );

Memoria_de_Dados Memoria_de_Dados1(
 .Endereco_mem(ResultadoULA),
 .DadoEscr(Dado1),
 .DadoLido(DadoLido),
 .EscMem(EscMem),
 .LerMem(LerMem),
 .clock(clock),
 .reset(reset)
 );

MUX MUXDadoEscr(
 .Entrada1(SaidaMUXSetResultado),
 .Entrada2(DadoLido),
 .SinalControle(RegFonte),
 .Saida(SaidaMUXDadoEscr)
 );

PortaAND AND1(
 .Entrada1(ZeroULA),
 .Entrada2(Beq),
 .Saida(SaidaAND)
 );
 
 
MUX MUXBeq(
 .Entrada1(SinalExtendido8bitsEntrada2MUX),
 .Entrada2(8'b00000000),
 .SinalControle(SaidaAND),
 .Saida(SaidaMUXBeq)
 );

ExtensorSinal58 ExtensorSinal581(
 .Entrada(Instrucao[4:0]),
 .Saida(SaidaExtensorSinal58)
 );
 
MUX MUXJump(
 .Entrada1(SaidaExtensorSinal58),
 .Entrada2(SaidaMUXBeq),
 .SinalControle(Salto),
 .Saida(SaidaMUXJump)
 );
 
Soma Soma1(
 .Entrada1(SaidaPC),
 .Entrada2(8'b00000001),
 .Saida(SaidaSoma1)
 );

Soma Soma2(
 .Entrada1(SaidaSoma1),
 .Entrada2(SaidaMUXJump),
 .Saida(SaidaSoma2)
 );

endmodule