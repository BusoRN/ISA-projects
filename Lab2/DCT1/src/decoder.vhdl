library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use work.globals.all;
use work.opcodes.all;

entity decoder is

  port (
    instructionword : in std_logic_vector(INSTRUCTIONWIDTH-1 downto 0);
    pc_load : out std_logic;
    ra_load : out std_logic;
    pc_opcode : out std_logic_vector(0 downto 0);
    lock : in std_logic;
    lock_r : out std_logic;
    clk : in std_logic;
    rstx : in std_logic;
    simm_B1 : out std_logic_vector(31 downto 0);
    simm_cntrl_B1 : out std_logic_vector(0 downto 0);
    socket_lsu_o1_bus_cntrl : out std_logic_vector(0 downto 0);
    socket_RF_o1_bus_cntrl : out std_logic_vector(0 downto 0);
    socket_bool_o1_bus_cntrl : out std_logic_vector(0 downto 0);
    socket_gcu_o1_bus_cntrl : out std_logic_vector(0 downto 0);
    socket_ALU_o1_bus_cntrl : out std_logic_vector(0 downto 0);
    socket_LIFTING_o1_bus_cntrl : out std_logic_vector(0 downto 0);
    fu_LSU_in1t_load : out std_logic;
    fu_LSU_in2_load : out std_logic;
    fu_LSU_opc : out std_logic_vector(2 downto 0);
    fu_ALU_in1t_load : out std_logic;
    fu_ALU_in2_load : out std_logic;
    fu_ALU_opc : out std_logic_vector(3 downto 0);
    fu_LIFTING_x1_load : out std_logic;
    fu_LIFTING_x2_load : out std_logic;
    fu_LIFTING_opc : out std_logic_vector(2 downto 0);
    rf_RF_wr_load : out std_logic;
    rf_RF_wr_opc : out std_logic_vector(2 downto 0);
    rf_RF_rd_load : out std_logic;
    rf_RF_rd_opc : out std_logic_vector(2 downto 0);
    rf_BOOL_wr_load : out std_logic;
    rf_BOOL_wr_opc : out std_logic_vector(0 downto 0);
    rf_BOOL_rd_load : out std_logic;
    rf_BOOL_rd_opc : out std_logic_vector(0 downto 0);
    rf_guard_BOOL_0 : in std_logic;
    rf_guard_BOOL_1 : in std_logic;
    glock : out std_logic);

end decoder;

architecture rtl_andor of decoder is

  -- signals for source, destination and guard fields
  signal src_B1 : std_logic_vector(32 downto 0);
  signal dst_B1 : std_logic_vector(5 downto 0);
  signal grd_B1 : std_logic_vector(2 downto 0);

  -- signals for dedicated immediate slots


  -- squash signals
  signal squash_B1 : std_logic;

  -- socket control signals
  signal socket_lsu_o1_bus_cntrl_reg : std_logic_vector(0 downto 0);
  signal socket_RF_o1_bus_cntrl_reg : std_logic_vector(0 downto 0);
  signal socket_bool_o1_bus_cntrl_reg : std_logic_vector(0 downto 0);
  signal socket_gcu_o1_bus_cntrl_reg : std_logic_vector(0 downto 0);
  signal socket_ALU_o1_bus_cntrl_reg : std_logic_vector(0 downto 0);
  signal socket_LIFTING_o1_bus_cntrl_reg : std_logic_vector(0 downto 0);
  signal simm_B1_reg : std_logic_vector(31 downto 0);
  signal simm_cntrl_B1_reg : std_logic_vector(0 downto 0);

  -- FU control signals
  signal fu_LSU_in1t_load_reg : std_logic;
  signal fu_LSU_in2_load_reg : std_logic;
  signal fu_LSU_opc_reg : std_logic_vector(2 downto 0);
  signal fu_ALU_in1t_load_reg : std_logic;
  signal fu_ALU_in2_load_reg : std_logic;
  signal fu_ALU_opc_reg : std_logic_vector(3 downto 0);
  signal fu_LIFTING_x1_load_reg : std_logic;
  signal fu_LIFTING_x2_load_reg : std_logic;
  signal fu_LIFTING_opc_reg : std_logic_vector(2 downto 0);
  signal fu_gcu_pc_load_reg : std_logic;
  signal fu_gcu_ra_load_reg : std_logic;
  signal fu_gcu_opc_reg : std_logic_vector(0 downto 0);

  -- RF control signals
  signal rf_RF_wr_load_reg : std_logic;
  signal rf_RF_wr_opc_reg : std_logic_vector(2 downto 0);
  signal rf_RF_rd_load_reg : std_logic;
  signal rf_RF_rd_opc_reg : std_logic_vector(2 downto 0);
  signal rf_BOOL_wr_load_reg : std_logic;
  signal rf_BOOL_wr_opc_reg : std_logic_vector(0 downto 0);
  signal rf_BOOL_rd_load_reg : std_logic;
  signal rf_BOOL_rd_opc_reg : std_logic_vector(0 downto 0);

