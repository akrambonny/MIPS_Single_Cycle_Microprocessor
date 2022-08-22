library verilog;
use verilog.vl_types.all;
entity Register_file is
    generic(
        Width           : integer := 32;
        Depth           : integer := 32;
        AD_Width        : integer := 5
    );
    port(
        clk             : in     vl_logic;
        res             : in     vl_logic;
        WData           : in     vl_logic_vector;
        A1              : in     vl_logic_vector;
        A2              : in     vl_logic_vector;
        A3              : in     vl_logic_vector;
        Wr_En           : in     vl_logic;
        RData1          : out    vl_logic_vector;
        RData2          : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Width : constant is 1;
    attribute mti_svvh_generic_type of Depth : constant is 1;
    attribute mti_svvh_generic_type of AD_Width : constant is 1;
end Register_file;
