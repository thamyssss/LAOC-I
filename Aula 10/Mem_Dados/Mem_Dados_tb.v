include "Mem_dados.v"

module teste_mem_Dados();
  reg teste_clock, teste_MemWrite, teste_MemRead;
  reg [7:0] teste_endereco, teste_dado_in;
  wire [7:0] teste_dado_out;
   
  initial begin
   teste_MemWrite=0;
   teste_clock=1;
   #1 teste_clock=0;
   teste_MemRead=1;
   teste_endereco= 8'b00000000;
   #1 teste_clock=1;
   teste_endereco= 8'b00001001;
   #1 teste_clock=0;
   teste_endereco= 8'b00000001;
   #1 teste_clock=1;
   teste_MemWrite=1;
   teste_endereco = 8'b00001010;
   teste_dado_in=8'b00000010;
   #1 teste_clock=0;
   teste_MemWrite=0;
   teste_endereco = 8'b00001010;
   #1 teste_clock=1;
   #1 teste_clock=0;
   teste_endereco = 8'b00001111;
  end

  initial begin
   $monitor("Time=%0d teste_clock=%b teste_MemRead=%b teste_endereco=%d teste_dado_out=%d", $time, 
   teste_clock, teste_MemRead, teste_endereco, teste_dado_out);
  end
 Mem_Dados mem(teste_clock, teste_MemWrite, teste_MemRead, teste_endereco, teste_dado_in, 
 teste_dado_out);
 
endmodule