begin

  -- dismembering of instruction
  process (instructionword)
  begin --process
    src_B1 <= instructionword(38 downto 6);
    dst_B1 <= instructionword(5 downto 0);
    grd_B1 <= instructionword(41 downto 39);

  end process;

  -- map control registers to outputs
  fu_LSU_in1t_load <= fu_LSU_in1t_load_reg;
  fu_LSU_in2_load <= fu_LSU_in2_load_reg;
  fu_LSU_opc <= fu_LSU_opc_reg;

  fu_ALU_in1t_load <= fu_ALU_in1t_load_reg;
  fu_ALU_in2_load <= fu_ALU_in2_load_reg;
  fu_ALU_opc <= fu_ALU_opc_reg;

  fu_LIFTING_x1_load <= fu_LIFTING_x1_load_reg;
  fu_LIFTING_x2_load <= fu_LIFTING_x2_load_reg;
  fu_LIFTING_opc <= fu_LIFTING_opc_reg;

  ra_load <= fu_gcu_ra_load_reg;
  pc_load <= fu_gcu_pc_load_reg;
  pc_opcode <= fu_gcu_opc_reg;
  rf_RF_wr_load <= rf_RF_wr_load_reg;
  rf_RF_wr_opc <= rf_RF_wr_opc_reg;
  rf_RF_rd_load <= rf_RF_rd_load_reg;
  rf_RF_rd_opc <= rf_RF_rd_opc_reg;
  rf_BOOL_wr_load <= rf_BOOL_wr_load_reg;
  rf_BOOL_wr_opc <= rf_BOOL_wr_opc_reg;
  rf_BOOL_rd_load <= rf_BOOL_rd_load_reg;
  rf_BOOL_rd_opc <= rf_BOOL_rd_opc_reg;
  socket_lsu_o1_bus_cntrl <= socket_lsu_o1_bus_cntrl_reg;
  socket_RF_o1_bus_cntrl <= socket_RF_o1_bus_cntrl_reg;
  socket_bool_o1_bus_cntrl <= socket_bool_o1_bus_cntrl_reg;
  socket_gcu_o1_bus_cntrl <= socket_gcu_o1_bus_cntrl_reg;
  socket_ALU_o1_bus_cntrl <= socket_ALU_o1_bus_cntrl_reg;
  socket_LIFTING_o1_bus_cntrl <= socket_LIFTING_o1_bus_cntrl_reg;
  simm_cntrl_B1 <= simm_cntrl_B1_reg;
  simm_B1 <= simm_B1_reg;

  -- generate signal squash_B1
  process (rf_guard_BOOL_0, rf_guard_BOOL_1, grd_B1)
    variable sel : integer;
  begin --process
    sel := conv_integer(unsigned(grd_B1));
    case sel is
      when 1 =>
        squash_B1 <= not rf_guard_BOOL_0;
      when 2 =>
        squash_B1 <= rf_guard_BOOL_0;
      when 3 =>
        squash_B1 <= not rf_guard_BOOL_1;
      when 4 =>
        squash_B1 <= rf_guard_BOOL_1;
      when others =>
        squash_B1 <= '0';
    end case;
  end process;



  -- main decoding process
  process (clk, rstx)
  begin
    if (rstx = '0') then
      socket_lsu_o1_bus_cntrl_reg <= (others => '0');
      socket_RF_o1_bus_cntrl_reg <= (others => '0');
      socket_bool_o1_bus_cntrl_reg <= (others => '0');
      socket_gcu_o1_bus_cntrl_reg <= (others => '0');
      socket_ALU_o1_bus_cntrl_reg <= (others => '0');
      socket_LIFTING_o1_bus_cntrl_reg <= (others => '0');

      simm_cntrl_B1_reg <= (others => '0');
      simm_B1_reg <= (others => '0');

      fu_LSU_opc_reg <= (others => '0');
      fu_LSU_in1t_load_reg <= '0';
      fu_LSU_in2_load_reg <= '0';
      fu_ALU_opc_reg <= (others => '0');
      fu_ALU_in1t_load_reg <= '0';
      fu_ALU_in2_load_reg <= '0';
      fu_LIFTING_opc_reg <= (others => '0');
      fu_LIFTING_x1_load_reg <= '0';
      fu_LIFTING_x2_load_reg <= '0';
      fu_gcu_opc_reg <= (others => '0');
      fu_gcu_pc_load_reg <= '0';
      fu_gcu_ra_load_reg <= '0';

      rf_RF_wr_load_reg <= '0';
      rf_RF_wr_opc_reg <= (others => '0');
      rf_RF_rd_load_reg <= '0';
      rf_RF_rd_opc_reg <= (others => '0');
      rf_BOOL_wr_load_reg <= '0';
      rf_BOOL_wr_opc_reg <= (others => '0');
      rf_BOOL_rd_load_reg <= '0';
      rf_BOOL_rd_opc_reg <= (others => '0');

    elsif (clk'event and clk = '1') then
      if (lock = '0') then -- rising clock edge

        -- bus control signals for output sockets
        if (conv_integer(unsigned(src_B1(32 downto 29))) = 11 and squash_B1 = '0') then
          socket_lsu_o1_bus_cntrl_reg(0) <= '1';
        else
          socket_lsu_o1_bus_cntrl_reg(0) <= '0';
        end if;
        if (conv_integer(unsigned(src_B1(32 downto 29))) = 8 and squash_B1 = '0') then
          socket_RF_o1_bus_cntrl_reg(0) <= '1';
        else
          socket_RF_o1_bus_cntrl_reg(0) <= '0';
        end if;
        if (conv_integer(unsigned(src_B1(32 downto 29))) = 9 and squash_B1 = '0') then
          socket_bool_o1_bus_cntrl_reg(0) <= '1';
        else
          socket_bool_o1_bus_cntrl_reg(0) <= '0';
        end if;
        if (conv_integer(unsigned(src_B1(32 downto 29))) = 12 and squash_B1 = '0') then
          socket_gcu_o1_bus_cntrl_reg(0) <= '1';
        else
          socket_gcu_o1_bus_cntrl_reg(0) <= '0';
        end if;
        if (conv_integer(unsigned(src_B1(32 downto 29))) = 13 and squash_B1 = '0') then
          socket_ALU_o1_bus_cntrl_reg(0) <= '1';
        else
          socket_ALU_o1_bus_cntrl_reg(0) <= '0';
        end if;
        if (conv_integer(unsigned(src_B1(32 downto 29))) = 14 and squash_B1 = '0') then
          socket_LIFTING_o1_bus_cntrl_reg(0) <= '1';
        else
          socket_LIFTING_o1_bus_cntrl_reg(0) <= '0';
        end if;

        -- bus control signals for short immediate sockets
        if (conv_integer(unsigned(src_B1(32 downto 32))) = 0 and squash_B1 = '0') then
          simm_cntrl_B1_reg(0) <= '1';
          simm_B1_reg <= ext(src_B1(31 downto 0), simm_B1_reg'length);
        else
          simm_cntrl_B1_reg(0) <= '0';
        end if;

        -- data control signals for output sockets connected to FUs

        -- control signals for RF read ports
        if (conv_integer(unsigned(src_B1(32 downto 29))) = 8 and squash_B1 = '0') then
          rf_RF_rd_load_reg <= '1';
          rf_RF_rd_opc_reg <= ext(src_B1(2 downto 0), rf_RF_rd_opc_reg'length);
        else
          rf_RF_rd_load_reg <= '0';
        end if;
        if (conv_integer(unsigned(src_B1(32 downto 29))) = 9 and squash_B1 = '0') then
          rf_BOOL_rd_load_reg <= '1';
          rf_BOOL_rd_opc_reg <= ext(src_B1(0 downto 0), rf_BOOL_rd_opc_reg'length);
        else
          rf_BOOL_rd_load_reg <= '0';
        end if;

        -- control signals for IU read ports

        -- control signals for FU inputs
        if (conv_integer(unsigned(dst_B1(5 downto 3))) = 2 and squash_B1 = '0') then
          if (conv_integer(unsigned(dst_B1(2 downto 0))) = 4) then
            fu_LSU_in1t_load_reg <= '1';
            fu_LSU_opc_reg <= conv_std_logic_vector(4, fu_LSU_opc_reg'length);
          elsif (conv_integer(unsigned(dst_B1(2 downto 0))) = 2) then
            fu_LSU_in1t_load_reg <= '1';
            fu_LSU_opc_reg <= conv_std_logic_vector(2, fu_LSU_opc_reg'length);
          elsif (conv_integer(unsigned(dst_B1(2 downto 0))) = 0) then
            fu_LSU_in1t_load_reg <= '1';
            fu_LSU_opc_reg <= conv_std_logic_vector(0, fu_LSU_opc_reg'length);
          elsif (conv_integer(unsigned(dst_B1(2 downto 0))) = 7) then
            fu_LSU_in1t_load_reg <= '1';
            fu_LSU_opc_reg <= conv_std_logic_vector(7, fu_LSU_opc_reg'length);
          elsif (conv_integer(unsigned(dst_B1(2 downto 0))) = 6) then
            fu_LSU_in1t_load_reg <= '1';
            fu_LSU_opc_reg <= conv_std_logic_vector(6, fu_LSU_opc_reg'length);
          elsif (conv_integer(unsigned(dst_B1(2 downto 0))) = 5) then
            fu_LSU_in1t_load_reg <= '1';
            fu_LSU_opc_reg <= conv_std_logic_vector(5, fu_LSU_opc_reg'length);
          elsif (conv_integer(unsigned(dst_B1(2 downto 0))) = 3) then
            fu_LSU_in1t_load_reg <= '1';
            fu_LSU_opc_reg <= conv_std_logic_vector(3, fu_LSU_opc_reg'length);
          elsif (conv_integer(unsigned(dst_B1(2 downto 0))) = 1) then
            fu_LSU_in1t_load_reg <= '1';
            fu_LSU_opc_reg <= conv_std_logic_vector(1, fu_LSU_opc_reg'length);
          else
            fu_LSU_in1t_load_reg <= '0';
          end if;
        else
          fu_LSU_in1t_load_reg <= '0';
        end if;
        if (conv_integer(unsigned(dst_B1(5 downto 1))) = 23 and squash_B1 = '0') then
          fu_LSU_in2_load_reg <= '1';
        else
          fu_LSU_in2_load_reg <= '0';
        end if;
        if (conv_integer(unsigned(dst_B1(5 downto 4))) = 0 and squash_B1 = '0') then
          if (conv_integer(unsigned(dst_B1(3 downto 0))) = 0) then
            fu_ALU_in1t_load_reg <= '1';
            fu_ALU_opc_reg <= conv_std_logic_vector(0, fu_ALU_opc_reg'length);
          elsif (conv_integer(unsigned(dst_B1(3 downto 0))) = 1) then
            fu_ALU_in1t_load_reg <= '1';
            fu_ALU_opc_reg <= conv_std_logic_vector(1, fu_ALU_opc_reg'length);
          elsif (conv_integer(unsigned(dst_B1(3 downto 0))) = 2) then
            fu_ALU_in1t_load_reg <= '1';
            fu_ALU_opc_reg <= conv_std_logic_vector(2, fu_ALU_opc_reg'length);
          elsif (conv_integer(unsigned(dst_B1(3 downto 0))) = 3) then
            fu_ALU_in1t_load_reg <= '1';
            fu_ALU_opc_reg <= conv_std_logic_vector(3, fu_ALU_opc_reg'length);
          elsif (conv_integer(unsigned(dst_B1(3 downto 0))) = 4) then
            fu_ALU_in1t_load_reg <= '1';
            fu_ALU_opc_reg <= conv_std_logic_vector(4, fu_ALU_opc_reg'length);
          elsif (conv_integer(unsigned(dst_B1(3 downto 0))) = 5) then
            fu_ALU_in1t_load_reg <= '1';
            fu_ALU_opc_reg <= conv_std_logic_vector(5, fu_ALU_opc_reg'length);
          elsif (conv_integer(unsigned(dst_B1(3 downto 0))) = 6) then
            fu_ALU_in1t_load_reg <= '1';
            fu_ALU_opc_reg <= conv_std_logic_vector(6, fu_ALU_opc_reg'length);
          elsif (conv_integer(unsigned(dst_B1(3 downto 0))) = 7) then
            fu_ALU_in1t_load_reg <= '1';
            fu_ALU_opc_reg <= conv_std_logic_vector(7, fu_ALU_opc_reg'length);
          elsif (conv_integer(unsigned(dst_B1(3 downto 0))) = 8) then
            fu_ALU_in1t_load_reg <= '1';
            fu_ALU_opc_reg <= conv_std_logic_vector(8, fu_ALU_opc_reg'length);
          elsif (conv_integer(unsigned(dst_B1(3 downto 0))) = 9) then
            fu_ALU_in1t_load_reg <= '1';
            fu_ALU_opc_reg <= conv_std_logic_vector(9, fu_ALU_opc_reg'length);
          elsif (conv_integer(unsigned(dst_B1(3 downto 0))) = 10) then
            fu_ALU_in1t_load_reg <= '1';
            fu_ALU_opc_reg <= conv_std_logic_vector(10, fu_ALU_opc_reg'length);
          elsif (conv_integer(unsigned(dst_B1(3 downto 0))) = 11) then
            fu_ALU_in1t_load_reg <= '1';
            fu_ALU_opc_reg <= conv_std_logic_vector(11, fu_ALU_opc_reg'length);
          elsif (conv_integer(unsigned(dst_B1(3 downto 0))) = 12) then
            fu_ALU_in1t_load_reg <= '1';
            fu_ALU_opc_reg <= conv_std_logic_vector(12, fu_ALU_opc_reg'length);
          else
            fu_ALU_in1t_load_reg <= '0';
          end if;
        else
          fu_ALU_in1t_load_reg <= '0';
        end if;
        if (conv_integer(unsigned(dst_B1(5 downto 1))) = 25 and squash_B1 = '0') then
          fu_ALU_in2_load_reg <= '1';
        else
          fu_ALU_in2_load_reg <= '0';
        end if;
        if (conv_integer(unsigned(dst_B1(5 downto 3))) = 4 and squash_B1 = '0') then
          if (conv_integer(unsigned(dst_B1(2 downto 0))) = 4) then
            fu_LIFTING_x1_load_reg <= '1';
            fu_LIFTING_opc_reg <= conv_std_logic_vector(4, fu_LIFTING_opc_reg'length);
          elsif (conv_integer(unsigned(dst_B1(2 downto 0))) = 5) then
            fu_LIFTING_x1_load_reg <= '1';
            fu_LIFTING_opc_reg <= conv_std_logic_vector(5, fu_LIFTING_opc_reg'length);
          elsif (conv_integer(unsigned(dst_B1(2 downto 0))) = 2) then
            fu_LIFTING_x1_load_reg <= '1';
            fu_LIFTING_opc_reg <= conv_std_logic_vector(2, fu_LIFTING_opc_reg'length);
          elsif (conv_integer(unsigned(dst_B1(2 downto 0))) = 3) then
            fu_LIFTING_x1_load_reg <= '1';
            fu_LIFTING_opc_reg <= conv_std_logic_vector(3, fu_LIFTING_opc_reg'length);
          elsif (conv_integer(unsigned(dst_B1(2 downto 0))) = 0) then
            fu_LIFTING_x1_load_reg <= '1';
            fu_LIFTING_opc_reg <= conv_std_logic_vector(0, fu_LIFTING_opc_reg'length);
          elsif (conv_integer(unsigned(dst_B1(2 downto 0))) = 1) then
            fu_LIFTING_x1_load_reg <= '1';
            fu_LIFTING_opc_reg <= conv_std_logic_vector(1, fu_LIFTING_opc_reg'length);
          else
            fu_LIFTING_x1_load_reg <= '0';
          end if;
        else
          fu_LIFTING_x1_load_reg <= '0';
        end if;
        if (conv_integer(unsigned(dst_B1(5 downto 1))) = 26 and squash_B1 = '0') then
          fu_LIFTING_x2_load_reg <= '1';
        else
          fu_LIFTING_x2_load_reg <= '0';
        end if;
        if (conv_integer(unsigned(dst_B1(5 downto 1))) = 21 and squash_B1 = '0') then
          if (conv_integer(unsigned(dst_B1(0 downto 0))) = 1) then
            fu_gcu_pc_load_reg <= '1';
          fu_gcu_opc_reg <= IFE_JUMP;
          elsif (conv_integer(unsigned(dst_B1(0 downto 0))) = 0) then
            fu_gcu_pc_load_reg <= '1';
          fu_gcu_opc_reg <= IFE_CALL;
          else
            fu_gcu_pc_load_reg <= '0';
          end if;
        else
          fu_gcu_pc_load_reg <= '0';
        end if;
        if (conv_integer(unsigned(dst_B1(5 downto 1))) = 24 and squash_B1 = '0') then
          fu_gcu_ra_load_reg <= '1';
        else
          fu_gcu_ra_load_reg <= '0';
        end if;

        -- control signals for RF inputs
        if (conv_integer(unsigned(dst_B1(5 downto 3))) = 3 and squash_B1 = '0') then
          rf_RF_wr_load_reg <= '1';
          rf_RF_wr_opc_reg <= dst_B1(2 downto 0);
        else
          rf_RF_wr_load_reg <= '0';
        end if;
        if (conv_integer(unsigned(dst_B1(5 downto 1))) = 20 and squash_B1 = '0') then
          rf_BOOL_wr_load_reg <= '1';
          rf_BOOL_wr_opc_reg <= dst_B1(0 downto 0);
        else
          rf_BOOL_wr_load_reg <= '0';
        end if;
      end if;
    end if;
  end process;

  lock_r <= '0';
  glock <= lock;


end rtl_andor;
