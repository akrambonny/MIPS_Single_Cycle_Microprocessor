module Control_unit #(parameter Width=6)(
input wire [Width-1:0] OP,Funct,
output reg  mem2reg,mem_wr,branch,alu_src,reg_dst,reg_wr,jmp,
output reg [2:0] Alucontrol
);

reg [1:0] Aluop;
always @(*) begin
    case(OP)

6'b100011 : begin
        jmp=1'b0; 
        Aluop=2'b00;
        mem_wr=1'b0;
        reg_wr=1'b1;
        reg_dst=1'b0;
        alu_src=1'b1;
        mem2reg=1'b1;
        branch=1'b0;
             end

6'b101011 : begin
        jmp=1'b0; 
        Aluop=2'b00;
        mem_wr=1'b1;
        reg_wr=1'b0;
        reg_dst=1'b0;
        alu_src=1'b1;
        mem2reg=1'b1;
        branch=1'b0; 
end
6'b000000 : begin
        jmp=1'b0; 
        Aluop=2'b10;
        mem_wr=1'b0;
        reg_wr=1'b1;
        reg_dst=1'b1;
        alu_src=1'b0;
        mem2reg=1'b0;
        branch=1'b0; 
end
6'b001000 : begin
        jmp=1'b0; 
        Aluop=2'b00;
        mem_wr=1'b0;
        reg_wr=1'b1;
        reg_dst=1'b0;
        alu_src=1'b1;
        mem2reg=1'b0;
        branch=1'b0; 
end
6'b000100 : begin
        jmp=1'b0; 
        Aluop=2'b01;
        mem_wr=1'b0;
        reg_wr=1'b0;
        reg_dst=1'b0;
        alu_src=1'b0;
        mem2reg=1'b0;
        branch=1'b1; 
    end
6'b000010 : begin
        jmp=1'b1; 
        Aluop=2'b00;
        mem_wr=1'b0;
        reg_wr=1'b0;
        reg_dst=1'b0;
        alu_src=1'b0;
        mem2reg=1'b0;
        branch=1'b0; 

    end
default : begin
        jmp=1'b0; 
        Aluop=2'b00;
        mem_wr=1'b0;
        reg_wr=1'b0;
        reg_dst=1'b0;
        alu_src=1'b0;
        mem2reg=1'b0;
        branch=1'b0; 
end
    endcase
end

always @(*) begin
    case(Aluop)
    2'b00: begin
            Alucontrol=3'b010; 
           end
    2'b01: begin
            Alucontrol=3'b100;
           end
    2'b10: begin
            case(Funct)
//where're AND & OR funct control signal
            6'b10_0000: Alucontrol=3'b010;
            6'b10_0010: Alucontrol=3'b100;
            6'b10_1010: Alucontrol=3'b110;
            6'b01_1100: Alucontrol=3'b101;

            default: Alucontrol=3'b010;
            endcase
           end

    default: Alucontrol=3'b010;

    endcase
    
end

endmodule