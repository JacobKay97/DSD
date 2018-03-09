library verilog;
use verilog.vl_types.all;
entity cordic_dsd is
    generic(
        DATA_WIDTH      : integer := 24
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        en              : in     vl_logic;
        z               : in     vl_logic_vector;
        negate          : in     vl_logic;
        done            : out    vl_logic;
        sin_out         : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
end cordic_dsd;
