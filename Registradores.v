module Registradores (RegLido1,RegLido2,DadoEscr, ULAOp, RegEsc,EscReg,
Dado1,Dado2, DadoReg4, clock, reset);
    input wire [1:0] RegLido1; // Le o reg 1
	 reg [2:0] RegLido;
    input [1:0] RegLido2; // Le o reg 2
	 input [2:0] RegEsc; // Reg que vai ser escrito
	 input [2:0] ULAOp;
    input [7:0] DadoEscr; // Dado que vai ser escrito no RegEsc
	 // olhar com minhna princesa
    input EscReg, clock, reset; // Sinal de controle e clock
    output [7:0] Dado1, Dado2, DadoReg4; // Dados de saida
    reg [7:0] Registrador [7:0];  // Banco de 8 registradores com 8 bits
	 initial begin
		Registrador[3'b000] = 8'b00000000;
		Registrador[3'b001] = 8'b00000000;
		Registrador[3'b010] = 8'b00000000;
		Registrador[3'b011] = 8'b00000000;
		Registrador[3'b100] = 8'b00000000;
		Registrador[3'b101] = 8'b00000000;
		Registrador[3'b110] = 8'b00000000;
		Registrador[3'b111] = 8'b00000000;
	 end
    always @(*) begin
			if(reset) begin
				Registrador[3'b000] = 8'b00000000;
				Registrador[3'b001] = 8'b00000000;
				Registrador[3'b010] = 8'b00000000;
				Registrador[3'b011] = 8'b00000000;
				Registrador[3'b100] = 8'b00000000;
				Registrador[3'b101] = 8'b00000000;
				Registrador[3'b110] = 8'b00000000;
				Registrador[3'b111] = 8'b00000000;
			end
			if(ULAOp == 3'b011) begin
				RegLido = {1'b1, RegLido1};
			end
			else begin
				RegLido = RegLido1;
			end
	 // Se o EscReg for 1, escreve O VALOR DadoEscr no RegEsc 
        if (EscReg) begin
				Registrador[RegEsc] <= DadoEscr; 
		  end
    end
	 assign Dado1 = Registrador[RegLido]; // Dado 1 recebe o valor do RegLido1
    assign Dado2 = Registrador[RegLido2]; // Dado 2 recebe o valor do RegLido2
	 assign DadoReg4 = Registrador[3'b011];
endmodule
