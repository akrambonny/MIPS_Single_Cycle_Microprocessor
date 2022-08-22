module sign_Extend #(parameter Width=16, out_Width=Width+Width)(
input wire [Width-1:0] Inst15,
output reg [out_Width-1:0] signlmm
);

always @(*) begin

signlmm={{Width{Inst15[15]}},Inst15};
    
end
endmodule