#include<stdio.h>

#include"constants.h"

#define NVAL 40

#include"starter.h"
#include"data_gen.h"
#include"data_writer.h"


#include"acs4.h"



SC_MODULE(tb_acs4)
{
  sc_signal<bool> RST_n_tb; // asynchronous reset
  sc_signal<bool> CLEAR_tb; // synchronous clear port
  sc_signal< sc_int<Cbit> > C0_tb; // first input 
  sc_signal< sc_int<Cbit> > C1_tb; // second input
  sc_signal< sc_int<Abit> > A0_tb; // first outpu
  sc_signal< sc_int<Abit> > A1_tb; // second output
  sc_signal< sc_int<Abit> > A2_tb; // third output
  sc_signal< sc_int<Abit> > A3_tb; // fourth output


  sc_clock CLK;
  starter sta;
  data_gen dg;
  data_writer dw;
  ACS4 uut;

  SC_CTOR(tb_acs4)
	: CLK("CLK", TB_CLK_PERIOD),
  	  sta("sta", TB_CLK_PERIOD, TB_TPD),
  	  dg("dg", TB_CLK_PERIOD, TB_TPD, NVAL),
	  dw("dw", TB_CLK_PERIOD, NVAL),
	  uut("uut", TB_TPD, TB_TCO)
	{
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
	}
};

#ifdef MTI_SYSTEMC
SC_MODULE_EXPORT(tb_acs4);
#endif

