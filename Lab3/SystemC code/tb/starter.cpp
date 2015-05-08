#include "starter.h"

void starter::starter_beh()
{
  RST_n.write(0);
  wait(clk_period);
  wait(tpd);
  RST_n.write(1);
  wait(clk_period);
}
