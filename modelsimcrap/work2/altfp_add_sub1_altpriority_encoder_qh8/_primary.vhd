library verilog;
use verilog.vl_types.all;
entity altfp_add_sub1_altpriority_encoder_qh8 is
    port(
        data            : in     vl_logic_vector(3 downto 0);
        q               : out    vl_logic_vector(1 downto 0);
        zero            : out    vl_logic
    );
end altfp_add_sub1_altpriority_encoder_qh8;