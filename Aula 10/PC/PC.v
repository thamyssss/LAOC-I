//Program Counter
module PC(clock, pc_in, pc_out, halt);

input clock;	
input halt;	//Instrução halt
input[7:0] pc_in; // Instrução

//saida
output reg [7:0]pc_out;

initial 
begin;
	pc_out = 0;
end

always @(posedge clock) begin
	pc_out = halt ? 0:pc_in;
end

endmodule
