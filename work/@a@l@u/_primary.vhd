library verilog;
use verilog.vl_types.all;
entity ALU is
    generic(
        Data_Width      : integer := 32;
        AD_Width        : integer := 3;
        out_Width       : vl_notype
    );
    port(
        A               : in     vl_logic_vector;
        B               : in     vl_logic_vector;
        ALU_FUN         : in     vl_logic_vector;
        Zero_Flag       : out    vl_logic;
        ALU_OUT         : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Data_Width : constant is 1;
    attribute mti_svvh_generic_type of AD_Width : constant is 1;
    attribute mti_svvh_generic_type of out_Width : constant is 3;
end ALU;
