module MUX  #(parameter width =32)
(input wire [width-1:0] IN1,
input  wire [width-1:0] IN2,
input  wire sel,
output reg [width-1:0] out 
);

always @(*) begin
    if (sel==0)
    out=IN1;
    else
    out=IN2;
end
endmodule