library verilog;
use verilog.vl_types.all;
entity altfp_add_sub0_altpriority_encoder_fj8 is
    port(
        data            : in     vl_logic_vector(15 downto 0);
        q               : out    vl_logic_vector(3 downto 0);
        zero            : out    vl_logic
    );
end altfp_add_sub0_altpriority_encoder_fj8;
