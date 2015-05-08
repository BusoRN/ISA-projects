#include<systemc.h>
#include"constants.h"

#ifndef __DATA_GEN_H
#define __DATA_GEN_H

SC_MODULE(data_gen)
{
  public :
  sc_in<bool> CLK;
  sc_out<bool> CLEAR;
  sc_out< sc_int<Cbit> > C0;
  sc_out< sc_int<Cbit> > C1;
  
  private :

  sc_time clk_period;
  sc_time tpd;
  unsigned int Nval;
  
  void data_gen_beh();

  public :
  SC_HAS_PROCESS(data_gen);
  data_gen(sc_module_name data_gen_ctor, 
	  int pclk_period, 
	  int ptpd,
      int pN) :
    sc_module(data_gen_ctor), 
    clk_period(sc_time(pclk_period,SC_NS)), 
    tpd(sc_time(ptpd,SC_NS)),
    Nval(pN)
   // C0val(pN),
   //	C1val(pN)
  {
    SC_THREAD(data_gen_beh);
    sensitive << CLK.pos();
  }
};

#endif
