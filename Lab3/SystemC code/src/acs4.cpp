#include "acs4.h"

#ifndef __CTOS__
/*****************************************************************/
/*                     TDP and TCO Version                       */
/*****************************************************************/

	void ACS4::ACS4_tpd1()
	{
		sc_int<Gbit> Temp =g1_i.read();
		g1.write(Temp);
		Temp =g2_i.read();
		g2.write(Temp);
		Temp =g3_i.read();
		g3.write(Temp);
	
		ev_tpd1.cancel();
	}

	void ACS4::ACS4_tpd2()
	{
		sc_int<Abit> Temp =a3_a3_g1_i.read();
		a3_a3_g1.write(Temp);

		ev_tpd2.cancel();
	}
	
	void ACS4::ACS4_tpd3()
	{
		sc_int<Abit> Temp =a3_a1_g2_i.read();
		a3_a1_g2.write(Temp);
	
		ev_tpd3.cancel();
	}

	void ACS4::ACS4_tpd4()
	{
		sc_int<Abit> Temp =a2_a1_g1_i.read();
		a2_a1_g1.write(Temp);
	
		ev_tpd4.cancel();
	}
		
	void ACS4::ACS4_tpd5()
	{
		sc_int<Abit> Temp =a2_a3_g2_i.read();
		a2_a3_g2.write(Temp);

		ev_tpd5.cancel();
	}

	void ACS4::ACS4_tpd6()
	{
		sc_int<Abit> Temp =a1_a0_g3_i.read();
		a1_a0_g3.write(Temp);

		ev_tpd6.cancel();
	}
		
	void ACS4::ACS4_tpd7()
	{
		sc_int<Abit> Temp =a0_a2_g3_i.read();
		a0_a2_g3.write(Temp);
	
		ev_tpd7.cancel();
	}
		
	void ACS4::ACS4_tpd8()
	{
		sc_int<Abit> Temp =A0_i.read();
		A0.write(Temp);
	
		ev_tpd8.cancel();
	}
		
	void ACS4::ACS4_tpd9()
	{
		sc_int<Abit> Temp =A1_i.read();
		A1.write(Temp);
	
		ev_tpd9.cancel();
	}
			
	void ACS4::ACS4_tpd10()
	{
		sc_int<Abit> Temp =A2_i.read();
		A2.write(Temp);
		
		ev_tpd10.cancel();
	}
	
	void ACS4::ACS4_tpd11()
	{
		sc_int<Abit> Temp =A3_i.read();
		A3.write(Temp);
		
		ev_tpd11.cancel();
	}

	void ACS4::ACS4_tpd12()
	{
		sc_int<Abit> Temp =a0_a0_g0_i.read();
		a0_a0_g0.write(Temp);
	
		ev_tpd12.cancel();
	}

	void ACS4::ACS4_tpd13()
	{
		sc_int<Abit> Temp =a1_a2_g0_i.read();
		a1_a2_g0.write(Temp);
	
		ev_tpd13.cancel();
	}
		
	void ACS4::ACS4_tco()
	{
		sc_int<Abit> Temp =a0_reg_i.read();
		a0_reg.write(Temp);
		Temp = a1_reg_i.read();
		a1_reg.write(Temp);
		Temp = a2_reg_i.read();
		a2_reg.write(Temp);
		Temp = a3_reg_i.read();
		a3_reg.write(Temp);
	
		ev_tco.cancel();
	}



	void ACS4::as_beh_main_tpd( void )
	{
		sc_int<Cbit> TempC0 = C0.read();
		sc_int<Cbit> TempC1 = C1.read();
		g3_i.write( TempC0 + TempC1);
		g1_i.write(TempC0);
		g2_i.write(TempC1);

		ev_tpd1.notify(tpd);
	}

	void ACS4::as_beh_a0_tpd( void )
	{
		sc_int<Gbit> TempG1 = g1.read();
		sc_int<Abit> Temp =TempG1 + a3_reg.read();
		a3_a3_g1_i.write(Temp);

		ev_tpd2.notify(tpd);
	}

	void ACS4::as_beh_a1_tpd ( void )
	{
		sc_int<Gbit> TempG2 = g2.read();
		sc_int<Abit> Temp = TempG2 + a1_reg.read();
		a3_a1_g2_i.write(Temp);

		ev_tpd3.notify(tpd);
	}

	void ACS4::as_beh_a2_tpd ( void )
	{

		sc_int<Gbit> TempG1 = g1.read();
		sc_int<Abit> Temp = TempG1 + a1_reg.read();
		a2_a1_g1_i.write(Temp);

		ev_tpd4.notify(tpd);
	}

	void ACS4::as_beh_a3_tpd ( void )
	{
		sc_int<Gbit> TempG2 = g2.read();
		sc_int<Abit> Temp = TempG2 + a3_reg.read();
		a2_a3_g2_i.write(Temp);

		ev_tpd5.notify(tpd);
	}

	void ACS4::as_beh_a4_tpd ( void )
	{
		sc_int<Gbit> TempG3 = g3.read();
		sc_int<Abit> Temp = TempG3 + a0_reg.read();
		a1_a0_g3_i.write(Temp);

		ev_tpd6.notify(tpd);
	}

	void ACS4::as_beh_a5_tpd ( void )
	{
		sc_int<Gbit> TempG3 = g3.read();
		sc_int<Abit> Temp = TempG3 + a2_reg.read();
		a0_a2_g3_i.write(Temp);


		ev_tpd7.notify(tpd);
	}

	void ACS4::as_beh_a0_a0_g0_tpd (void)
	{
		sc_int<Abit> Temp = a0_reg.read();
		a0_a0_g0_i.write(Temp);

		ev_tpd12.notify(tpd);
	}

	void ACS4::ACS1_tpd (void)
	{
		
		sc_int<Abit> Temp =0;
		Temp = a0_a0_g0.read() - a0_a2_g3.read();
		if(Temp[Abit-1])
		{
			Temp = a0_a2_g3.read();
			A0_i.write(Temp);
		}
		else
		{
			Temp = a0_a0_g0.read();
			A0_i.write(Temp);
		}

		ev_tpd8.notify(tpd);
	}

	void ACS4::as_beh_a1_a2_g0_tpd (void)
	{
		sc_int<Abit> Temp = a2_reg.read();
		a1_a2_g0_i.write(Temp);

		ev_tpd13.notify(tpd);
	}

	void ACS4::ACS2_tpd (void)
	{

		sc_int<Abit> Temp =0;
		Temp = a1_a2_g0.read() - a1_a0_g3.read();
		if(Temp[Abit-1])
		{
			Temp = a1_a0_g3.read();
			A1_i.write(a1_a0_g3.read());
		}
		else
		{
			Temp = a1_a2_g0.read();
			A1_i.write(a1_a2_g0.read());
		}

		ev_tpd9.notify(tpd);
	}

	void ACS4::ACS3_tpd (void)
	{
		sc_int<Abit> Temp =0;
		Temp = a2_a3_g2.read() - a2_a1_g1.read();
		if(Temp[Abit-1])
		{
			Temp = a2_a1_g1.read();
			A2_i.write(a2_a1_g1.read());
		}
		else
		{
			Temp = a2_a3_g2.read();
			A2_i.write(a2_a3_g2.read());
		}

		ev_tpd10.notify(tpd);
	}

	void ACS4::ACS4_tpd (void)
	{
		sc_int<Abit> Temp =0;
		Temp = a3_a1_g2.read() - a3_a3_g1.read();
		if(Temp[Abit-1])
		{
			Temp = a3_a3_g1.read();
			A3_i.write(a3_a3_g1.read());
		}
		else
		{
			Temp = a3_a1_g2.read();
			A3_i.write(a3_a1_g2.read());
		}

		ev_tpd11.notify(tpd);
	}

	void ACS4::sin_beh_main_tco(void)
	{	
		sc_int<Abit> Temp_A0 = 0;
		sc_int<Abit> Temp_A1 = 0;
		sc_int<Abit> Temp_A2 = 0;
		sc_int<Abit> Temp_A3 = 0;
		//asynchronous reset
		if (RST_n.read() == 1)
		{
			if(CLEAR.read() == 0)
			{
				Temp_A0 = A0.read();
				Temp_A1 = A1.read();
				Temp_A2 = A2.read();
				Temp_A3 = A3.read();
			}
		}
		a0_reg_i.write(Temp_A0);
		a1_reg_i.write(Temp_A1);
		a2_reg_i.write(Temp_A2);
		a3_reg_i.write(Temp_A3);

		ev_tco.notify(tco);
	}

