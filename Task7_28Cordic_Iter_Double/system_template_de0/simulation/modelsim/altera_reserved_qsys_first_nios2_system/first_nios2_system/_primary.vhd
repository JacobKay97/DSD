library verilog;
use verilog.vl_types.all;
entity first_nios2_system is
    port(
        clk_clk         : in     vl_logic;
        reset_reset_n   : in     vl_logic;
        led_pio_external_connection_export: out    vl_logic_vector(7 downto 0);
        new_sdram_controller_0_wire_addr: out    vl_logic_vector(11 downto 0);
        new_sdram_controller_0_wire_ba: out    vl_logic_vector(1 downto 0);
        new_sdram_controller_0_wire_cas_n: out    vl_logic;
        new_sdram_controller_0_wire_cke: out    vl_logic;
        new_sdram_controller_0_wire_cs_n: out    vl_logic;
        new_sdram_controller_0_wire_dq: inout  vl_logic_vector(15 downto 0);
        new_sdram_controller_0_wire_dqm: out    vl_logic_vector(1 downto 0);
        new_sdram_controller_0_wire_ras_n: out    vl_logic;
        new_sdram_controller_0_wire_we_n: out    vl_logic
    );
end first_nios2_system;
