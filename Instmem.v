module Inst # ( parameter Width=32, Depth=100 ) (
 input    wire [Width-1:0] PC_in,
 output   wire  [Width-1:0] Instr
);
reg [Width-1:0] Inst_mem [0:Depth-1];
initial 
$readmemh("Program3.txt",Inst_mem);

assign Instr= Inst_mem [PC_in>>2]  ; 


endmodule