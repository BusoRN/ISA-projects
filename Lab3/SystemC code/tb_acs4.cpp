#include<stdio.h>

#include"constants.h"

#include"starter.h"
#include"data_gen.h"
#include"data_writer.h"


#include"acs4.h"



int sc_main (int argc, char **argv)
{
  sc_report_handler::set_actions("/IEEE_Std_1666/deprecated", SC_DO_NOTHING); 
  int NVAL;

  if (argc != 2)
  {
    printf("Use: %s <N>\n", argv[0]);
    return 1;
  }

  NVAL = atoi(argv[1]);


  sc_signal<bool> RST_n_tb; /// asynchronous reset
  sc_signal<bool> CLEAR_tb; /// synchronous clear port
  sc_signal< sc_int<Cbit> > C0_tb; 
  sc_signal< sc_int<Cbit> > C1_tb;
  sc_signal< sc_int<Abit> > A0_tb;
  sc_signal< sc_int<Abit> > A1_tb;
  sc_signal< sc_int<Abit> > A2_tb;
  sc_signal< sc_int<Abit> > A3_tb;


  sc_clock CLK("CLK", TB_CLK_PERIOD);
  starter sta("sta", TB_CLK_PERIOD, TB_TPD);
  data_gen dg("dg", TB_CLK_PERIOD, TB_TPD, NVAL);
  data_writer dw("dw", TB_CLK_PERIOD, NVAL);
  ACS4 uut("uut", TB_TPD, TB_TCO);


  /// starter
  sta.CLK(CLK);
  sta.RST_n(RST_n_tb);

  /// data gen
  dg.CLK(CLK);
  dg.CLEAR(CLEAR_tb);
  dg.C0(C0_tb);
  dg.C1(C1_tb);

  /// uut
  uut.CLK(CLK);
  uut.RST_n(RST_n_tb);
  uut.CLEAR(CLEAR_tb);
  uut.C0(C0_tb);
  uut.C1(C1_tb);
  uut.A0(A0_tb);
  uut.A1(A1_tb);
  uut.A2(A2_tb);
  uut.A3(A3_tb);

	
  /// write results
  dw.CLK(CLK);
  dw.A1(A1_tb);
  dw.A2(A2_tb);
  dw.A3(A3_tb);
  dw.A0(A0_tb);

  sc_trace_file *tf = sc_create_vcd_trace_file("uut");
  ((vcd_trace_file*)tf)->sc_set_vcd_time_unit(-9);

  sc_trace(tf, CLK, "CLK");
  sc_trace(tf, RST_n_tb, "RST_n_tb");
  sc_trace(tf, CLEAR_tb, "CLEAR_tb");
  sc_trace(tf, C0_tb, "C0_tb");
  sc_trace(tf, C1_tb, "C1_tb");
  sc_trace(tf, A0_tb, "A0_tb");
  sc_trace(tf, A1_tb, "A1_tb");
  sc_trace(tf, A2_tb, "A2_tb");
  sc_trace(tf, A3_tb, "A3_tb");

  sc_start((NVAL+SIM_CYCLES_OFFSET)*TB_CLK_PERIOD, SC_NS);

  sc_close_vcd_trace_file(tf);

  return 0;
}

