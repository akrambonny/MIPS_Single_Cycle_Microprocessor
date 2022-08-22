library verilog;
use verilog.vl_types.all;
entity Data_mem is
    generic(
        Width           : integer := 32;
        Depth           : integer := 128;
        AD_Width        : integer := 32;
        test_width      : integer := 16
    );
    port(
        WData           : in     vl_logic_vector;
        Address         : in     vl_logic_vector;
        Wr_En           : in     vl_logic;
        clk             : in     vl_logic;
        Res             : in     vl_logic;
        RData           : out    vl_logic_vector;
        Test_value      : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Width : constant is 1;
    attribute mti_svvh_generic_type of Depth : constant is 1;
    attribute mti_svvh_generic_type of AD_Width : constant is 1;
    attribute mti_svvh_generic_type of test_width : constant is 1;
end Data_mem;
