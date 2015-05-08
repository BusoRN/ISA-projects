library IEEE;
use IEEE.std_logic_1164.all;

package lift_opcodes is

	constant OPC_3PI161  : std_logic_vector(2 downto 0) := "000";
 	constant OPC_3PI162  : std_logic_vector(2 downto 0) := "001";  
	constant OPC_PI161: std_logic_vector(2 downto 0) := "010";
 	constant OPC_PI162: std_logic_vector(2 downto 0) := "011";
	constant OPC_PI81 : std_logic_vector(2 downto 0) := "100";
 	constant OPC_PI82 : std_logic_vector(2 downto 0) := "101";
  
  

end lift_opcodes;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
--use IEEE.numeric_std.all; --per la funzione shift_right
use work.lift_opcodes.all;

entity lifting is
	generic (
		busw : integer := 32);
	port(
		in1		 : in std_logic_vector (busw-1 downto 0);
		in2		 : in std_logic_vector (busw-1 downto 0);
		t1opcode 	 : in  std_logic_vector(2 downto 0);
		in1_load  : in  std_logic;
		in2_load  : in  std_logic;
		rst      : in  std_logic;
		clk    	 : in  std_logic;
		glock    : in  std_logic;
		result	 : out std_logic_vector (busw-1 downto 0)
	);
end lifting;	


architecture behavior of lifting is

constant L1_8 	: integer := 51;
constant S1_8 	: integer := 8;
constant L2_8 	: integer := 98;
constant S2_8 	: integer := 8;
constant L1_16 	: integer := 25;
constant S1_16 	: integer := 8;
constant L2_16 	: integer := 50; 
constant S2_16  : integer := 8;
constant L1_316 : integer := 78;
constant S1_316 : integer := 8;
constant L2_316 : integer := 142; 
constant S2_316 : integer := 8;

signal reg_out : std_logic_vector(busw-1 downto 0);  -- register out

begin  -- rtl
regs: process(clk,rst)
  variable mult : signed(2*busw-1 downto 0);
  variable reg_x1,reg_x2,tmp,reg_out_tmp : signed(busw-1 downto 0);
  begin
    if rst = '0' then
      reg_out <= (others => '0');
    elsif clk'event and clk = '1'  then
      if glock = '0' then
        if in2_load = '1' then
          reg_x2 := signed(in2);
        end if;
        if in1_load = '1' then
          reg_x1 := signed(in1);
        end if;

        case t1opcode  is
          when OPC_PI81 =>
            mult := reg_x2 * conv_signed(L1_8,busw);
            tmp := signed(sxt(std_logic_vector(mult(busw-1 downto 8)),busw));
				reg_out_tmp := reg_x1 + tmp;
          when OPC_PI82 =>
            mult := reg_x1 * conv_signed(L2_8,busw);
            tmp := signed(sxt(std_logic_vector(mult(busw-1 downto 8)),busw));

				reg_out_tmp := reg_x2 - tmp;
          when OPC_PI161 =>
            mult := reg_x2 * conv_signed(L1_16,busw);
            tmp := signed(sxt(std_logic_vector(mult(busw-1 downto 8)),busw));
            reg_out_tmp := reg_x1 + tmp;
          when OPC_PI162 =>
            mult := reg_x1 * conv_signed(L2_16,busw);
            tmp := signed(sxt(std_logic_vector(mult(busw-1 downto 8)),busw));
            reg_out_tmp := reg_x2 - tmp;
          when OPC_3PI161 =>
            mult := reg_x2 * conv_signed(L1_316,busw);
            tmp := signed(sxt(std_logic_vector(mult(busw-1 downto 8)),busw));
            reg_out_tmp := reg_x1 + tmp;
          when OPC_3PI162 =>
            mult := reg_x1 * conv_signed(L2_316,busw);
            tmp := signed(sxt(std_logic_vector(mult(busw-1 downto 8)),busw));
            reg_out_tmp := reg_x2 - tmp;
          when others => null;
        end case;
        reg_out <= conv_std_logic_vector(reg_out_tmp,busw);
      end if;
    end if;
  end process regs;

  result <= reg_out;
  
end behavior;
