//Memoria de dados
/*
Codigo em C
#include <stdio.h>

int main(){
	int i, n, t1 = 1, t2 = 1, sum;
	printf("Informe o numero de termos: ");
	scanf("%d", &n);
	
	printf("SERIE DE FIBONACCI: \n");
	for(i = 1; i <= n; i++){
		printf("%d, ", t1);
		sum = t1 + t2:
		t1 = t2;
		t2 = sum;
	}
}

*/
module Mem_Dados(clock, endereco, MemRead, MemWrite, dado_in, dado_out);

input clock, MemRead, MemWrite;
input [7:0]endereco, dado_in;
output [7:0]dado_out;

reg [7:0] dado [15:0];

//assign dado_out = line;

//Carrega dados na memoria
initial
	begin
		dado[0] = 8'b00000000; //t1 = 1;
		dado[1] = 8'b00000001; //t2 = 1;
		dado[2] = 8'b00000010; //sum
	end

always @(posedge clock)//Escrita

begin

if(MemWrite & !MemRead)
	dado[endereco] = dado_in;
if(MemRead & !MemWrite)
	dado[endereco] = dado_out;
end

//Leitura de dados?

endmodule
