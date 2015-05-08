library verilog;
use verilog.vl_types.all;
entity acs is
    port(
        X0              : in     vl_logic_vector(7 downto 0);
        X1              : in     vl_logic_vector(7 downto 0);
        Y               : out    vl_logic_vector(7 downto 0)
    );
end acs;
