library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use work.globals.all;
use work.util.all;
use work.imem_mau.all;
use work.toplevel_params.all;

entity toplevel is

  port (
    clk : in std_logic;
    rstx : in std_logic;
    busy : in std_logic;
    imem_en_x : out std_logic;
    imem_addr : out std_logic_vector(IMEMADDRWIDTH-1 downto 0);
    imem_data : in std_logic_vector(IMEMWIDTHINMAUS*IMEMMAUWIDTH-1 downto 0);
    pc_init : in std_logic_vector(IMEMADDRWIDTH-1 downto 0);
    fu_LSU_data_in : in std_logic_vector(fu_LSU_dataw-1 downto 0);
    fu_LSU_data_out : out std_logic_vector(fu_LSU_dataw-1 downto 0);
    fu_LSU_addr : out std_logic_vector(fu_LSU_addrw-2-1 downto 0);
    fu_LSU_mem_en_x : out std_logic_vector(0 downto 0);
    fu_LSU_wr_en_x : out std_logic_vector(0 downto 0);
    fu_LSU_wr_mask_x : out std_logic_vector(fu_LSU_dataw-1 downto 0));

end toplevel;

architecture structural of toplevel is

  signal decomp_fetch_en_wire : std_logic;
  signal decomp_lock_wire : std_logic;
  signal decomp_fetchblock_wire : std_logic_vector(IMEMWIDTHINMAUS*IMEMMAUWIDTH-1 downto 0);
  signal decomp_instructionword_wire : std_logic_vector(INSTRUCTIONWIDTH-1 downto 0);
  signal decomp_glock_wire : std_logic;
  signal decomp_lock_r_wire : std_logic;
  signal fu_LSU_t1data_wire : std_logic_vector(14 downto 0);
  signal fu_LSU_t1load_wire : std_logic;
  signal fu_LSU_o1data_wire : std_logic_vector(31 downto 0);
  signal fu_LSU_o1load_wire : std_logic;
  signal fu_LSU_r1data_wire : std_logic_vector(31 downto 0);
  signal fu_LSU_t1opcode_wire : std_logic_vector(2 downto 0);
  signal fu_LSU_glock_wire : std_logic;
  signal fu_ALU_t1data_wire : std_logic_vector(31 downto 0);
  signal fu_ALU_t1load_wire : std_logic;
  signal fu_ALU_r1data_wire : std_logic_vector(31 downto 0);
  signal fu_ALU_o1data_wire : std_logic_vector(31 downto 0);
  signal fu_ALU_o1load_wire : std_logic;
  signal fu_ALU_t1opcode_wire : std_logic_vector(3 downto 0);
  signal fu_ALU_glock_wire : std_logic;
  signal fu_LIFTING_in1_wire : std_logic_vector(31 downto 0);
  signal fu_LIFTING_in1_load_wire : std_logic;
  signal fu_LIFTING_in2_wire : std_logic_vector(31 downto 0);
  signal fu_LIFTING_in2_load_wire : std_logic;
  signal fu_LIFTING_result_wire : std_logic_vector(31 downto 0);
  signal fu_LIFTING_t1opcode_wire : std_logic_vector(2 downto 0);
  signal fu_LIFTING_glock_wire : std_logic;
  signal rf_BOOL_r1data_wire : std_logic_vector(0 downto 0);
  signal rf_BOOL_r1load_wire : std_logic;
  signal rf_BOOL_r1opcode_wire : std_logic_vector(0 downto 0);
  signal rf_BOOL_t1data_wire : std_logic_vector(0 downto 0);
  signal rf_BOOL_t1load_wire : std_logic;
  signal rf_BOOL_t1opcode_wire : std_logic_vector(0 downto 0);
  signal rf_BOOL_guard_wire : std_logic_vector(1 downto 0);
  signal rf_BOOL_glock_wire : std_logic;
  signal ic_socket_lsu_i1_data_wire : std_logic_vector(14 downto 0);
  signal ic_socket_lsu_o1_data0_wire : std_logic_vector(31 downto 0);
  signal ic_socket_lsu_o1_bus_cntrl_wire : std_logic_vector(0 downto 0);
  signal ic_socket_lsu_i2_data_wire : std_logic_vector(31 downto 0);
  signal ic_socket_RF_i1_data_wire : std_logic_vector(31 downto 0);
  signal ic_socket_RF_o1_data0_wire : std_logic_vector(31 downto 0);
  signal ic_socket_RF_o1_bus_cntrl_wire : std_logic_vector(0 downto 0);
  signal ic_socket_bool_i1_data_wire : std_logic_vector(0 downto 0);
  signal ic_socket_bool_o1_data0_wire : std_logic_vector(0 downto 0);
  signal ic_socket_bool_o1_bus_cntrl_wire : std_logic_vector(0 downto 0);
  signal ic_socket_gcu_i1_data_wire : std_logic_vector(IMEMADDRWIDTH-1 downto 0);
  signal ic_socket_gcu_i2_data_wire : std_logic_vector(IMEMADDRWIDTH-1 downto 0);
  signal ic_socket_gcu_o1_data0_wire : std_logic_vector(IMEMADDRWIDTH-1 downto 0);
  signal ic_socket_gcu_o1_bus_cntrl_wire : std_logic_vector(0 downto 0);
  signal ic_socket_ALU_i1_data_wire : std_logic_vector(31 downto 0);
  signal ic_socket_ALU_i2_data_wire : std_logic_vector(31 downto 0);
  signal ic_socket_ALU_o1_data0_wire : std_logic_vector(31 downto 0);
  signal ic_socket_ALU_o1_bus_cntrl_wire : std_logic_vector(0 downto 0);
  signal ic_socket_LIFTING_i1_data_wire : std_logic_vector(31 downto 0);
  signal ic_socket_LIFTING_i2_data_wire : std_logic_vector(31 downto 0);
  signal ic_socket_LIFTING_o1_data0_wire : std_logic_vector(31 downto 0);
  signal ic_socket_LIFTING_o1_bus_cntrl_wire : std_logic_vector(0 downto 0);
  signal ic_simm_B1_wire : std_logic_vector(31 downto 0);
  signal ic_simm_cntrl_B1_wire : std_logic_vector(0 downto 0);
  signal rf_RF_r1data_wire : std_logic_vector(31 downto 0);
  signal rf_RF_r1load_wire : std_logic;
  signal rf_RF_r1opcode_wire : std_logic_vector(2 downto 0);
  signal rf_RF_t1data_wire : std_logic_vector(31 downto 0);
  signal rf_RF_t1load_wire : std_logic;
  signal rf_RF_t1opcode_wire : std_logic_vector(2 downto 0);
  signal rf_RF_guard_wire : std_logic_vector(4 downto 0);
  signal rf_RF_glock_wire : std_logic;
  signal inst_decoder_instructionword_wire : std_logic_vector(INSTRUCTIONWIDTH-1 downto 0);
  signal inst_decoder_pc_load_wire : std_logic;
  signal inst_decoder_ra_load_wire : std_logic;
  signal inst_decoder_pc_opcode_wire : std_logic_vector(0 downto 0);
  signal inst_decoder_lock_wire : std_logic;
  signal inst_decoder_lock_r_wire : std_logic;
  signal inst_decoder_simm_B1_wire : std_logic_vector(31 downto 0);
  signal inst_decoder_simm_cntrl_B1_wire : std_logic_vector(0 downto 0);
  signal inst_decoder_socket_lsu_o1_bus_cntrl_wire : std_logic_vector(0 downto 0);
  signal inst_decoder_socket_RF_o1_bus_cntrl_wire : std_logic_vector(0 downto 0);
  signal inst_decoder_socket_bool_o1_bus_cntrl_wire : std_logic_vector(0 downto 0);
  signal inst_decoder_socket_gcu_o1_bus_cntrl_wire : std_logic_vector(0 downto 0);
  signal inst_decoder_socket_ALU_o1_bus_cntrl_wire : std_logic_vector(0 downto 0);
  signal inst_decoder_socket_LIFTING_o1_bus_cntrl_wire : std_logic_vector(0 downto 0);
  signal inst_decoder_fu_LSU_in1t_load_wire : std_logic;
  signal inst_decoder_fu_LSU_in2_load_wire : std_logic;
  signal inst_decoder_fu_LSU_opc_wire : std_logic_vector(2 downto 0);
  signal inst_decoder_fu_ALU_in1t_load_wire : std_logic;
  signal inst_decoder_fu_ALU_in2_load_wire : std_logic;
  signal inst_decoder_fu_ALU_opc_wire : std_logic_vector(3 downto 0);
  signal inst_decoder_fu_LIFTING_x1_load_wire : std_logic;
  signal inst_decoder_fu_LIFTING_x2_load_wire : std_logic;
  signal inst_decoder_fu_LIFTING_opc_wire : std_logic_vector(2 downto 0);
  signal inst_decoder_rf_RF_wr_load_wire : std_logic;
  signal inst_decoder_rf_RF_wr_opc_wire : std_logic_vector(2 downto 0);
  signal inst_decoder_rf_RF_rd_load_wire : std_logic;
  signal inst_decoder_rf_RF_rd_opc_wire : std_logic_vector(2 downto 0);
  signal inst_decoder_rf_BOOL_wr_load_wire : std_logic;
  signal inst_decoder_rf_BOOL_wr_opc_wire : std_logic_vector(0 downto 0);
  signal inst_decoder_rf_BOOL_rd_load_wire : std_logic;
  signal inst_decoder_rf_BOOL_rd_opc_wire : std_logic_vector(0 downto 0);
  signal inst_decoder_rf_guard_BOOL_0_wire : std_logic;
  signal inst_decoder_rf_guard_BOOL_1_wire : std_logic;
  signal inst_decoder_glock_wire : std_logic;
  signal inst_fetch_ra_out_wire : std_logic_vector(IMEMADDRWIDTH-1 downto 0);
  signal inst_fetch_ra_in_wire : std_logic_vector(IMEMADDRWIDTH-1 downto 0);
  signal inst_fetch_pc_in_wire : std_logic_vector(IMEMADDRWIDTH-1 downto 0);
  signal inst_fetch_pc_load_wire : std_logic;
  signal inst_fetch_ra_load_wire : std_logic;
  signal inst_fetch_pc_opcode_wire : std_logic_vector(0 downto 0);
  signal inst_fetch_fetch_en_wire : std_logic;
  signal inst_fetch_glock_wire : std_logic;
  signal inst_fetch_fetchblock_wire : std_logic_vector(IMEMWIDTHINMAUS*IMEMMAUWIDTH-1 downto 0);
  signal ground_signal : std_logic_vector(4 downto 0);

  component ifetch
    port (
      clk : in std_logic;
      rstx : in std_logic;
      ra_out : out std_logic_vector(IMEMADDRWIDTH-1 downto 0);
      ra_in : in std_logic_vector(IMEMADDRWIDTH-1 downto 0);
      busy : in std_logic;
      imem_en_x : out std_logic;
      imem_addr : out std_logic_vector(IMEMADDRWIDTH-1 downto 0);
      imem_data : in std_logic_vector(IMEMWIDTHINMAUS*IMEMMAUWIDTH-1 downto 0);
      pc_in : in std_logic_vector(IMEMADDRWIDTH-1 downto 0);
      pc_load : in std_logic;
      ra_load : in std_logic;
      pc_opcode : in std_logic_vector(1-1 downto 0);
      fetch_en : in std_logic;
      glock : out std_logic;
      fetchblock : out std_logic_vector(IMEMWIDTHINMAUS*IMEMMAUWIDTH-1 downto 0);
      pc_init : in std_logic_vector(IMEMADDRWIDTH-1 downto 0));
  end component;

  component decompressor
    port (
      fetch_en : out std_logic;
      lock : in std_logic;
      fetchblock : in std_logic_vector(IMEMWIDTHINMAUS*IMEMMAUWIDTH-1 downto 0);
      clk : in std_logic;
      rstx : in std_logic;
      instructionword : out std_logic_vector(INSTRUCTIONWIDTH-1 downto 0);
      glock : out std_logic;
      lock_r : in std_logic);
  end component;

  component decoder
    port (
      instructionword : in std_logic_vector(INSTRUCTIONWIDTH-1 downto 0);
      pc_load : out std_logic;
      ra_load : out std_logic;
      pc_opcode : out std_logic_vector(1-1 downto 0);
      lock : in std_logic;
      lock_r : out std_logic;
      clk : in std_logic;
      rstx : in std_logic;
      simm_B1 : out std_logic_vector(32-1 downto 0);
      simm_cntrl_B1 : out std_logic_vector(1-1 downto 0);
      socket_lsu_o1_bus_cntrl : out std_logic_vector(1-1 downto 0);
      socket_RF_o1_bus_cntrl : out std_logic_vector(1-1 downto 0);
      socket_bool_o1_bus_cntrl : out std_logic_vector(1-1 downto 0);
      socket_gcu_o1_bus_cntrl : out std_logic_vector(1-1 downto 0);
      socket_ALU_o1_bus_cntrl : out std_logic_vector(1-1 downto 0);
      socket_LIFTING_o1_bus_cntrl : out std_logic_vector(1-1 downto 0);
      fu_LSU_in1t_load : out std_logic;
      fu_LSU_in2_load : out std_logic;
      fu_LSU_opc : out std_logic_vector(3-1 downto 0);
      fu_ALU_in1t_load : out std_logic;
      fu_ALU_in2_load : out std_logic;
      fu_ALU_opc : out std_logic_vector(4-1 downto 0);
      fu_LIFTING_x1_load : out std_logic;
      fu_LIFTING_x2_load : out std_logic;
      fu_LIFTING_opc : out std_logic_vector(3-1 downto 0);
      rf_RF_wr_load : out std_logic;
      rf_RF_wr_opc : out std_logic_vector(3-1 downto 0);
      rf_RF_rd_load : out std_logic;
      rf_RF_rd_opc : out std_logic_vector(3-1 downto 0);
      rf_BOOL_wr_load : out std_logic;
      rf_BOOL_wr_opc : out std_logic_vector(1-1 downto 0);
      rf_BOOL_rd_load : out std_logic;
      rf_BOOL_rd_opc : out std_logic_vector(1-1 downto 0);
      rf_guard_BOOL_0 : in std_logic;
      rf_guard_BOOL_1 : in std_logic;
      glock : out std_logic);
  end component;

  component fu_ldh_ldhu_ldq_ldqu_ldw_sth_stq_stw_always_3
    generic (
      addrw : integer;
      dataw : integer);
    port (
      t1data : in std_logic_vector(addrw-1 downto 0);
      t1load : in std_logic;
      o1data : in std_logic_vector(dataw-1 downto 0);
      o1load : in std_logic;
      r1data : out std_logic_vector(dataw-1 downto 0);
      t1opcode : in std_logic_vector(3-1 downto 0);
      data_in : in std_logic_vector(dataw-1 downto 0);
      data_out : out std_logic_vector(dataw-1 downto 0);
      addr : out std_logic_vector(addrw-2-1 downto 0);
      mem_en_x : out std_logic_vector(1-1 downto 0);
      wr_en_x : out std_logic_vector(1-1 downto 0);
      wr_mask_x : out std_logic_vector(dataw-1 downto 0);
      clk : in std_logic;
      rstx : in std_logic;
      glock : in std_logic);
  end component;

  component fu_add_and_eq_gt_gtu_ior_shl_shr_shru_sub_sxhw_sxqw_xor_always_1
    generic (
      dataw : integer;
      shiftw : integer);
    port (
      t1data : in std_logic_vector(dataw-1 downto 0);
      t1load : in std_logic;
      r1data : out std_logic_vector(dataw-1 downto 0);
      o1data : in std_logic_vector(dataw-1 downto 0);
      o1load : in std_logic;
      t1opcode : in std_logic_vector(4-1 downto 0);
      clk : in std_logic;
      rstx : in std_logic;
      glock : in std_logic);
  end component;

  component lifting
    generic (
      busw : integer);
    port (
      in1 : in std_logic_vector(busw-1 downto 0);
      in1_load : in std_logic;
      in2 : in std_logic_vector(busw-1 downto 0);
      in2_load : in std_logic;
      result : out std_logic_vector(busw-1 downto 0);
      t1opcode : in std_logic_vector(3-1 downto 0);
      clk : in std_logic;
      rst : in std_logic;
      glock : in std_logic);
  end component;

  component rf_1wr_1rd_always_1_guarded_0
    generic (
      dataw : integer;
      rf_size : integer);
    port (
      r1data : out std_logic_vector(dataw-1 downto 0);
      r1load : in std_logic;
      r1opcode : in std_logic_vector(bit_width(rf_size)-1 downto 0);
      t1data : in std_logic_vector(dataw-1 downto 0);
      t1load : in std_logic;
      t1opcode : in std_logic_vector(bit_width(rf_size)-1 downto 0);
      guard : out std_logic_vector(rf_size-1 downto 0);
      clk : in std_logic;
      rstx : in std_logic;
      glock : in std_logic);
  end component;

  component interconn
    port (
      socket_lsu_i1_data : out std_logic_vector(15-1 downto 0);
      socket_lsu_o1_data0 : in std_logic_vector(32-1 downto 0);
      socket_lsu_o1_bus_cntrl : in std_logic_vector(1-1 downto 0);
      socket_lsu_i2_data : out std_logic_vector(32-1 downto 0);
      socket_RF_i1_data : out std_logic_vector(32-1 downto 0);
      socket_RF_o1_data0 : in std_logic_vector(32-1 downto 0);
      socket_RF_o1_bus_cntrl : in std_logic_vector(1-1 downto 0);
      socket_bool_i1_data : out std_logic_vector(1-1 downto 0);
      socket_bool_o1_data0 : in std_logic_vector(1-1 downto 0);
      socket_bool_o1_bus_cntrl : in std_logic_vector(1-1 downto 0);
      socket_gcu_i1_data : out std_logic_vector(IMEMADDRWIDTH-1 downto 0);
      socket_gcu_i2_data : out std_logic_vector(IMEMADDRWIDTH-1 downto 0);
      socket_gcu_o1_data0 : in std_logic_vector(IMEMADDRWIDTH-1 downto 0);
      socket_gcu_o1_bus_cntrl : in std_logic_vector(1-1 downto 0);
      socket_ALU_i1_data : out std_logic_vector(32-1 downto 0);
      socket_ALU_i2_data : out std_logic_vector(32-1 downto 0);
      socket_ALU_o1_data0 : in std_logic_vector(32-1 downto 0);
      socket_ALU_o1_bus_cntrl : in std_logic_vector(1-1 downto 0);
      socket_LIFTING_i1_data : out std_logic_vector(32-1 downto 0);
      socket_LIFTING_i2_data : out std_logic_vector(32-1 downto 0);
      socket_LIFTING_o1_data0 : in std_logic_vector(32-1 downto 0);
      socket_LIFTING_o1_bus_cntrl : in std_logic_vector(1-1 downto 0);
      simm_B1 : in std_logic_vector(32-1 downto 0);
      simm_cntrl_B1 : in std_logic_vector(1-1 downto 0));
  end component;


