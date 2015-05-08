library ieee;																				--bisogna sistemare l'uscita, decidere come tirare fuori il tipo di media scelto
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity adder is
	generic ( n : integer := 8);
	port(in_A, in_B: in signed(n-1 downto 0);
			sum: out signed(n-1 downto 0));
	end adder;
	
architecture Behavior of adder is

begin

	sum <= in_A + in_B;

end Behavior;