library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.package_vett_reg.all;

entity Shift is
port(	rstn,en,Ck: in std_logic;
		Dato_in_bit: in std_logic; 
		dato_out_bit: out std_logic;
		Dato_in: in signed (7 downto 0); -- dato in (7-0)
		dato_out: out vett_reg_vector(0 to 6));
end Shift;

architecture A of Shift is

component ShiftIN is
port(	rstn,en,Ck: in std_logic;
		Dato_in: in signed (7 downto 0); -- dato in (7-0)
		dato_out: out vett_reg_vector(0 to 6));
end component ShiftIN;

component ShiftIN_bit is
port(	rstn,en,Ck: in std_logic;
		Dato_in: in std_logic; 
		dato_out: out std_logic);
end component ShiftIN_bit;

begin

SRI: ShiftIN port map(rstn => rstn,en => en,Ck => Ck,Dato_in => Dato_in ,dato_out => dato_out);
SRI_bit: ShiftIN_bit port map(rstn => rstn, en => en, Ck=> Ck,	Dato_in => Dato_in_bit,dato_out=> dato_out_bit);

end A;