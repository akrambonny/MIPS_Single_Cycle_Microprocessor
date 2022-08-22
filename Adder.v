module Adder #(parameter width =32)
(input wire [width-1:0] A,
input  wire [width-1:0] B,
output wire [width-1:0] C 

);
assign C = A+B ;
endmodule 