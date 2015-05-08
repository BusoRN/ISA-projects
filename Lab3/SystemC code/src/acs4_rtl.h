#ifndef _SCGENMOD_acs4_
#define _SCGENMOD_acs4_

#include "systemc.h"

class acs4 : public sc_foreign_module
{
public:
    sc_in<bool> CLK;
    sc_in<bool> RST_n;
    sc_in<bool> CLEAR;
    sc_in< sc_int<5> > C0;
    sc_in< sc_int<5> > C1;
    sc_out< sc_int<8> > A0;
    sc_out< sc_int<8> > A1;
    sc_out< sc_int<8> > A2;
    sc_out< sc_int<8> > A3;


    acs4(sc_module_name nm, const char* hdl_name)
     : sc_foreign_module(nm),
       CLK("CLK"),
       RST_n("RST_n"),
       CLEAR("CLEAR"),
       C0("C0"),
       C1("C1"),
       A0("A0"),
       A1("A1"),
       A2("A2"),
       A3("A3")
    {
        elaborate_foreign_module(hdl_name);
    }
    ~acs4()
    {}

};

#endif

