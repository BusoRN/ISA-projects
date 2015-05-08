#include<systemc.h>
#ifndef __STARTER_H
#define __STARTER_H

SC_MODULE(starter)
{
  public :
  sc_in<bool> CLK;
  sc_out<bool> RST_n;
  
  private :
  sc_time clk_period;
  sc_time tpd;
  void starter_beh();

  public :
  SC_HAS_PROCESS(starter);
  starter(sc_module_name starter_ctor, 
	  int pclk_period, 
	  int ptpd) :
    sc_module(starter_ctor), 
    clk_period(sc_time(pclk_period, SC_NS)), 
    tpd(sc_time(ptpd, SC_NS))
  {
    SC_THREAD(starter_beh);
    sensitive << CLK.pos();
  }
};

#endif
