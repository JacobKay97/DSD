library verilog;
use verilog.vl_types.all;
entity altfp_convert0_altpriority_encoder_rf8 is
    port(
        data            : in     vl_logic_vector(15 downto 0);
        q               : out    vl_logic_vector(3 downto 0);
        zero            : out    vl_logic
    );
end altfp_convert0_altpriority_encoder_rf8;