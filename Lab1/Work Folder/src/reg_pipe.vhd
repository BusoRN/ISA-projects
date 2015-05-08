library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_pipe is 
generic (n : integer := 8);
port(	Ck,rstn: in std_logic;
		d : in signed( n-1 downto 0);
		q: out signed(n-1 downto 0));
end reg_pipe;
architecture behavior of reg_pipe is
begin
		process (Ck)
		begin
			if (rstn = '0') then
				q<=(others =>'0');
			elsif (Ck'event and Ck ='1') then
					q <= d;
			end if;
		end process;
end behavior;