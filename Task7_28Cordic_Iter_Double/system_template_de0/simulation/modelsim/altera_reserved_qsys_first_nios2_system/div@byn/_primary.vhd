library verilog;
use verilog.vl_types.all;
entity divByn is
    generic(
        num_div         : integer := 1
    );
    port(
        clk             : in     vl_logic;
        \in\            : in     vl_logic_vector(31 downto 0);
        \out\           : out    vl_logic_vector(31 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of num_div : constant is 1;
end divByn;
