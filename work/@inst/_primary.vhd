library verilog;
use verilog.vl_types.all;
entity Inst is
    generic(
        Width           : integer := 32;
        Depth           : integer := 100
    );
    port(
        PC_in           : in     vl_logic_vector;
        Instr           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Width : constant is 1;
    attribute mti_svvh_generic_type of Depth : constant is 1;
end Inst;
