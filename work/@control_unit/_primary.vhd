library verilog;
use verilog.vl_types.all;
entity Control_unit is
    generic(
        Width           : integer := 6
    );
    port(
        OP              : in     vl_logic_vector;
        Funct           : in     vl_logic_vector;
        mem2reg         : out    vl_logic;
        mem_wr          : out    vl_logic;
        branch          : out    vl_logic;
        alu_src         : out    vl_logic;
        reg_dst         : out    vl_logic;
        reg_wr          : out    vl_logic;
        jmp             : out    vl_logic;
        Alucontrol      : out    vl_logic_vector(2 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Width : constant is 1;
end Control_unit;
