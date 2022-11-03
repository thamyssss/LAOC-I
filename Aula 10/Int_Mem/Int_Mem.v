module Int_Mem(clock, PC, OPcode, label);
input clock;
input [7:0]PC; //Instrução
output reg[3:0] OPcode; //OPcode da instrução
output reg[5:0] label; //
//Valor imediato/num. reg talvez?

reg [7:0] instru[0:63]; //Memoria com as instruções

initial
begin
	//Aqui vão ficar as instruções
	instru[0] = 8'b00000000; //Exemplo/teste
end

//Acesso da memoria
always @(PC)
	begin
		OPcode <= instru[PC][7:4];
		label  <= instru[PC][5:0];
		//reg Alvo
		//reg Imed.
	end

endmodule
