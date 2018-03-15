library verilog;
use verilog.vl_types.all;
entity fixedtofloat is
    port(
        clk             : in     vl_logic;
        clken           : in     vl_logic;
        fixedin         : in     vl_logic_vector(27 downto 0);
        floatout        : out    vl_logic_vector(31 downto 0)
    );
end fixedtofloat;
