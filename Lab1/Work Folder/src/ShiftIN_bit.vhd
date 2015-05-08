library ieee;
use ieee.std_logic_1164.all;

entity ShiftIN_bit is
port(	rstn,en,Ck: in std_logic;
		Dato_in: in std_logic; 
		dato_out: out std_logic);
end ShiftIN_bit;
architecture A of ShiftIN_bit is
component reg_bit is 
port(	Ck,rstn, EN: in std_logic;
		d : in std_logic;
		q: out std_logic);
end component;

signal temp_out: std_logic_vector(0 to 6);

	begin
	reg0: reg_bit port map(d => dato_in, ck => ck, rstn => rstn, en => en, q => temp_out(0));
   u1: for i in 0 to 5 generate
		regi: reg_bit port map (d => temp_out(i), CK => CK, Q => temp_out(i+1), rstn => rstn, en => en);
	end generate;
	dato_out <= temp_out(6);
	
	 end A;
 
 ------------------ Flip Flop ------------------
 -- library ieee;
-- use ieee.std_logic_1164.all;

-- entity reg is 
-- port(	d,Ck,rstn, EN: in std_logic;
		-- q: out std_logic);
-- end reg;
-- architecture behavior of reg is
-- begin
		-- process (Ck)
		-- begin
			-- if (rstn = '0') then
				-- q<='0';
			-- elsif (Ck'event and Ck ='0') then
				-- if (EN = '1') then
					-- q <= d;
				-- end if;
			-- end if;
		-- end process;
-- end behavior;
--------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_bit is 
port(	Ck,rstn, EN: in std_logic;
		d : in std_logic;
		q: out std_logic);
end reg_bit;
architecture behavior of reg_bit is
begin
		process (Ck)
		begin
			if (rstn = '0') then
				q<='0';
			elsif (Ck'event and Ck ='1') then
				if (EN = '1') then
					q <= d;
				end if;
			end if;
		end process;
end behavior;
