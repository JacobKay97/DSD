library verilog;
use verilog.vl_types.all;
entity FloatAdd is
    port(
        clk             : in     vl_logic;
        clken           : in     vl_logic;
        dataa           : in     vl_logic_vector(31 downto 0);
        datab           : in     vl_logic_vector(31 downto 0);
        result          : out    vl_logic_vector(31 downto 0)
    );
end FloatAdd;
