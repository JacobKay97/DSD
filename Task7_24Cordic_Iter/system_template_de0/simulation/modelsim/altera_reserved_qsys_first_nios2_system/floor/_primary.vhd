library verilog;
use verilog.vl_types.all;
entity floor is
    port(
        clk             : in     vl_logic;
        \in\            : in     vl_logic_vector(31 downto 0);
        \out\           : out    vl_logic_vector(31 downto 0)
    );
end floor;
