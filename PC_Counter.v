module PC #(parameter Width=32)(
input wire [Width-1:0] PC_IN,
input wire       Res,clk,
output reg [Width-1:0] PC_OUT

);

always @(posedge clk or negedge Res )
    begin
     if (!Res)
       begin
         PC_OUT <= {Width{1'b0}} ;
       end
     else 
      PC_OUT<=PC_IN;
    end

endmodule