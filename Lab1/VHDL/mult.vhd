library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity mult is
	generic ( n : integer := 8);
	port (data_in_1,data_in_2 : in signed (n-1 downto 0);
		dout : out signed (2*n-1 downto 0));
end mult;

architecture behavior of mult is
	
	begin
	   dout <= data_in_1 * data_in_2;

end behavior;
