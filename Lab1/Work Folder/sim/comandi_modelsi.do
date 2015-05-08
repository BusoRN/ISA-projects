vsim -L /home/maurizio.martina/libtsmc/modelsim/lib_work.tb_fir
vsim -L /home/maurizio.martina/libtsmc/modelsim/lib -sdftyp /tb_fir/UUT=../netlist/FIR.sdf work.tb_fir
vsim -L /home/maurizio.martina/libtsmc/modelsim/lib -sdftyp /tb_fir/UUT=../netlist/FIR.sdf -pli /software/synopsys/syn_current/auxx/syn/power/vpower/lib-linux/libvpower.so work.tb_fir

