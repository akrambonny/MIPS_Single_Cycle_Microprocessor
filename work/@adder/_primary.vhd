library verilog;
use verilog.vl_types.all;
entity Adder is
    generic(
        width           : integer := 32
    );
    port(
        A               : in     vl_logic_vector;
        B               : in     vl_logic_vector;
        C               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of width : constant is 1;
end Adder;
