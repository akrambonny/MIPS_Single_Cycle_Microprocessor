module Shift_left #(parameter width=32)
(input wire [width-1:0] in,
output reg [width-1:0] out

);
always @(*)begin
out=(in<<2); 
end
endmodule