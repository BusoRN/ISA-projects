library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.package_vett_reg.all;

entity ShiftIN is
port(	rstn,en,Ck: in std_logic;
		Dato_in: in signed (7 downto 0); -- dato in (7-0)
		dato_out: out vett_reg_vector(0 to 6));
end ShiftIN;
architecture A of ShiftIN is
component reg is 
port(	Ck,rstn, EN: in std_logic;
		d : in signed( 7 downto 0);
		q: out signed(7 downto 0));
end component;

signal temp_out: vett_reg_vector(0 to 6);

	begin
	reg0: reg port map(d => dato_in, ck => ck, rstn => rstn, en => en, q => temp_out(0));
   u1: for i in 1 to 6 generate
		regi: reg port map (d => temp_out(i-1), CK => CK, Q => temp_out(i), rstn => rstn, en => en);
	end generate;
	
	dato_out <= temp_out; -- dato out(7-0) , vout(8)
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

entity reg is 
port(	Ck,rstn, EN: in std_logic;
		d : in signed( 7 downto 0);
		q: out signed(7 downto 0));
end reg;
architecture behavior of reg is
begin
		process (Ck)
		begin
			if (rstn = '0') then
				q<=(others =>'0');
			elsif (Ck'event and Ck ='1') then
				if (EN = '1') then
					q <= d;
				end if;
			end if;
		end process;
end behavior;
