library verilog;
use verilog.vl_types.all;
entity sign_Extend is
    generic(
        Width           : integer := 16;
        out_Width       : vl_notype
    );
    port(
        Inst15          : in     vl_logic_vector;
        signlmm         : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Width : constant is 1;
    attribute mti_svvh_generic_type of out_Width : constant is 3;
end sign_Extend;
