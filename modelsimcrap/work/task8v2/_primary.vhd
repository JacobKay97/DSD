library verilog;
use verilog.vl_types.all;
entity task8v2 is
    port(
        clk             : in     vl_logic;
        clk_en          : in     vl_logic;
        dataa           : in     vl_logic_vector(31 downto 0);
        datab           : in     vl_logic_vector(31 downto 0);
        n               : in     vl_logic_vector(7 downto 0);
        done            : out    vl_logic;
        dataout         : out    vl_logic_vector(31 downto 0)
    );
end task8v2;