#else
/*****************************************************************/
/*                     Clear Version                             */
/*****************************************************************/
	void ACS4::as_beh_main( void )
	{
		sc_int<Cbit> TempC0 = C0.read();
		sc_int<Cbit> TempC1 =  C1.read();
		g3.write( TempC0 + TempC1);
		g1.write(TempC0);
		g2.write(TempC1);
	}

	void ACS4::as_beh_a0( void )
	{
		sc_int<Gbit> TempG1 = g1.read();
		sc_int<Abit> Temp =TempG1 + a3_reg.read();
		a3_a3_g1.write(Temp);
	}

	void ACS4::as_beh_a1( void )
	{
		sc_int<Gbit> TempG2 = g2.read();
		sc_int<Abit> Temp = TempG2 + a1_reg.read();
		a3_a1_g2.write(Temp);
	}

	void ACS4::as_beh_a2( void )
	{

		sc_int<Gbit> TempG1 = g1.read();
		sc_int<Abit> Temp = TempG1 + a1_reg.read();
		a2_a1_g1.write(Temp);
	}

	void ACS4::as_beh_a3( void )
	{
		sc_int<Gbit> TempG2 = g2.read();
		sc_int<Abit> Temp = TempG2 + a3_reg.read();
		a2_a3_g2.write(Temp);
	}

	void ACS4::as_beh_a4( void )
	{
		sc_int<Gbit> TempG3 = g3.read();
		sc_int<Abit> Temp = TempG3 + a0_reg.read();
		a1_a0_g3.write(Temp);
	}

	void ACS4::as_beh_a5( void )
	{
		sc_int<Gbit> TempG3 = g3.read();
		sc_int<Abit> Temp = TempG3 + a2_reg.read();
		a0_a2_g3.write(Temp);
	}

	void ACS4::as_beh_a0_a0_g0(void)
	{
		sc_int<Abit> Temp = a0_reg.read();
		a0_a0_g0.write(Temp);
	}

	void ACS4::ACS1(void)
	{
		
		sc_int<Abit> Temp =0;
		Temp = a0_a0_g0.read() - a0_a2_g3.read();
		if(Temp[Abit-1])
		{
			Temp = a0_a2_g3.read();
			A0.write(Temp);
		}
		else
		{
			Temp = a0_a0_g0.read();
			A0.write(Temp);
		}
	}

	void ACS4::as_beh_a1_a2_g0(void)
	{
		sc_int<Abit> Temp = a2_reg.read();
		a1_a2_g0.write(Temp);
	}

	void ACS4::ACS2(void)
	{

		sc_int<Abit> Temp =0;
		Temp = a1_a2_g0.read() - a1_a0_g3.read();
		if(Temp[Abit-1])
		{
			Temp = a1_a0_g3.read();
			A1.write(a1_a0_g3.read());
		}
		else
		{
			Temp = a1_a2_g0.read();
			A1.write(a1_a2_g0.read());
		}
	}

	void ACS4::ACS3(void)
	{
		sc_int<Abit> Temp =0;
		Temp = a2_a3_g2.read() - a2_a1_g1.read();
		if(Temp[Abit-1])
		{
			Temp = a2_a1_g1.read();
			A2.write(a2_a1_g1.read());
		}
		else
		{
			Temp = a2_a3_g2.read();
			A2.write(a2_a3_g2.read());
		}
	}

	void ACS4::ACS4(void)
	{
		sc_int<Abit> Temp =0;
		Temp = a3_a1_g2.read() - a3_a3_g1.read();
		if(Temp[Abit-1])
		{
			Temp = a3_a3_g1.read();
			A3.write(a3_a3_g1.read());
		}
		else
		{
			Temp = a3_a1_g2.read();
			A3.write(a3_a1_g2.read());
		}
	}

	void ACS4::sin_beh_main(void)
	{	
		sc_int<Abit> Temp_A0 = 0;
		sc_int<Abit> Temp_A1 = 0;
		sc_int<Abit> Temp_A2 = 0;
		sc_int<Abit> Temp_A3 = 0;
		//asynchronous reset
		if (RST_n.read() == 1)
		{
			if(CLEAR.read() == 0)
			{
				Temp_A0 = A0.read();
				Temp_A1 = A1.read();
				Temp_A2 = A2.read();
				Temp_A3 = A3.read();
			}
		}
		a0_reg.write(Temp_A0);
		a1_reg.write(Temp_A1);
		a2_reg.write(Temp_A2);
		a3_reg.write(Temp_A3);
	}

#endif


#ifdef __CTOS__
	SC_MODULE_EXPORT(ACS4);
#endif
