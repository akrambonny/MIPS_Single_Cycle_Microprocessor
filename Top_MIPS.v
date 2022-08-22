module Top_MIPS #(parameter Data_Width = 32 , AD_Width =3 ,
                            decoder_Width=6
                 )
(
  input wire    clk,
  input wire    Res,
  output wire [(Data_Width/2)-1:0]  Test_value 
);
//Internal Signals
wire  [Data_Width-1:0] instr;
wire  [Data_Width-1:0] PC,PC1,PCplus4;
wire  [Data_Width-1:0] signlmm;
wire  [Data_Width-1:0] PCBranch;
wire  [4:0]            WriteReg;
wire  [Data_Width-1:0] PCjump;
wire  [Data_Width-1:0] srcA,srcB;
wire  [Data_Width-1:0]  ALUResult;
wire  [Data_Width-1:0] WriteData,ReadData,Result;
wire PCSrc,Zero_Flag,jump,Regwrite,RegDst,ALUsrc,branch,memwrite,memtoReg;
wire [2:0]  ALUcontrol;
wire [Data_Width-1:0] inwire,minwire,wire2;

assign PCSrc= branch&Zero_Flag;
//ALU instantiation
ALU alu (
    .A(srcA),
    .B(srcB),
    .ALU_FUN(ALUcontrol),
    .Zero_Flag(Zero_Flag),
    .ALU_OUT(ALUResult)
);

//Control Unit instantiation
Control_unit controlUnit (
     .OP(instr[31:26]),
     .Funct(instr[5:0]),
     .mem2reg(memtoReg),
     .mem_wr(memwrite),
     .branch(branch),
     .alu_src(ALUsrc),
     .reg_dst(RegDst),
     .reg_wr(Regwrite),
     .jmp(jump),
     .Alucontrol(ALUcontrol)
);
Data_mem Datamem (
    .WData(WriteData),
    .Address(ALUResult),
    .Wr_En(memwrite),
    .clk(clk),
    .Res(Res),
    .RData(ReadData),
    .Test_value(Test_value)
);

Inst instr_mem (
    .PC_in(PC),
    .Instr(instr)
);

PC pc_counter (
    .PC_IN(PC1),
    .clk(clk),
    .PC_OUT(PC),
    .Res(Res)
);

sign_Extend sign_exten (
    .Inst15(instr[15:0]),
    .signlmm(signlmm)
    
);

Shift_left SL1 (
    .in(signlmm),
    .out(inwire)
);

Shift_left SL2 (
    .in({6'b0,instr[25:0]}),
    .out(wire2)
);

Adder add1 (
    .A(PC),
    .B(32'd4),
    .C(PCplus4)

);

Adder add2 (
    .A(inwire),
    .B(PCplus4),
    .C(PCBranch)
);

Register_file regfile (
    .WData(Result),
    .A1(instr[25:21]),
    .A2(instr[20:16]),
    .A3(WriteReg),
    .Wr_En(Regwrite),
    .clk(clk),
    .res (Res),
    .RData1(srcA),
    .RData2(WriteData)
); 

MUX  mux1 (
    .IN1(PCplus4),
    .IN2(PCBranch),
    .sel(PCSrc),
    .out(minwire)

);

MUX  mux2 (
    .IN1(minwire),
    .IN2({PCplus4[31:28],wire2[27:0]}),
    .sel(jump),
    .out(PC1)

);

MUX  #(.width(5))  mux3 (
    .IN1(instr[20:16]),
    .IN2(instr[15:11]),
    .sel(RegDst),
    .out(WriteReg)

);


MUX  mux4 (
    .IN1(WriteData),
    .IN2(signlmm),
    .sel(ALUsrc),
    .out(srcB)

);

MUX  mux5 (
    .IN1(ALUResult),
    .IN2(ReadData),
    .sel(memtoReg),
    .out(Result)

);

endmodule