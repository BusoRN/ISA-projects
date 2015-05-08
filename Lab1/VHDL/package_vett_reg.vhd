library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

PACKAGE package_vett_reg IS

subtype vett_reg is signed (7 downto 0);

type vett_reg_vector is array (integer range <>) of vett_reg;

subtype vett_reg_16 is signed (15 downto 0);

type vett_reg_vector_16 is array (integer range <>) of vett_reg_16;

subtype vett_reg_19 is signed (17 downto 0);

type vett_reg_vector_19 is array (integer range <>) of vett_reg_19;

-- user defined enumerated type

END package_vett_reg;

package body package_vett_reg is
    
end package_vett_reg;
