library verilog;
use verilog.vl_types.all;
entity altfp_add_sub1_altpriority_encoder_q28 is
    port(
        data            : in     vl_logic_vector(3 downto 0);
        q               : out    vl_logic_vector(1 downto 0)
    );
end altfp_add_sub1_altpriority_encoder_q28;
