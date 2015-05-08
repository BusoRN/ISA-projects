library verilog;
use verilog.vl_types.all;
entity FIR is
    port(
        DIN             : in     vl_logic_vector(7 downto 0);
        H0              : in     vl_logic_vector(7 downto 0);
        H1              : in     vl_logic_vector(7 downto 0);
        H2              : in     vl_logic_vector(7 downto 0);
        H3              : in     vl_logic_vector(7 downto 0);
        H4              : in     vl_logic_vector(7 downto 0);
        H5              : in     vl_logic_vector(7 downto 0);
        H6              : in     vl_logic_vector(7 downto 0);
        VIN             : in     vl_logic;
        RST_n           : in     vl_logic;
        CLK             : in     vl_logic;
        VOUT            : out    vl_logic;
        DOUT            : out    vl_logic_vector(7 downto 0)
    );
end FIR;
