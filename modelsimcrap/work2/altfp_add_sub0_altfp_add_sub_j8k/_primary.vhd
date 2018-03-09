library verilog;
use verilog.vl_types.all;
entity altfp_add_sub0_altfp_add_sub_j8k is
    port(
        add_sub         : in     vl_logic;
        clock           : in     vl_logic;
        dataa           : in     vl_logic_vector(31 downto 0);
        datab           : in     vl_logic_vector(31 downto 0);
        result          : out    vl_logic_vector(31 downto 0)
    );
end altfp_add_sub0_altfp_add_sub_j8k;
