library verilog;
use verilog.vl_types.all;
entity Task7 is
    port(
        clk             : in     vl_logic;
        forcedVCC       : in     vl_logic;
        dataa           : in     vl_logic_vector(31 downto 0);
        dataout         : out    vl_logic_vector(31 downto 0)
    );
end Task7;
