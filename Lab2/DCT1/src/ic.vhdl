library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use STD.textio.all;
use work.globals.all;

entity interconn is

  port (
    socket_lsu_i1_data : out std_logic_vector(14 downto 0);
    socket_lsu_o1_data0 : in std_logic_vector(31 downto 0);
    socket_lsu_o1_bus_cntrl : in std_logic_vector(0 downto 0);
    socket_lsu_i2_data : out std_logic_vector(31 downto 0);
    socket_RF_i1_data : out std_logic_vector(31 downto 0);
    socket_RF_o1_data0 : in std_logic_vector(31 downto 0);
    socket_RF_o1_bus_cntrl : in std_logic_vector(0 downto 0);
    socket_bool_i1_data : out std_logic_vector(0 downto 0);
    socket_bool_o1_data0 : in std_logic_vector(0 downto 0);
    socket_bool_o1_bus_cntrl : in std_logic_vector(0 downto 0);
    socket_gcu_i1_data : out std_logic_vector(IMEMADDRWIDTH-1 downto 0);
    socket_gcu_i2_data : out std_logic_vector(IMEMADDRWIDTH-1 downto 0);
    socket_gcu_o1_data0 : in std_logic_vector(IMEMADDRWIDTH-1 downto 0);
    socket_gcu_o1_bus_cntrl : in std_logic_vector(0 downto 0);
    socket_ALU_i1_data : out std_logic_vector(31 downto 0);
    socket_ALU_i2_data : out std_logic_vector(31 downto 0);
    socket_ALU_o1_data0 : in std_logic_vector(31 downto 0);
    socket_ALU_o1_bus_cntrl : in std_logic_vector(0 downto 0);
    socket_LIFTING_i1_data : out std_logic_vector(31 downto 0);
    socket_LIFTING_i2_data : out std_logic_vector(31 downto 0);
    socket_LIFTING_o1_data0 : in std_logic_vector(31 downto 0);
    socket_LIFTING_o1_bus_cntrl : in std_logic_vector(0 downto 0);
    simm_B1 : in std_logic_vector(31 downto 0);
    simm_cntrl_B1 : in std_logic_vector(0 downto 0));

end interconn;

architecture comb_andor of interconn is

  signal databus_B1 : std_logic_vector(31 downto 0);
  signal databus_B1_alt0 : std_logic_vector(31 downto 0);
  signal databus_B1_alt1 : std_logic_vector(31 downto 0);
  signal databus_B1_alt2 : std_logic_vector(31 downto 0);
  signal databus_B1_alt3 : std_logic_vector(31 downto 0);
  signal databus_B1_alt4 : std_logic_vector(31 downto 0);
  signal databus_B1_alt5 : std_logic_vector(31 downto 0);
  signal databus_B1_simm : std_logic_vector(31 downto 0);

  component input_socket_cons_1
    generic (
      BUSW_0 : integer := 32;
      DATAW : integer := 32);
    port (
      databus0 : in std_logic_vector(BUSW_0-1 downto 0);
      data : out std_logic_vector(DATAW-1 downto 0));
  end component;

  component output_socket_cons_1_1
    generic (
      BUSW_0 : integer := 32;
      DATAW_0 : integer := 32);
    port (
      databus0_alt : out std_logic_vector(BUSW_0-1 downto 0);
      data0 : in std_logic_vector(DATAW_0-1 downto 0);
      databus_cntrl : in std_logic_vector(0 downto 0));
  end component;


