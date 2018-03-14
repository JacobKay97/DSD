library verilog;
use verilog.vl_types.all;
entity CordicSkip is
    port(
        clk             : in     vl_logic;
        clken           : in     vl_logic;
        cordicDone      : in     vl_logic;
        look            : in     vl_logic;
        floorIn         : in     vl_logic_vector(31 downto 0);
        floatIn         : in     vl_logic_vector(31 downto 0);
        floatOut        : out    vl_logic_vector(31 downto 0);
        found           : out    vl_logic
    );
end CordicSkip;
