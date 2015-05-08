#######################################################
#                                                     #
#  Encounter Command Logging File                     #
#  Created on Fri Dec 13 14:03:40                     #
#                                                     #
#######################################################
loadConfig /home/isa4/Desktop/Lab1/soce/design.conf 0
commitConfig
fit
setDrawMode fplan
floorPlan -r 0.983667180277 0.700677 4.0 4.0 4.0 4.0
fit
fit
addRing -spacing_bottom 0.5 -width_left 0.8 -width_bottom 0.8 -width_top 0.8 -spacing_top 0.5 -layer_bottom M9 -center 1 -stacked_via_top_layer M9 -width_right 0.8 -around core -jog_distance 0.42 -offset_bottom 0.42 -layer_top M9 -threshold 0.42 -offset_left 0.42 -spacing_right 0.5 -spacing_left 0.5 -offset_right 0.42 -offset_top 0.42 -layer_right M1 -nets {VSS VDD } -stacked_via_bottom_layer M1 -layer_left M1
addRing -spacing_bottom 0.5 -width_left 0.8 -width_bottom 0.8 -width_top 0.8 -spacing_top 0.5 -layer_bottom M9 -center 1 -stacked_via_top_layer M9 -width_right 0.8 -around core -jog_distance 0.42 -offset_bottom 0.42 -layer_top M9 -threshold 0.42 -offset_left 0.42 -spacing_right 0.5 -spacing_left 0.5 -offset_right 0.42 -offset_top 0.42 -layer_right M1 -nets {VSS VDD } -stacked_via_bottom_layer M1 -layer_left M1
addStripe -block_ring_top_layer_limit M9 -max_same_layer_jog_length 0.84 -padcore_ring_bottom_layer_limit M9 -set_to_set_distance 40 -stacked_via_top_layer M9 -padcore_ring_top_layer_limit M9 -spacing 0.42 -xleft_offset 40 -merge_stripes_value 0.42 -layer M9 -block_ring_bottom_layer_limit M9 -width 0.42 -nets {VSS VDD } -stacked_via_bottom_layer M1
addStripe -block_ring_top_layer_limit M9 -max_same_layer_jog_length 0.84 -padcore_ring_bottom_layer_limit M9 -set_to_set_distance 40 -stacked_via_top_layer M9 -padcore_ring_top_layer_limit M9 -spacing 0.42 -xleft_offset 40 -merge_stripes_value 0.42 -layer M9 -block_ring_bottom_layer_limit M9 -width 0.42 -nets {VSS VDD } -stacked_via_bottom_layer M1
sroute -jogControl { preferWithChanges differentLayer }
sroute -jogControl { preferWithChanges differentLayer }
setPrerouteAsObs {1 2 3 4 5 6 7 8}
amoebaPlace
checkPlace
savePlace FIR.place
setDrawMode place
specifyClockTree -clkfile clk_conf.cts
specifyClockTree -clkfile clk_conf.cts
createSaveDir FIR_cts
checkUnique
ckSynthesis -rguide FIR_cts/FIR_cts.guide -report FIR_cts/FIR_cts.ctsrpt
saveClockNets -output FIR_cts/FIR_cts.ctsntf
saveNetlist FIR_cts/FIR_cts.v
savePlace FIR_cts/FIR_cts.place
findCoreFillerCells
addFiller -cell FILL1 FILL2 FILL4 FILL8 FILL16 -prefix FILLER
trialRoute -maxRouteLayer 9
setDrawMode place
getNanoRouteMode -quiet
setNanoRouteMode -quiet -drouteFixAntenna true
setNanoRouteMode -quiet -routeInsertAntennaDiode false
setNanoRouteMode -quiet -timingEngine CTE
setNanoRouteMode -quiet -routeWithTimingDriven false
setNanoRouteMode -quiet -routeWithEco false
setNanoRouteMode -quiet -routeWithSiDriven false
setNanoRouteMode -quiet -routeTdrEffort 0
setNanoRouteMode -quiet -routeSiEffort normal
setNanoRouteMode -quiet -siNoiseCTotalThreshold 0.050000
setNanoRouteMode -quiet -siNoiseCouplingCapThreshold 0.005000
setNanoRouteMode -quiet -routeWithSiPostRouteFix false
setNanoRouteMode -quiet -drouteAutoStop true
setNanoRouteMode -quiet -routeSelectedNetOnly false
setNanoRouteMode -quiet -envNumberProcessor 1
deleteSwitchingWindows
cleanupDetailRC
globalDetailRoute
saveDesign /home/isa4/Desktop/Lab1/soce/FIR.enc
setOpCond -maxLibrary fast -max fast -minLibrary fast -min fast/%NOM_PVT
extractRC -outfile FIR.cap
rcOut -setload FIR.setload
rcOut -setres FIR.setres
rcOut -spf FIR.spf
rcOut -spef FIR.spef
delayCal -sdf FIR.sdf
unloadTimingCon
loadTimingCon FIR.sdc
setOpCond {}
setAnalysisMode -setup -async -skew -clockTree
buildTimingGraph
reportSlacks -outfile FIR.slk
reportViolation -outfile FIR.tarpt -num 50
rptSlackClkDomain -infile FIR.slk
rptSlackHistogram -infile FIR.slk
deselectAll
reportMostCritPath -qClk MYCLK -sEvent R -dClk MYCLK -dEvent R -pin PIPE2_2_q_reg_3_/RN -cycle 1 -skew -setup -async -outfile .sb_path.rpt
zoomSelected
deselectAll
selectInst PIPE1_i_0_q_reg_2_
verifyConnectivity -type all -error 1000 -warning 50
verifyGeometry
reportGateCount -level 5 -limit 100 -outfile FIR.gateCount
saveNetlist FIR.v
deselectAll
selectWire 69.5100 87.9900 94.2900 88.1300 3 MULi_0_mult_15_n1
windowSelect 65.516 94.657 98.365 65.891
deselectAll
selectInst MULi_0_mult_15_U5
windowSelect 161.923 3.110 129.076 20.992
deselectAll
selectInst FILLER_266
getLayerPreference hilite -color
setLayerPreference hilite -color {white red green blue yellow magenta cyan orange purple red white white red magenta #d0d0d0 #d8d8d8 #e0e0e0 #e8e8e8 #f0f0f0 #f8f8f8 red green blue yellow magenta cyan purple pink orange brown skyblue white}
getLayerPreference hilite -color
getLayerPreference hilite -color
deselectAll
redraw
deselectNet CLK__L3_N16
zoomOut
zoomOut
selectInst FILLER_1753
zoomIn
fit
zoomSelected
viewLast
fit
deselectAll
deselectAll
reportMostCritPath -qClk MYCLK -sEvent R -dClk MYCLK -dEvent R -pin PIPE2_2_q_reg_3_/RN -cycle 1 -skew -setup -async -outfile .sb_path.rpt
zoomSelected
deselectAll
reportMostCritPath -qClk MYCLK -sEvent R -dClk MYCLK -dEvent R -pin PIPE2_1_q_reg_3_/RN -cycle 1 -skew -setup -async -outfile .sb_path.rpt
zoomSelected
deselectAll
reportMostCritPath -qClk MYCLK -sEvent R -dClk MYCLK -dEvent R -pin PIPE2_2_q_reg_3_/RN -cycle 1 -skew -setup -async -outfile .sb_path.rpt
zoomSelected
deselectAll
selectWire 110.1100 23.0300 110.2500 27.6500 2 n599
deselectAll
reportMostCritPath -qClk MYCLK -sEvent R -dClk MYCLK -dEvent R -pin PIPE2_2_q_reg_3_/RN -cycle 1 -skew -setup -async -outfile .sb_path.rpt
zoomSelected
deselectAll
selectWire 4.2000 46.8300 152.6000 47.2500 1 VSS
deselectAll
selectWire 80.9900 29.1900 81.1300 31.8500 4 n106
deselectAll
reportMostCritPath -qClk MYCLK -sEvent R -dClk MYCLK -dEvent R -pin PIPE2_2_q_reg_3_/RN -cycle 1 -skew -setup -async -outfile .sb_path.rpt
zoomSelected
deselectAll
reportMostCritPath -qClk MYCLK -sEvent R -dClk MYCLK -dEvent R -pin PIPE2_1_q_reg_3_/RN -cycle 1 -skew -setup -async -outfile .sb_path.rpt
zoomSelected
deselectAll
reportMostCritPath -qClk MYCLK -sEvent R -dClk MYCLK -dEvent R -pin PIPE2_2_q_reg_3_/RN -cycle 1 -skew -setup -async -outfile .sb_path.rpt
zoomSelected
deselectAll
selectInst PIPE2_2_q_reg_3_
zoomSelected
selectNet RST_n
zoomOut
zoomOut
deselectAll
selectInst PIPE2_2_q_reg_3_
zoomSelected
selectNet RST_n
zoomOut
zoomOut
deselectAll
selectInst PIPE2_2_q_reg_3_
zoomSelected
selectNet RST_n
zoomOut
zoomOut
deselectAll
selectInst PIPE2_2_q_reg_3_
zoomSelected
selectNet RST_n
zoomOut
zoomOut
deselectAll
selectInst PIPE2_2_q_reg_3_
zoomSelected
selectNet RST_n
zoomOut
zoomOut
deselectAll
selectInst PIPE2_2_q_reg_3_
zoomSelected
selectNet RST_n
zoomOut
zoomOut
deselectAll
selectInst PIPE2_2_q_reg_3_
zoomSelected
selectNet RST_n
zoomOut
zoomOut
deselectAll
selectInst PIPE2_2_q_reg_3_
zoomSelected
selectNet RST_n
zoomOut
zoomOut
selectNet RST_n
deselectAll
reportMostCritPath -qClk MYCLK -sEvent R -dClk MYCLK -dEvent R -pin PIPE2_2_q_reg_3_/RN -cycle 1 -skew -setup -async -outfile .sb_path.rpt
zoomSelected
runCeltIC -auto -cdb {} -echo {} -simPath .sb_path.rpt
deselectAll
selectInst PIPE2_2_q_reg_3_
zoomSelected
selectNet RST_n
zoomOut
zoomOut
zoomOut
windowSelect 72.930 71.199 51.342 27.555
setDrawMode place
setDrawMode fplan
setDrawMode fplan
setDrawMode ameba
setDrawMode place
fit
zoomOut
zoomIn
deselectAll
reportMostCritPath -qClk MYCLK -sEvent R -dClk MYCLK -dEvent R -pin PIPE2_1_q_reg_3_/RN -cycle 1 -skew -setup -async -outfile .sb_path.rpt
zoomSelected
deselectAll
reportMostCritPath -qClk MYCLK -sEvent R -dClk MYCLK -dEvent R -pin PIPE2_2_q_reg_3_/RN -cycle 1 -skew -setup -async -outfile .sb_path.rpt
zoomSelected
fit
selectNet {"set_input_delay"}
deselectAll
selectWire 114.8700 101.9900 115.0100 119.7700 4 n602
selectNet {"set_input_delay"}
windowSelect 114.918 108.566 51.645 81.601
deselectAll
selectInst PIPE2_2_q_reg_3_
zoomSelected
selectNet RST_n
zoomOut
zoomOut
deselectAll
reportMostCritPath -qClk MYCLK -sEvent R -dClk MYCLK -dEvent R -pin PIPE2_2_q_reg_3_/RN -cycle 1 -skew -setup -async -outfile .sb_path.rpt
zoomSelected
deselectAll
selectInst PIPE2_2_q_reg_3_
zoomSelected
selectNet RST_n
zoomOut
zoomOut
fit
deselectAll
selectWire 67.8300 98.0700 68.8100 98.2100 3 n12
deselectAll
reportMostCritPath -qClk MYCLK -sEvent R -dClk MYCLK -dEvent R -pin PIPE2_2_q_reg_3_/RN -cycle 1 -skew -setup -async -outfile .sb_path.rpt
zoomSelected
getLayerPreference hilite -color
getLayerPreference hilite -color
deselectAll
selectInst PIPE2_2_q_reg_3_
zoomSelected
selectNet RST_n
zoomOut
zoomOut
deselectAll
selectInst PIPE2_2_q_reg_3_
zoomSelected
selectNet RST_n
zoomOut
zoomOut
deselectAll
reportMostCritPath -qClk MYCLK -sEvent R -dClk MYCLK -dEvent R -pin PIPE2_2_q_reg_3_/RN -cycle 1 -skew -setup -async -outfile .sb_path.rpt
zoomSelected
deselectAll
reportMostCritPath -qClk MYCLK -sEvent R -dClk MYCLK -dEvent R -pin PIPE2_2_q_reg_3_/RN -cycle 1 -skew -setup -async -outfile .sb_path.rpt
zoomSelected
deselectAll
reportMostCritPath -qClk MYCLK -sEvent R -dClk MYCLK -dEvent R -pin PIPE2_1_q_reg_3_/RN -cycle 1 -skew -setup -async -outfile .sb_path.rpt
zoomSelected
deselectAll
reportMostCritPath -qClk MYCLK -sEvent R -dClk MYCLK -dEvent R -pin PIPE2_1_q_reg_3_/RN -cycle 1 -skew -setup -async -outfile .sb_path.rpt
zoomSelected
deselectAll
reportMostCritPath -qClk MYCLK -sEvent R -dClk MYCLK -dEvent R -pin PIPE2_2_q_reg_3_/RN -cycle 1 -skew -setup -async -outfile .sb_path.rpt
zoomSelected
deselectAll
reportMostCritPath -qClk MYCLK -sEvent R -dClk MYCLK -dEvent R -pin PIPE2_2_q_reg_3_/RN -cycle 1 -skew -setup -async -outfile .sb_path.rpt
zoomSelected
deselectAll
reportMostCritPath -qClk MYCLK -sEvent R -dClk MYCLK -dEvent R -pin PIPE2_2_q_reg_3_/RN -cycle 1 -skew -setup -async -outfile .sb_path.rpt
zoomSelected
deselectAll
reportMostCritPath -qClk MYCLK -sEvent R -dClk MYCLK -dEvent R -pin PIPE2_2_q_reg_3_/RN -cycle 1 -skew -setup -async -outfile .sb_path.rpt
zoomSelected
deselectAll
reportMostCritPath -qClk MYCLK -sEvent R -dClk MYCLK -dEvent R -pin PIPE1_i_1_q_reg_3_/RN -cycle 1 -skew -setup -async -outfile .sb_path.rpt
zoomSelected
deselectAll
reportMostCritPath -qClk MYCLK -sEvent R -dClk MYCLK -dEvent R -pin PIPE1_i_1_q_reg_3_/RN -cycle 1 -skew -setup -async -outfile .sb_path.rpt
zoomSelected
deselectAll
reportMostCritPath -qClk MYCLK -sEvent R -dClk MYCLK -dEvent R -pin PIPE1_i_1_q_reg_3_/RN -cycle 1 -skew -setup -async -outfile .sb_path.rpt
zoomSelected
deselectAll
reportMostCritPath -qClk MYCLK -sEvent R -dClk MYCLK -dEvent R -pin PIPE1_i_1_q_reg_3_/RN -cycle 1 -skew -setup -async -outfile .sb_path.rpt
zoomSelected
deselectAll
reportMostCritPath -qClk MYCLK -sEvent R -dClk MYCLK -dEvent R -pin PIPE2_2_q_reg_3_/RN -cycle 1 -skew -setup -async -outfile .sb_path.rpt
zoomSelected
deselectAll
reportMostCritPath -qClk MYCLK -sEvent R -dClk MYCLK -dEvent R -pin PIPE2_2_q_reg_3_/RN -cycle 1 -skew -setup -async -outfile .sb_path.rpt
zoomSelected
deselectAll
reportMostCritPath -qClk MYCLK -sEvent R -dClk MYCLK -dEvent R -pin PIPE2_2_q_reg_3_/RN -cycle 1 -skew -setup -async -outfile .sb_path.rpt
zoomSelected
deselectAll
reportMostCritPath -qClk MYCLK -sEvent R -dClk MYCLK -dEvent R -pin PIPE2_1_q_reg_3_/RN -cycle 1 -skew -setup -async -outfile .sb_path.rpt
zoomSelected
deselectAll
reportMostCritPath -qClk MYCLK -sEvent R -dClk MYCLK -dEvent R -pin PIPE2_1_q_reg_3_/RN -cycle 1 -skew -setup -async -outfile .sb_path.rpt
zoomSelected
deselectAll
reportMostCritPath -qClk MYCLK -sEvent R -dClk MYCLK -dEvent R -pin PIPE2_1_q_reg_3_/RN -cycle 1 -skew -setup -async -outfile .sb_path.rpt
zoomSelected
deselectAll
reportMostCritPath -qClk MYCLK -sEvent R -dClk MYCLK -dEvent R -pin PIPE2_2_q_reg_2_/RN -cycle 1 -skew -setup -async -outfile .sb_path.rpt
zoomSelected
deselectAll
reportMostCritPath -qClk MYCLK -sEvent R -dClk MYCLK -dEvent R -pin PIPE2_2_q_reg_2_/RN -cycle 1 -skew -setup -async -outfile .sb_path.rpt
zoomSelected
deselectAll
reportMostCritPath -qClk MYCLK -sEvent R -dClk MYCLK -dEvent R -pin PIPE2_2_q_reg_2_/RN -cycle 1 -skew -setup -async -outfile .sb_path.rpt
zoomSelected
deselectAll
reportMostCritPath -qClk MYCLK -sEvent R -dClk MYCLK -dEvent R -pin PIPE1_i_4_q_reg_3_/RN -cycle 1 -skew -setup -async -outfile .sb_path.rpt
zoomSelected
deselectAll
reportMostCritPath -qClk MYCLK -sEvent R -dClk MYCLK -dEvent R -pin PIPE1_i_4_q_reg_3_/RN -cycle 1 -skew -setup -async -outfile .sb_path.rpt
zoomSelected
deselectAll
reportMostCritPath -qClk MYCLK -sEvent R -dClk MYCLK -dEvent R -pin PIPE1_i_4_q_reg_3_/RN -cycle 1 -skew -setup -async -outfile .sb_path.rpt
zoomSelected
deselectAll
reportMostCritPath -qClk MYCLK -sEvent R -dClk MYCLK -dEvent R -pin PIPE2_2_q_reg_3_/RN -cycle 1 -skew -setup -async -outfile .sb_path.rpt
zoomSelected