begin -- comb_andor

  lsu_i1 : input_socket_cons_1
    generic map (
      BUSW_0 => 32,
      DATAW => 15)
    port map (
      databus0 => databus_B1,
      data => socket_lsu_i1_data);

  lsu_o1 : output_socket_cons_1_1
    generic map (
      BUSW_0 => 32,
      DATAW_0 => 32)
    port map (
      databus0_alt => databus_B1_alt5,
      data0 => socket_lsu_o1_data0,
      databus_cntrl => socket_lsu_o1_bus_cntrl);

  lsu_i2 : input_socket_cons_1
    generic map (
      BUSW_0 => 32,
      DATAW => 32)
    port map (
      databus0 => databus_B1,
      data => socket_lsu_i2_data);

  RF_i1 : input_socket_cons_1
    generic map (
      BUSW_0 => 32,
      DATAW => 32)
    port map (
      databus0 => databus_B1,
      data => socket_RF_i1_data);

  RF_o1 : output_socket_cons_1_1
    generic map (
      BUSW_0 => 32,
      DATAW_0 => 32)
    port map (
      databus0_alt => databus_B1_alt4,
      data0 => socket_RF_o1_data0,
      databus_cntrl => socket_RF_o1_bus_cntrl);

  bool_i1 : input_socket_cons_1
    generic map (
      BUSW_0 => 32,
      DATAW => 1)
    port map (
      databus0 => databus_B1,
      data => socket_bool_i1_data);

  bool_o1 : output_socket_cons_1_1
    generic map (
      BUSW_0 => 32,
      DATAW_0 => 1)
    port map (
      databus0_alt => databus_B1_alt3,
      data0 => socket_bool_o1_data0,
      databus_cntrl => socket_bool_o1_bus_cntrl);

  gcu_i1 : input_socket_cons_1
    generic map (
      BUSW_0 => 32,
      DATAW => IMEMADDRWIDTH)
    port map (
      databus0 => databus_B1,
      data => socket_gcu_i1_data);

  gcu_i2 : input_socket_cons_1
    generic map (
      BUSW_0 => 32,
      DATAW => IMEMADDRWIDTH)
    port map (
      databus0 => databus_B1,
      data => socket_gcu_i2_data);

  gcu_o1 : output_socket_cons_1_1
    generic map (
      BUSW_0 => 32,
      DATAW_0 => IMEMADDRWIDTH)
    port map (
      databus0_alt => databus_B1_alt2,
      data0 => socket_gcu_o1_data0,
      databus_cntrl => socket_gcu_o1_bus_cntrl);

  ALU_i1 : input_socket_cons_1
    generic map (
      BUSW_0 => 32,
      DATAW => 32)
    port map (
      databus0 => databus_B1,
      data => socket_ALU_i1_data);

  ALU_i2 : input_socket_cons_1
    generic map (
      BUSW_0 => 32,
      DATAW => 32)
    port map (
      databus0 => databus_B1,
      data => socket_ALU_i2_data);

  ALU_o1 : output_socket_cons_1_1
    generic map (
      BUSW_0 => 32,
      DATAW_0 => 32)
    port map (
      databus0_alt => databus_B1_alt1,
      data0 => socket_ALU_o1_data0,
      databus_cntrl => socket_ALU_o1_bus_cntrl);

  LIFTING_i1 : input_socket_cons_1
    generic map (
      BUSW_0 => 32,
      DATAW => 32)
    port map (
      databus0 => databus_B1,
      data => socket_LIFTING_i1_data);

  LIFTING_i2 : input_socket_cons_1
    generic map (
      BUSW_0 => 32,
      DATAW => 32)
    port map (
      databus0 => databus_B1,
      data => socket_LIFTING_i2_data);

  LIFTING_o1 : output_socket_cons_1_1
    generic map (
      BUSW_0 => 32,
      DATAW_0 => 32)
    port map (
      databus0_alt => databus_B1_alt0,
      data0 => socket_LIFTING_o1_data0,
      databus_cntrl => socket_LIFTING_o1_bus_cntrl);

  simm_socket_B1 : output_socket_cons_1_1
    generic map (
      BUSW_0 => 32,
      DATAW_0 => 32)
    port map (
      databus0_alt => databus_B1_simm,
      data0 => simm_B1,
      databus_cntrl => simm_cntrl_B1);

  databus_B1 <= databus_B1_alt0 or databus_B1_alt1 or databus_B1_alt2 or databus_B1_alt3 or databus_B1_alt4 or databus_B1_alt5 or databus_B1_simm;

end comb_andor;
