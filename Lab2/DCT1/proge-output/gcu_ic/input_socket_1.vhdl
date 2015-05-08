library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity input_socket_cons_1 is

  generic (
    BUSW_0 : integer := 32;
    DATAW : integer := 32);
  port (
    databus0 : in std_logic_vector(BUSW_0-1 downto 0);
    data : out std_logic_vector(DATAW-1 downto 0));

end input_socket_cons_1;

architecture input_socket of input_socket_cons_1 is
begin

    -- If width of input bus is greater than width of output,
    -- using the LSB bits.
    -- If width of input bus is smaller than width of output,
    -- using zero extension to generate extra bits.

  process (databus0)
  begin
    if BUSW_0 < DATAW then
      data <= ext(databus0,data'length);
    elsif BUSW_0 > DATAW then
      data <= databus0(DATAW-1 downto 0);
    else
      data <= databus0(BUSW_0-1 downto 0);
    end if;
  end process;
end input_socket;
