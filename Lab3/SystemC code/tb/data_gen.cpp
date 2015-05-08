#include "data_gen.h"

void data_gen::data_gen_beh()
{
  CLEAR.write(0);
  C0.write(0); // vedi tb.vhd 01100
  C1.write(0); // 11100

  
  wait(2*clk_period);
  wait(tpd);

  CLEAR.write(1);

  wait(clk_period);

  CLEAR.write(0); //colpo di clock 3

  unsigned int i;
  for(i = 3; i<Nval; i++){
     C0.write(12+i-3); // vedi tb.vhd 01100
     C1.write(28+i-3); // 11100
     wait(clk_period);
  }

}