begin

  ic_socket_gcu_o1_data0_wire <= inst_fetch_ra_out_wire;
  inst_fetch_ra_in_wire <= ic_socket_gcu_i2_data_wire;
  inst_fetch_pc_in_wire <= ic_socket_gcu_i1_data_wire;
  inst_fetch_pc_load_wire <= inst_decoder_pc_load_wire;
  inst_fetch_ra_load_wire <= inst_decoder_ra_load_wire;
  inst_fetch_pc_opcode_wire <= inst_decoder_pc_opcode_wire;
  inst_fetch_fetch_en_wire <= decomp_fetch_en_wire;
  decomp_lock_wire <= inst_fetch_glock_wire;
  decomp_fetchblock_wire <= inst_fetch_fetchblock_wire;
  inst_decoder_instructionword_wire <= decomp_instructionword_wire;
  inst_decoder_lock_wire <= decomp_glock_wire;
  decomp_lock_r_wire <= inst_decoder_lock_r_wire;
  ic_simm_B1_wire <= inst_decoder_simm_B1_wire;
  ic_simm_cntrl_B1_wire <= inst_decoder_simm_cntrl_B1_wire;
  ic_socket_lsu_o1_bus_cntrl_wire <= inst_decoder_socket_lsu_o1_bus_cntrl_wire;
  ic_socket_RF_o1_bus_cntrl_wire <= inst_decoder_socket_RF_o1_bus_cntrl_wire;
  ic_socket_bool_o1_bus_cntrl_wire <= inst_decoder_socket_bool_o1_bus_cntrl_wire;
  ic_socket_gcu_o1_bus_cntrl_wire <= inst_decoder_socket_gcu_o1_bus_cntrl_wire;
  ic_socket_ALU_o1_bus_cntrl_wire <= inst_decoder_socket_ALU_o1_bus_cntrl_wire;
  ic_socket_LIFTING_o1_bus_cntrl_wire <= inst_decoder_socket_LIFTING_o1_bus_cntrl_wire;
  fu_LSU_t1load_wire <= inst_decoder_fu_LSU_in1t_load_wire;
  fu_LSU_o1load_wire <= inst_decoder_fu_LSU_in2_load_wire;
  fu_LSU_t1opcode_wire <= inst_decoder_fu_LSU_opc_wire;
  fu_ALU_t1load_wire <= inst_decoder_fu_ALU_in1t_load_wire;
  fu_ALU_o1load_wire <= inst_decoder_fu_ALU_in2_load_wire;
  fu_ALU_t1opcode_wire <= inst_decoder_fu_ALU_opc_wire;
  fu_LIFTING_in1_load_wire <= inst_decoder_fu_LIFTING_x1_load_wire;
  fu_LIFTING_in2_load_wire <= inst_decoder_fu_LIFTING_x2_load_wire;
  fu_LIFTING_t1opcode_wire <= inst_decoder_fu_LIFTING_opc_wire;
  rf_RF_t1load_wire <= inst_decoder_rf_RF_wr_load_wire;
  rf_RF_t1opcode_wire <= inst_decoder_rf_RF_wr_opc_wire;
  rf_RF_r1load_wire <= inst_decoder_rf_RF_rd_load_wire;
  rf_RF_r1opcode_wire <= inst_decoder_rf_RF_rd_opc_wire;
  rf_BOOL_t1load_wire <= inst_decoder_rf_BOOL_wr_load_wire;
  rf_BOOL_t1opcode_wire <= inst_decoder_rf_BOOL_wr_opc_wire;
  rf_BOOL_r1load_wire <= inst_decoder_rf_BOOL_rd_load_wire;
  rf_BOOL_r1opcode_wire <= inst_decoder_rf_BOOL_rd_opc_wire;
  inst_decoder_rf_guard_BOOL_0_wire <= rf_BOOL_guard_wire(0);
  inst_decoder_rf_guard_BOOL_1_wire <= rf_BOOL_guard_wire(1);
  fu_LSU_glock_wire <= inst_decoder_glock_wire;
  fu_ALU_glock_wire <= inst_decoder_glock_wire;
  fu_LIFTING_glock_wire <= inst_decoder_glock_wire;
  rf_RF_glock_wire <= inst_decoder_glock_wire;
  rf_BOOL_glock_wire <= inst_decoder_glock_wire;
  fu_LSU_t1data_wire <= ic_socket_lsu_i1_data_wire;
  fu_LSU_o1data_wire <= ic_socket_lsu_i2_data_wire;
  ic_socket_lsu_o1_data0_wire <= fu_LSU_r1data_wire;
  fu_ALU_t1data_wire <= ic_socket_ALU_i1_data_wire;
  ic_socket_ALU_o1_data0_wire <= fu_ALU_r1data_wire;
  fu_ALU_o1data_wire <= ic_socket_ALU_i2_data_wire;
  fu_LIFTING_in1_wire <= ic_socket_LIFTING_i1_data_wire;
  fu_LIFTING_in2_wire <= ic_socket_LIFTING_i2_data_wire;
  ic_socket_LIFTING_o1_data0_wire <= fu_LIFTING_result_wire;
  ic_socket_RF_o1_data0_wire <= rf_RF_r1data_wire;
  rf_RF_t1data_wire <= ic_socket_RF_i1_data_wire;
  ic_socket_bool_o1_data0_wire <= rf_BOOL_r1data_wire;
  rf_BOOL_t1data_wire <= ic_socket_bool_i1_data_wire;
  ground_signal <= (others => '0');

  inst_fetch : ifetch
    port map (
      clk => clk,
      rstx => rstx,
      ra_out => inst_fetch_ra_out_wire,
      ra_in => inst_fetch_ra_in_wire,
      busy => busy,
      imem_en_x => imem_en_x,
      imem_addr => imem_addr,
      imem_data => imem_data,
      pc_in => inst_fetch_pc_in_wire,
      pc_load => inst_fetch_pc_load_wire,
      ra_load => inst_fetch_ra_load_wire,
      pc_opcode => inst_fetch_pc_opcode_wire,
      fetch_en => inst_fetch_fetch_en_wire,
      glock => inst_fetch_glock_wire,
      fetchblock => inst_fetch_fetchblock_wire,
      pc_init => pc_init);

  decomp : decompressor
    port map (
      fetch_en => decomp_fetch_en_wire,
      lock => decomp_lock_wire,
      fetchblock => decomp_fetchblock_wire,
      clk => clk,
      rstx => rstx,
      instructionword => decomp_instructionword_wire,
      glock => decomp_glock_wire,
      lock_r => decomp_lock_r_wire);

  inst_decoder : decoder
    port map (
      instructionword => inst_decoder_instructionword_wire,
      pc_load => inst_decoder_pc_load_wire,
      ra_load => inst_decoder_ra_load_wire,
      pc_opcode => inst_decoder_pc_opcode_wire,
      lock => inst_decoder_lock_wire,
      lock_r => inst_decoder_lock_r_wire,
      clk => clk,
      rstx => rstx,
      simm_B1 => inst_decoder_simm_B1_wire,
      simm_cntrl_B1 => inst_decoder_simm_cntrl_B1_wire,
      socket_lsu_o1_bus_cntrl => inst_decoder_socket_lsu_o1_bus_cntrl_wire,
      socket_RF_o1_bus_cntrl => inst_decoder_socket_RF_o1_bus_cntrl_wire,
      socket_bool_o1_bus_cntrl => inst_decoder_socket_bool_o1_bus_cntrl_wire,
      socket_gcu_o1_bus_cntrl => inst_decoder_socket_gcu_o1_bus_cntrl_wire,
      socket_ALU_o1_bus_cntrl => inst_decoder_socket_ALU_o1_bus_cntrl_wire,
      socket_LIFTING_o1_bus_cntrl => inst_decoder_socket_LIFTING_o1_bus_cntrl_wire,
      fu_LSU_in1t_load => inst_decoder_fu_LSU_in1t_load_wire,
      fu_LSU_in2_load => inst_decoder_fu_LSU_in2_load_wire,
      fu_LSU_opc => inst_decoder_fu_LSU_opc_wire,
      fu_ALU_in1t_load => inst_decoder_fu_ALU_in1t_load_wire,
      fu_ALU_in2_load => inst_decoder_fu_ALU_in2_load_wire,
      fu_ALU_opc => inst_decoder_fu_ALU_opc_wire,
      fu_LIFTING_x1_load => inst_decoder_fu_LIFTING_x1_load_wire,
      fu_LIFTING_x2_load => inst_decoder_fu_LIFTING_x2_load_wire,
      fu_LIFTING_opc => inst_decoder_fu_LIFTING_opc_wire,
      rf_RF_wr_load => inst_decoder_rf_RF_wr_load_wire,
      rf_RF_wr_opc => inst_decoder_rf_RF_wr_opc_wire,
      rf_RF_rd_load => inst_decoder_rf_RF_rd_load_wire,
      rf_RF_rd_opc => inst_decoder_rf_RF_rd_opc_wire,
      rf_BOOL_wr_load => inst_decoder_rf_BOOL_wr_load_wire,
      rf_BOOL_wr_opc => inst_decoder_rf_BOOL_wr_opc_wire,
      rf_BOOL_rd_load => inst_decoder_rf_BOOL_rd_load_wire,
      rf_BOOL_rd_opc => inst_decoder_rf_BOOL_rd_opc_wire,
      rf_guard_BOOL_0 => inst_decoder_rf_guard_BOOL_0_wire,
      rf_guard_BOOL_1 => inst_decoder_rf_guard_BOOL_1_wire,
      glock => inst_decoder_glock_wire);

  fu_LSU : fu_ldh_ldhu_ldq_ldqu_ldw_sth_stq_stw_always_3
    generic map (
      addrw => fu_LSU_addrw,
      dataw => fu_LSU_dataw)
    port map (
      t1data => fu_LSU_t1data_wire,
      t1load => fu_LSU_t1load_wire,
      o1data => fu_LSU_o1data_wire,
      o1load => fu_LSU_o1load_wire,
      r1data => fu_LSU_r1data_wire,
      t1opcode => fu_LSU_t1opcode_wire,
      data_in => fu_LSU_data_in,
      data_out => fu_LSU_data_out,
      addr => fu_LSU_addr,
      mem_en_x => fu_LSU_mem_en_x,
      wr_en_x => fu_LSU_wr_en_x,
      wr_mask_x => fu_LSU_wr_mask_x,
      clk => clk,
      rstx => rstx,
      glock => fu_LSU_glock_wire);

  fu_ALU : fu_add_and_eq_gt_gtu_ior_shl_shr_shru_sub_sxhw_sxqw_xor_always_1
    generic map (
      dataw => 32,
      shiftw => 5)
    port map (
      t1data => fu_ALU_t1data_wire,
      t1load => fu_ALU_t1load_wire,
      r1data => fu_ALU_r1data_wire,
      o1data => fu_ALU_o1data_wire,
      o1load => fu_ALU_o1load_wire,
      t1opcode => fu_ALU_t1opcode_wire,
      clk => clk,
      rstx => rstx,
      glock => fu_ALU_glock_wire);

  fu_LIFTING : lifting
    generic map (
      busw => 32)
    port map (
      in1 => fu_LIFTING_in1_wire,
      in1_load => fu_LIFTING_in1_load_wire,
      in2 => fu_LIFTING_in2_wire,
      in2_load => fu_LIFTING_in2_load_wire,
      result => fu_LIFTING_result_wire,
      t1opcode => fu_LIFTING_t1opcode_wire,
      clk => clk,
      rst => rstx,
      glock => fu_LIFTING_glock_wire);

  rf_RF : rf_1wr_1rd_always_1_guarded_0
    generic map (
      dataw => 32,
      rf_size => 5)
    port map (
      r1data => rf_RF_r1data_wire,
      r1load => rf_RF_r1load_wire,
      r1opcode => rf_RF_r1opcode_wire,
      t1data => rf_RF_t1data_wire,
      t1load => rf_RF_t1load_wire,
      t1opcode => rf_RF_t1opcode_wire,
      guard => rf_RF_guard_wire,
      clk => clk,
      rstx => rstx,
      glock => rf_RF_glock_wire);

  rf_BOOL : rf_1wr_1rd_always_1_guarded_0
    generic map (
      dataw => 1,
      rf_size => 2)
    port map (
      r1data => rf_BOOL_r1data_wire,
      r1load => rf_BOOL_r1load_wire,
      r1opcode => rf_BOOL_r1opcode_wire,
      t1data => rf_BOOL_t1data_wire,
      t1load => rf_BOOL_t1load_wire,
      t1opcode => rf_BOOL_t1opcode_wire,
      guard => rf_BOOL_guard_wire,
      clk => clk,
      rstx => rstx,
      glock => rf_BOOL_glock_wire);

  ic : interconn
    port map (
      socket_lsu_i1_data => ic_socket_lsu_i1_data_wire,
      socket_lsu_o1_data0 => ic_socket_lsu_o1_data0_wire,
      socket_lsu_o1_bus_cntrl => ic_socket_lsu_o1_bus_cntrl_wire,
      socket_lsu_i2_data => ic_socket_lsu_i2_data_wire,
      socket_RF_i1_data => ic_socket_RF_i1_data_wire,
      socket_RF_o1_data0 => ic_socket_RF_o1_data0_wire,
      socket_RF_o1_bus_cntrl => ic_socket_RF_o1_bus_cntrl_wire,
      socket_bool_i1_data => ic_socket_bool_i1_data_wire,
      socket_bool_o1_data0 => ic_socket_bool_o1_data0_wire,
      socket_bool_o1_bus_cntrl => ic_socket_bool_o1_bus_cntrl_wire,
      socket_gcu_i1_data => ic_socket_gcu_i1_data_wire,
      socket_gcu_i2_data => ic_socket_gcu_i2_data_wire,
      socket_gcu_o1_data0 => ic_socket_gcu_o1_data0_wire,
      socket_gcu_o1_bus_cntrl => ic_socket_gcu_o1_bus_cntrl_wire,
      socket_ALU_i1_data => ic_socket_ALU_i1_data_wire,
      socket_ALU_i2_data => ic_socket_ALU_i2_data_wire,
      socket_ALU_o1_data0 => ic_socket_ALU_o1_data0_wire,
      socket_ALU_o1_bus_cntrl => ic_socket_ALU_o1_bus_cntrl_wire,
      socket_LIFTING_i1_data => ic_socket_LIFTING_i1_data_wire,
      socket_LIFTING_i2_data => ic_socket_LIFTING_i2_data_wire,
      socket_LIFTING_o1_data0 => ic_socket_LIFTING_o1_data0_wire,
      socket_LIFTING_o1_bus_cntrl => ic_socket_LIFTING_o1_bus_cntrl_wire,
      simm_B1 => ic_simm_B1_wire,
      simm_cntrl_B1 => ic_simm_cntrl_B1_wire);

end structural;