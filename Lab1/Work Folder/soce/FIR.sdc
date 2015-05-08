﻿###################################################################

# Created by write_sdc on Tue Oct 29 09:28:36 2013

###################################################################
set sdc_version 1.7

set_wire_load_model -name tsmc090_wl40 -library fast
set_load -pin_load 0.002124 [get_ports VOUT]
set_load -pin_load 0.002124 [get_ports {DOUT[7]}]
set_load -pin_load 0.002124 [get_ports {DOUT[6]}]
set_load -pin_load 0.002124 [get_ports {DOUT[5]}]
set_load -pin_load 0.002124 [get_ports {DOUT[4]}]
set_load -pin_load 0.002124 [get_ports {DOUT[3]}]
set_load -pin_load 0.002124 [get_ports {DOUT[2]}]
set_load -pin_load 0.002124 [get_ports {DOUT[1]}]
set_load -pin_load 0.002124 [get_ports {DOUT[0]}]
create_clock [get_ports CLK]  -name MYCLK  -period 10  -waveform {0 5}
set_clock_uncertainty 0.07  [get_clocks MYCLK]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {DIN[7]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {DIN[6]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {DIN[5]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {DIN[4]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {DIN[3]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {DIN[2]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {DIN[1]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {DIN[0]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H0[7]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H0[6]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H0[5]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H0[4]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H0[3]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H0[2]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H0[1]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H0[0]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H1[7]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H1[6]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H1[5]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H1[4]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H1[3]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H1[2]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H1[1]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H1[0]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H2[7]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H2[6]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H2[5]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H2[4]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H2[3]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H2[2]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H2[1]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H2[0]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H3[7]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H3[6]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H3[5]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H3[4]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H3[3]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H3[2]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H3[1]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H3[0]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H4[7]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H4[6]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H4[5]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H4[4]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H4[3]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H4[2]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H4[1]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H4[0]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H5[7]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H5[6]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H5[5]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H5[4]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H5[3]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H5[2]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H5[1]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H5[0]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H6[7]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H6[6]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H6[5]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H6[4]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H6[3]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H6[2]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H6[1]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports {H6[0]}]
set_input_delay -clock MYCLK  -max 0.5  [get_ports VIN]
set_input_delay -clock MYCLK  -max 0.5  [get_ports RST_n]
source FIR.setload
source FIR.setres