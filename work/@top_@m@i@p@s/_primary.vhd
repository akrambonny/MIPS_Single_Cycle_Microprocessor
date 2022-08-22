library verilog;
use verilog.vl_types.all;
entity Top_MIPS is
    generic(
        Data_Width      : integer := 32;
        AD_Width        : integer := 3;
        decoder_Width   : integer := 6
    );
    port(
        clk             : in     vl_logic;
        Res             : in     vl_logic;
        Test_value      : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Data_Width : constant is 1;
    attribute mti_svvh_generic_type of AD_Width : constant is 1;
    attribute mti_svvh_generic_type of decoder_Width : constant is 1;
end Top_MIPS;
