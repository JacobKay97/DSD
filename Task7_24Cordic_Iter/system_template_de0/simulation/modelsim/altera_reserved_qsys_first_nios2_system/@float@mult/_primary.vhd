library verilog;
use verilog.vl_types.all;
entity FloatMult is
    port(
        clk_en          : in     vl_logic;
        clock           : in     vl_logic;
        dataa           : in     vl_logic_vector(31 downto 0);
        datab           : in     vl_logic_vector(31 downto 0);
        results         : out    vl_logic_vector(31 downto 0)
    );
end FloatMult;
