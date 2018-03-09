library verilog;
use verilog.vl_types.all;
entity cordicWrap is
    generic(
        pi              : vl_logic_vector(0 to 63) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi1, Hi0, Hi0, Hi1, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi0, Hi1, Hi1, Hi0, Hi1, Hi0, Hi1, Hi0, Hi1, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0);
        twopi           : vl_logic_vector(0 to 63) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi1, Hi0, Hi0, Hi1, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi0, Hi1, Hi1, Hi0, Hi1, Hi0, Hi1, Hi0, Hi1, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0, Hi1);
        pibytwo         : vl_logic_vector(0 to 63) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi1, Hi0, Hi0, Hi1, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi0, Hi1, Hi1, Hi0, Hi1, Hi0, Hi1, Hi0, Hi1, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0);
        threepibytwo    : vl_logic_vector(0 to 63) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi1, Hi0, Hi1, Hi1, Hi0, Hi1, Hi1, Hi0, Hi0, Hi1, Hi0, Hi1, Hi1, Hi1, Hi1, Hi1, Hi0, Hi0, Hi0, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi0, Hi0, Hi1, Hi1, Hi0, Hi1)
    );
    port(
        clk             : in     vl_logic;
        \in\            : in     vl_logic_vector(31 downto 0);
        \out\           : out    vl_logic_vector(23 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of pi : constant is 1;
    attribute mti_svvh_generic_type of twopi : constant is 1;
    attribute mti_svvh_generic_type of pibytwo : constant is 1;
    attribute mti_svvh_generic_type of threepibytwo : constant is 1;
end cordicWrap;
