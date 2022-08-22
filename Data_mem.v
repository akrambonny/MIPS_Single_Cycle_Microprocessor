module Data_mem # ( parameter Width=32, Depth=128,AD_Width=32,test_width=16 ) (
 input    wire [Width-1:0] WData,
 input    wire [AD_Width-1:0]  Address,
 input    wire        Wr_En,
 input    wire        clk,
 input    wire        Res,
 output   wire  [Width-1:0] RData,
 output   wire [test_width-1:0] Test_value 
);
reg [Width-1:0] Datamem [Depth-1:0];
integer I;
always @(posedge clk or negedge Res ) 
begin

    if (!Res) 
        begin
        for (I=0; I < 128;I=I+1)
            Datamem[I]<={Width{1'b0}};
        end
    else if (Wr_En)
        begin
        Datamem[Address] <= WData;
        end 
end

assign RData= Datamem[Address];
assign Test_value= Datamem[32'd0][15:0];
 
endmodule