library verilog;
use verilog.vl_types.all;
entity task7Timer is
    port(
        clk             : in     vl_logic;
        clken           : in     vl_logic;
        mult1           : out    vl_logic;
        mult2           : out    vl_logic;
        addsub          : out    vl_logic;
        convert         : out    vl_logic;
        cordicEn        : out    vl_logic;
        cordicRst       : out    vl_logic
    );
end task7Timer;
