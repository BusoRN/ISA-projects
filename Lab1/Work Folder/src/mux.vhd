library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux is
	port (in1: in std_logic;
		in2: in std_logic;
		sel : in std_logic;
		output: out std_logic);
end mux;

architecture behavior of mux is
begin
	with sel select 
		output <= in1 when '0',
				  in2 when others;
end behavior;

