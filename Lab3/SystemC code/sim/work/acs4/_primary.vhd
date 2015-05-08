library verilog;
use verilog.vl_types.all;
entity acs4 is
    port(
        CLK             : in     vl_logic;
        RST_n           : in     vl_logic;
        CLEAR           : in     vl_logic;
        C0              : in     vl_logic_vector(4 downto 0);
        C1              : in     vl_logic_vector(4 downto 0);
        A0              : out    vl_logic_vector(7 downto 0);
        A1              : out    vl_logic_vector(7 downto 0);
        A2              : out    vl_logic_vector(7 downto 0);
        A3              : out    vl_logic_vector(7 downto 0)
    );
end acs4;
