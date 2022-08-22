module Register_file # (parameter Width=32, Depth=32,AD_Width=5) (
 input    wire        clk,
 input    wire         res,
 input    wire [Width-1:0] WData,
 input    wire [AD_Width-1:0]  A1,
 input    wire [AD_Width-1:0]  A2,
 input    wire [AD_Width-1:0]  A3,
 input    wire        Wr_En,
 output   reg  [Width-1:0] RData1,
 output   reg  [Width-1:0] RData2
);
reg [Width-1:0]   reg_file [0:Depth-1];
integer I;
always @(*) begin
    RData1=  reg_file[A1];
    RData2=  reg_file[A2];  
end


always @(posedge clk or negedge res ) 
begin

    if (!res) 
        begin
        for (I=0; I < 32;I=I+1)
            reg_file [I]<={Width{1'b0}};
        end
    else if (Wr_En)
           reg_file[A3]<=WData;
end
endmodule