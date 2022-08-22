module ALU #(parameter Data_Width = 32 , AD_Width =3 , out_Width=Data_Width+Data_Width)(
  input wire   [Data_Width-1:0] A, B,
  input wire   [AD_Width-1:0]  ALU_FUN,
  output wire   Zero_Flag, 
  output reg   [Data_Width-1:0] ALU_OUT
 
);
   
  reg [out_Width-1:0] ALU_OUT_Comb;
  
always @(*)
 begin
   ALU_OUT = ALU_OUT_Comb;
 end  
  
always @(*)
  begin
	 ALU_OUT_Comb = 1'b0 ;
    case (ALU_FUN) 
    3'b000: begin
         ALU_OUT_Comb = A&B;
              end
    3'b001: begin
         ALU_OUT_Comb = A|B;
              end
    3'b010: begin
         ALU_OUT_Comb = A+B;
              end
    3'b100: begin
         ALU_OUT_Comb = A - B;
              end
    3'b101: begin
         ALU_OUT_Comb = A * B;
              end
    3'b110: begin
         ALU_OUT_Comb= (A<B) ? {{(out_Width-1){1'b0}} , 1'b1}:{(out_Width){1'b0}}; 
              end
    default: begin
	       ALU_OUT_Comb={(out_Width){1'b0}};
             end
    endcase
  end
  
  assign Zero_Flag = (ALU_OUT == 32'b0) ? 1'b1 : 1'b0 ;

endmodule