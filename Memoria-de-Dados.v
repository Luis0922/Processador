module Memoria_de_Dados(Endereco_mem, DadoEscr, DadoLido, EscMem, LerMem, clock, reset);
    input [7:0]Endereco_mem; // Le o Endereço
	 input [7:0]DadoEscr; // Le o dado que vai ser escrito na memoria
	 input EscMem, LerMem, clock, reset;
	 output reg [7:0] DadoLido;
	 reg [7:0] Memoria_dados [99:0];
	 initial begin
	  $readmemb("C:/Users/Usuario/Desktop/Processador/dados.dat", Memoria_dados);
	 end
    always @(*)begin // negedge clock
	 // Se o EscMem for 1, escreve O VALOR DadoEscr na memória 
		  if (EscMem & reset==0) begin
		   Memoria_dados[Endereco_mem] = DadoEscr;
		  end
		  if(reset) begin
		    $readmemh("C:/Users/Usuario/Desktop/Processador/dados.dat", Memoria_dados);
		  end
	end 
			// Se o LerMem for 1, DadoLido recebe o valor escrito na memoria
	always @(*) begin //posedge clock
		if (LerMem) begin
			DadoLido = Memoria_dados[Endereco_mem];
		end
	end
endmodule

