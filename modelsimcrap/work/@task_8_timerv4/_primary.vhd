library verilog;
use verilog.vl_types.all;
entity Task_8_timerv4 is
    port(
        clk             : in     vl_logic;
        clk_en          : in     vl_logic;
        n               : in     vl_logic_vector(7 downto 0);
        multi_1_en      : out    vl_logic;
        multi_2_en      : out    vl_logic;
        cordic_rs       : out    vl_logic;
        adder_1_en      : out    vl_logic;
        adder_2_en      : out    vl_logic;
        mlpx_1          : out    vl_logic;
        mlpx_2          : out    vl_logic;
        mlpx_3          : out    vl_logic;
        resetAcc        : out    vl_logic
    );
end Task_8_timerv4;
