library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.package_vett_reg.all;

entity FIR is
port( DIN : in signed(7 downto 0);
		H0, H1, H2, H3, H4, H5, H6: in signed(7 downto 0); 
		VIN, RST_n, CLK : in std_logic;
		VOUT : out std_logic;
		DOUT : out signed(7 downto 0)
		);
end FIR;
		
architecture A of FIR is

component Shift is
port(	rstn,en,Ck: in std_logic;
		Dato_in_bit: in std_logic; 
		dato_out_bit: out std_logic;
		Dato_in: in signed (7 downto 0); -- dato in (7-0)
		dato_out: out vett_reg_vector(0 to 6));
end component Shift;

component reg_pipe is 
generic (n : integer := 8);
port(	Ck,rstn: in std_logic;
		d : in signed( n-1 downto 0);
		q: out signed(n-1 downto 0));
end component reg_pipe;

component mux is
	port (in1: in std_logic;
		in2: in std_logic;
		sel : in std_logic;
		output: out std_logic);
end component mux;

component mult is
	generic ( n : integer := 8);
	port (data_in_1,data_in_2 : in signed (n-1 downto 0);
		dout : out signed (2*n-1 downto 0));
end component mult;

component adder is
	generic ( n : integer := 8);
	port(in_A, in_B: in signed(n-1 downto 0);
			sum: out signed(n-1 downto 0));
end component adder;

component reg_bit is 
port(	Ck,rstn, EN: in std_logic;
		d : in std_logic;
		q: out std_logic);
end component;

--signal Temp_dato_in : signed (8 downto 0);
signal H : vett_reg_vector(0 to 6);
signal SR_to_MUX, MUX_to_PIPE1, PIPE1_to_PIPE2, PIPE2_to_REGOUT:std_logic;
signal SR_to_MUL, TEMP_H : vett_reg_vector(0 to 6);
signal MUL_to_PIPE1 : vett_reg_vector_16(0 to 6);
signal PIPE1_to_ADD : vett_reg_vector_16(0 to 6);
signal ADD_esteso : vett_reg_vector_19(0 to 14);


begin

H(0) <= H0;
H(1) <= H1;
H(2) <= H2;
H(3) <= H3;
H(4) <= H4;
H(5) <= H5;
H(6) <= H6;

SR: Shift port map (rstn => RST_n ,en => VIN ,Ck => CLK ,Dato_in_bit => VIN ,dato_out_bit => SR_to_MUX ,Dato_in => DIN ,dato_out => SR_to_MUL );
--SR_VIN: ShiftIN_bit port map(rstn => RST_n, en => VIN, Ck => CLK, Dato_in => VIN, dato_out => SR_to_MUX);

MX_VIN: mux port map (in1 => VIN, in2 => SR_to_MUX, sel => VIN, output => MUX_to_PIPE1);

PIPE1_VIN: reg_bit port map (	Ck => CLK, rstn => RST_n, EN => '1', d => MUX_to_PIPE1, q => PIPE1_to_PIPE2);

PIPE2_VIN: reg_bit port map (	Ck => CLK, rstn => RST_n, EN => '1', d => PIPE1_to_PIPE2, q => PIPE2_to_REGOUT);

REG_OUT_VIN: reg_bit port map (	Ck => CLK, rstn => RST_n, EN => '1', d => PIPE2_to_REGOUT, q => VOUT);
--Temp_dato_in <= VIN & DIN;
--SR: ShiftIN port map(rstn => RST_n,en => VIN,Ck => CLK, Dato_in => DIN, dato_out => SR_to_MUL); -- SR dei campioni in ingresso

pippo: for i in 0 to 6 generate
	REG_IN_H_i: reg_pipe generic map (8)
							port map(	Ck => CLK, rstn => RST_n, d => H(i), q => TEMP_H(i));
end generate;



u1: for i in 0 to 6 generate
	MULi: mult 	generic map(8)
					port map (data_in_1 => SR_to_MUL(i) , data_in_2 => TEMP_H(i), dout=> MUL_to_PIPE1(i) );
end generate;

 u2: for i in 0 to 6 generate
	PIPE1_i: reg_pipe 	generic map(16)
							port map(	Ck => CLK, rstn => RST_n, d => MUL_to_PIPE1(i), q => PIPE1_to_ADD(i));
end generate;


ADD_esteso(0) <= PIPE1_to_ADD(0)(15) & PIPE1_to_ADD(0)(15) & PIPE1_to_ADD(0);  --si passa da parallelismo 19 a 18
ADD_esteso(1) <= PIPE1_to_ADD(1)(15) & PIPE1_to_ADD(1)(15) & PIPE1_to_ADD(1);
ADD_esteso(2) <= PIPE1_to_ADD(2)(15) & PIPE1_to_ADD(2)(15) & PIPE1_to_ADD(2);
ADD_esteso(3) <= PIPE1_to_ADD(3)(15) & PIPE1_to_ADD(3)(15) & PIPE1_to_ADD(3);
ADD_esteso(4) <= PIPE1_to_ADD(4)(15) & PIPE1_to_ADD(4)(15) & PIPE1_to_ADD(4);
ADD_esteso(5) <= PIPE1_to_ADD(5)(15) & PIPE1_to_ADD(5)(15) & PIPE1_to_ADD(5);
ADD_esteso(6) <= PIPE1_to_ADD(6)(15) & PIPE1_to_ADD(6)(15) & PIPE1_to_ADD(6);


u3: for i in 0 to 2 generate
	ADD1_i : adder	generic map(18)
						port map(in_A => ADD_esteso(i+i), in_B => ADD_esteso(i+i+1), sum => ADD_esteso(i+7));
end generate;

ADD2_1: adder 	generic map(18)
				   port map(in_A => ADD_esteso(7), in_B => ADD_esteso(8), sum => ADD_esteso(10));
					
ADD2_2: adder	generic map(18)
					port map(in_A => ADD_esteso(9), in_B => ADD_esteso(6), sum => ADD_esteso(11));
					
PIPE2_1: reg_pipe 	generic map(18)
							port map(	Ck => CLK, rstn => RST_n, d => ADD_esteso(10), q => ADD_esteso(12));
							
PIPE2_2: reg_pipe 	generic map(18)
							port map(	Ck => CLK, rstn => RST_n, d => ADD_esteso(11), q => ADD_esteso(13));
					
ADD3_1: adder	generic map(18)
					port map(in_A => ADD_esteso(12), in_B => ADD_esteso(13), sum => ADD_esteso(14));
					
REG_OUT: reg_pipe 	generic map(8)
							port map(	Ck => CLK, rstn => RST_n, d => ADD_esteso(14)(17 downto 10), q => DOUT);			

					



end A;