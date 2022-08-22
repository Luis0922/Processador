module pc(entrada, clock, endereco, sinalcontrole, reset);
input wire clock, sinalcontrole, reset;
input wire [7:0] entrada;
reg [7:0] contador; // Contador do PC
output wire [7:0] endereco; // Endereço de memória
initial begin
 contador = 8'b00000000;
end
always @(posedge clock) begin
 if(sinalcontrole == 0) begin
	if (reset) begin
		contador = 8'b00000000;
	end
   else begin
		contador = entrada; // contador = entrada
	end
 end
end
assign endereco = contador; // endereço recebe o valor do contador
endmodule
