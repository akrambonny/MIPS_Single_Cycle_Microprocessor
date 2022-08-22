library verilog;
use verilog.vl_types.all;
entity PC is
    generic(
        Width           : integer := 32
    );
    port(
        PC_IN           : in     vl_logic_vector;
        Res             : in     vl_logic;
        clk             : in     vl_logic;
        PC_OUT          : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Width : constant is 1;
end PC;
