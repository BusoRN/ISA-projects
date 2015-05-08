################################################
#                                              #
#  FirstEncounter User Preference File         #
#                                              #
################################################
#
# Created by isa4
# Created on Fri Dec 13 14:17:56 CET 2013
# Version 1.1
#

################################################
#  Syntax for Design-related/non-color pref:   #
#  setPreference <preference_name> <value>     #
################################################
setPreference DesignHierChar {/}
setPreference DEFHierChar {/}
setPreference PDEFBusDelim {[]}
setPreference CmdLogMode 1
setPreference BlockSnapRule 0
setPreference ConstraintSnapRule 1
setPreference ConstraintUserXGrid 0.0
setPreference ConstraintUserYGrid 0.0
setPreference ConstraintUserXOffset 0.0
setPreference ConstraintUserYOffset 0.0
setPreference SnapAllCorners 0
setPreference UserGridUnit 0

################################################
#  Syntax for Display-related/non-color pref:  #
#  setPreference <preference_name> <value>     #
################################################
setPreference InstDisplayThreshold 0.0
setPreference WireDisplayCheck2D 1
setPreference WireDisplayThreshold 0
setPreference VertViolation 0.0
setPreference HorzViolation 0.0
setPreference MinFPModuleSize 100
setPreference MinFlightLineWidth 1
setPreference MaxFlightLineNetTerms 500
setPreference HiliteNetWhenQueryObj 1
setPreference SelectNetWhenSelectPin 0
setPreference QueryWireNet 0
setPreference SelectByArea 0
setPreference WinSelectMargin 8
setPreference ShowNumberBlockConnection 0
setPreference StrecthRestriction 0
setPreference MoveRestriction 0
setPreference DisplayFPlanFlightLine 1
setPreference DisplayPinName 0
setPreference InstanceText Instance
setPreference ExclusiveFlight 0
setPreference FlightLineInMove 1
setPreference AutoRedraw 0

################################################
#  Syntax for Floorplan-related/non-color pref:#
#  setPreference <preference_name> <value>     #
################################################
setPreference MoveMacrosWithGuide 0
setPreference MoveMacrosWithRegion 0
setPreference MoveMacrosWithFence 1
setPreference MoveStdCellWithGuide 0
setPreference MoveStdCellWithRegion 0
setPreference MoveStdCellWithFence 0
setPreference MovePreplacedStdCellOnly 0

################################################
#  Command to define layer preference          #
#  - setLayerPreference                        #
#  Use help to display command syntax          #
################################################
#
################################################
#  Below are the objects colors                #
################################################
setLayerPreference screen -isVisible 1 -color #ffcbcf -isSelectable 1
setLayerPreference blackBox -isVisible 1 -color #00362a -isSelectable 1
setLayerPreference block -isVisible 1 -color #58d0ca -isSelectable 1
setLayerPreference bump0 -isVisible 1 -color DodgerBlue3 \
             -stipple solid -isSelectable 1
setLayerPreference bump1 -isVisible 1 -color red \
             -stipple solid -isSelectable 1
setLayerPreference bump2 -isVisible 1 -color orange \
             -stipple solid -isSelectable 1
setLayerPreference bump3 -isVisible 1 -color #c88686 -isSelectable 1
setLayerPreference cellBlkgObj -isVisible 0 -color blue -isSelectable 0
setLayerPreference datapath -isVisible 1 -color LightBlue -isSelectable 1
setLayerPreference fence -isVisible 1 -color #ff9966 -isSelectable 1
setLayerPreference guide -isVisible 1 -color #f3b2e3 -isSelectable 1
setLayerPreference ioSlot -isVisible 1 -color #009900 -isSelectable 1
setLayerPreference ioRow -isVisible 1 -color #666666 -isSelectable 1
setLayerPreference inst -isVisible 1 -color #00d0d0 \
             -stipple dot4 -isSelectable 1
setLayerPreference macroSitePattern -isVisible 0 -color #58d0ca -isSelectable 0
setLayerPreference metalFill -isVisible 1 -color brown -isSelectable 1
setLayerPreference hinst -isVisible 1 -color #f3b2e3 -isSelectable 1
setLayerPreference net -isVisible 1 -color blue -isSelectable 0
setLayerPreference obstruct -isVisible 1 -color brown -isSelectable 1
setLayerPreference ptnFeed -isVisible 1 -color white -isSelectable 1
setLayerPreference ptnPinBlk -isVisible 1 -color red -isSelectable 1
setLayerPreference routeGuide -isVisible 1 -color white -isSelectable 1
setLayerPreference pwrdm0 -isVisible 1 -color #de0000 -isSelectable 1
setLayerPreference pwrdm1 -isVisible 1 -color gold -isSelectable 1
setLayerPreference pwrdm2 -isVisible 1 -color #9F8050 -isSelectable 1
setLayerPreference pwrdm3 -isVisible 1 -color cyan -isSelectable 1
setLayerPreference netRect -isVisible 0 -color #004ed2 -isSelectable 0
setLayerPreference region -isVisible 1 -color #f3b283 -isSelectable 1
setLayerPreference layerBlk -isVisible 1 -color yellow -isSelectable 1
setLayerPreference sitePattern -isVisible 0 -color #666666 -isSelectable 0
setLayerPreference power -isVisible 1 -color white -isSelectable 1
setLayerPreference stdRow -isVisible 1 -color #666666 -isSelectable 0
setLayerPreference term -isVisible 1 -color #f0d218 -isSelectable 1
setLayerPreference violation -isVisible 1 -color white -isSelectable 1
setLayerPreference gcellOvflow -isVisible 0 -color white -isSelectable 0
setLayerPreference congest -isVisible 1 -color red -isSelectable 1
setLayerPreference text -isVisible 1 -color white -isSelectable 1
setLayerPreference ruler -isVisible 1 -color yellow -isSelectable 1
setLayerPreference userGrid -isVisible 0 -color gray -isSelectable 0
setLayerPreference blockHalo -isVisible 1 -color #d26c6c -isSelectable 1
setLayerPreference channel -isVisible 1 -color red -isSelectable 1
setLayerPreference mGrid -isVisible 0 -color white -isSelectable 1
setLayerPreference select -isVisible 1 -color white -isSelectable 1
setLayerPreference pinText -isVisible 1 -color white -isSelectable 1
setLayerPreference congestH -isVisible 0 \
             -color {navy blue green yellow red magenta #d4d4d4 #d8d8d8 #dcdcdc #dddddd #e0e0e0 #e4e4e4 #e8e8e8 #ececec #eeeeee #f0f0f0 #f4f4f4 #f8f8f8 #fcfcfc #ffffff}
setLayerPreference congestV -isVisible 0 \
             -color {navy blue green yellow red magenta #d4d4d4 #d8d8d8 #dcdcdc #dddddd #e0e0e0 #e4e4e4 #e8e8e8 #ececec #eeeeee #f0f0f0 #f4f4f4 #f8f8f8 #fcfcfc #ffffff}
setLayerPreference clkTree -isVisible 1 \
             -color {#004e72 #004ea8 #004ed2 #004ef2 #00acf2 #00caf2 #00f2f2 #00f2d2 #00f2aa green #8cf600 #aef600 #d2f600 yellow #fed600 #feb800 #fe9800 red #f2f2f6f6f8f8 white}
setLayerPreference powerNet -isVisible 1 \
             -color {#004e72 #a2cd5a #caff70 #eedd82 #ffff00 #ffd700 #ffa500 #ff7f50 #ff0000}
################################################
#  Below are the metal layers colors           #
################################################
setLayerPreference M0 -isVisible 1 -color sandybrown -isSelectable 1
setLayerPreference M0Cont -isVisible 1 -color plum2 -isSelectable 1
setLayerPreference M0Pin -isVisible 1 -color sandybrown -isSelectable 0
setLayerPreference M0ContPin -isVisible 1 -color sandybrown -isSelectable 0
setLayerPreference M0RB -isVisible 1 -color sandybrown -isSelectable 0
setLayerPreference M0ContRB -isVisible 1 -color plum2 -isSelectable 0
setLayerPreference M0RTrk -isVisible 0 -color yellow -isSelectable 0
setLayerPreference M0Vio -isVisible 1 -color white -isSelectable 1
setLayerPreference M0AVio -isVisible 0 -color white -isSelectable 0
setLayerPreference M1 -isVisible 1 -color blue \
             -stipple backslash2 -isSelectable 1
setLayerPreference M1Cont -isVisible 1 -color blue \
             -stipple dot4 -isSelectable 1
setLayerPreference M1Pin -isVisible 1 -color blue \
             -stipple cross -isSelectable 0
setLayerPreference M1ContPin -isVisible 1 -color blue \
             -stipple dot4 -isSelectable 0
setLayerPreference M1RB -isVisible 1 -color blue \
             -stipple brick -isSelectable 0
setLayerPreference M1ContRB -isVisible 1 -color blue \
             -stipple dot8_1 -isSelectable 0
setLayerPreference M1RTrk -isVisible 0 -color blue -isSelectable 0
setLayerPreference M1Vio -isVisible 1 -color white -isSelectable 1
setLayerPreference M1AVio -isVisible 0 -color white -isSelectable 0
setLayerPreference M2 -isVisible 1 -color red \
             -stipple slash2 -isSelectable 1
setLayerPreference M2Cont -isVisible 1 -color red \
             -stipple dot4 -isSelectable 1
setLayerPreference M2Pin -isVisible 1 -color red \
             -stipple cross -isSelectable 0
setLayerPreference M2ContPin -isVisible 1 -color red \
             -stipple dot4 -isSelectable 0
setLayerPreference M2RB -isVisible 1 -color red \
             -stipple brick -isSelectable 0
setLayerPreference M2ContRB -isVisible 1 -color red \
             -stipple dot8_2 -isSelectable 0
setLayerPreference M2RTrk -isVisible 0 -color red -isSelectable 0
setLayerPreference M2Vio -isVisible 1 -color white -isSelectable 1
setLayerPreference M2AVio -isVisible 0 -color white -isSelectable 0
setLayerPreference M3 -isVisible 1 -color #00d000 \
             -stipple backslash -isSelectable 1
setLayerPreference M3Cont -isVisible 1 -color #00d000 \
             -stipple dot4 -isSelectable 1
setLayerPreference M3Pin -isVisible 1 -color #00d000 \
             -stipple cross -isSelectable 0
setLayerPreference M3ContPin -isVisible 1 -color #00d000 \
             -stipple dot4 -isSelectable 0
setLayerPreference M3RB -isVisible 1 -color #00d000 \
             -stipple brick -isSelectable 0
setLayerPreference M3ContRB -isVisible 1 -color green \
             -stipple dot8_1 -isSelectable 0
setLayerPreference M3RTrk -isVisible 0 -color #00d000 -isSelectable 0
setLayerPreference M3Vio -isVisible 1 -color white -isSelectable 1
setLayerPreference M3AVio -isVisible 0 -color white -isSelectable 0
setLayerPreference M4 -isVisible 1 -color #d0d000 \
             -stipple slash -isSelectable 1
setLayerPreference M4Cont -isVisible 1 -color #d0d000 \
             -stipple dot4 -isSelectable 1
setLayerPreference M4Pin -isVisible 1 -color #d0d000 \
             -stipple cross -isSelectable 0
setLayerPreference M4ContPin -isVisible 1 -color #d0d000 \
             -stipple dot4 -isSelectable 0
setLayerPreference M4RB -isVisible 1 -color #d0d000 \
             -stipple brick -isSelectable 0
setLayerPreference M4ContRB -isVisible 1 -color brown \
             -stipple dot8_2 -isSelectable 0
setLayerPreference M4RTrk -isVisible 0 -color #d0d000 -isSelectable 0
setLayerPreference M4Vio -isVisible 1 -color white -isSelectable 1
setLayerPreference M4AVio -isVisible 0 -color white -isSelectable 0
setLayerPreference M5 -isVisible 1 -color brown \
             -stipple backslash -isSelectable 1
setLayerPreference M5Cont -isVisible 1 -color brown \
             -stipple dot4 -isSelectable 1
setLayerPreference M5Pin -isVisible 1 -color brown \
             -stipple cross -isSelectable 0
setLayerPreference M5ContPin -isVisible 1 -color brown \
             -stipple dot4 -isSelectable 0
setLayerPreference M5RB -isVisible 1 -color brown \
             -stipple brick -isSelectable 0
setLayerPreference M5ContRB -isVisible 1 -color magenta \
             -stipple dot8_1 -isSelectable 0
setLayerPreference M5RTrk -isVisible 0 -color brown -isSelectable 0
setLayerPreference M5Vio -isVisible 1 -color white -isSelectable 1
setLayerPreference M5AVio -isVisible 0 -color white -isSelectable 0
setLayerPreference M6 -isVisible 1 -color orange \
             -stipple slash -isSelectable 1
setLayerPreference M6Cont -isVisible 1 -color orange \
             -stipple dot4 -isSelectable 1
setLayerPreference M6Pin -isVisible 1 -color orange \
             -stipple cross -isSelectable 0
setLayerPreference M6ContPin -isVisible 1 -color orange \
             -stipple dot4 -isSelectable 0
setLayerPreference M6RB -isVisible 1 -color orange \
             -stipple brick -isSelectable 0
setLayerPreference M6ContRB -isVisible 1 -color blue \
             -stipple dot8_2 -isSelectable 0
setLayerPreference M6RTrk -isVisible 0 -color orange -isSelectable 0
setLayerPreference M6Vio -isVisible 1 -color white -isSelectable 1
setLayerPreference M6AVio -isVisible 0 -color white -isSelectable 0
setLayerPreference M7 -isVisible 1 -color #d000d0 \
             -stipple backslash -isSelectable 1
setLayerPreference M7Cont -isVisible 1 -color #d000d0 \
             -stipple dot4 -isSelectable 1
setLayerPreference M7Pin -isVisible 1 -color #d000d0 \
             -stipple cross -isSelectable 0
setLayerPreference M7ContPin -isVisible 1 -color #d000d0 \
             -stipple dot4 -isSelectable 0
setLayerPreference M7RB -isVisible 1 -color #d000d0 \
             -stipple brick -isSelectable 0
setLayerPreference M7ContRB -isVisible 1 -color red \
             -stipple dot8_1 -isSelectable 0
setLayerPreference M7RTrk -isVisible 0 -color #d000d0 -isSelectable 0
setLayerPreference M7Vio -isVisible 1 -color white -isSelectable 1
setLayerPreference M7AVio -isVisible 0 -color white -isSelectable 0
setLayerPreference M8 -isVisible 1 -color #00d0d0 \
             -stipple slash -isSelectable 1
setLayerPreference M8Cont -isVisible 1 -color #00d0d0 \
             -stipple dot4 -isSelectable 1
setLayerPreference M8Pin -isVisible 1 -color #00d0d0 \
             -stipple cross -isSelectable 0
setLayerPreference M8ContPin -isVisible 1 -color #00d0d0 \
             -stipple dot4 -isSelectable 0
setLayerPreference M8RB -isVisible 1 -color #00d0d0 \
             -stipple brick -isSelectable 0
setLayerPreference M8ContRB -isVisible 1 -color green \
             -stipple dot8_2 -isSelectable 0
setLayerPreference M8RTrk -isVisible 0 -color #00d0d0 -isSelectable 0
setLayerPreference M8Vio -isVisible 1 -color white -isSelectable 1
setLayerPreference M8AVio -isVisible 0 -color white -isSelectable 0
setLayerPreference M9 -isVisible 1 -color brown \
             -stipple backslash -isSelectable 1
setLayerPreference M9Cont -isVisible 1 -color brown \
             -stipple dot4 -isSelectable 1
setLayerPreference M9Pin -isVisible 1 -color brown \
             -stipple cross -isSelectable 0
setLayerPreference M9ContPin -isVisible 1 -color brown \
             -stipple dot4 -isSelectable 0
setLayerPreference M9RB -isVisible 1 -color brown \
             -stipple brick -isSelectable 0
setLayerPreference M9ContRB -isVisible 1 -color brown \
             -stipple dot8_1 -isSelectable 0
setLayerPreference M9RTrk -isVisible 0 -color brown -isSelectable 0
setLayerPreference M9Vio -isVisible 1 -color white -isSelectable 1
setLayerPreference M9AVio -isVisible 0 -color white -isSelectable 0
setLayerPreference M10 -isVisible 1 -color yellow \
             -stipple slash -isSelectable 1
setLayerPreference M10Cont -isVisible 1 -color yellow \
             -stipple dot4 -isSelectable 1
setLayerPreference M10Pin -isVisible 1 -color yellow \
             -stipple cross -isSelectable 0
setLayerPreference M10ContPin -isVisible 1 -color yellow \
             -stipple dot4 -isSelectable 0
setLayerPreference M10RB -isVisible 1 -color yellow \
             -stipple brick -isSelectable 0
setLayerPreference M10ContRB -isVisible 1 -color yellow \
             -stipple dot8_2 -isSelectable 0
setLayerPreference M10RTrk -isVisible 0 -color yellow -isSelectable 0
setLayerPreference M10Vio -isVisible 1 -color white -isSelectable 1
setLayerPreference M10AVio -isVisible 0 -color white -isSelectable 0
setLayerPreference M11 -isVisible 1 -color green \
             -stipple backslash -isSelectable 1
setLayerPreference M11Cont -isVisible 1 -color green \
             -stipple dot4 -isSelectable 1
setLayerPreference M11Pin -isVisible 1 -color green \
             -stipple cross -isSelectable 0
setLayerPreference M11ContPin -isVisible 1 -color green \
             -stipple dot4 -isSelectable 0
setLayerPreference M11RB -isVisible 1 -color green \
             -stipple brick -isSelectable 0
setLayerPreference M11ContRB -isVisible 1 -color yellow \
             -stipple dot8_2 -isSelectable 0
setLayerPreference M11RTrk -isVisible 0 -color green -isSelectable 0
setLayerPreference M11Vio -isVisible 1 -color white -isSelectable 1
setLayerPreference M11AVio -isVisible 0 -color white -isSelectable 0
setLayerPreference M12 -isVisible 1 -color magenta \
             -stipple slash -isSelectable 1
setLayerPreference M12Cont -isVisible 1 -color magenta \
             -stipple dot4 -isSelectable 1
setLayerPreference M12Pin -isVisible 1 -color magenta \
             -stipple cross -isSelectable 0
setLayerPreference M12ContPin -isVisible 1 -color magenta \
             -stipple dot4 -isSelectable 0
setLayerPreference M12RB -isVisible 1 -color magenta \
             -stipple brick -isSelectable 0
setLayerPreference M12ContRB -isVisible 1 -color yellow \
             -stipple dot8_2 -isSelectable 0
setLayerPreference M12RTrk -isVisible 0 -color magenta -isSelectable 0
setLayerPreference M12Vio -isVisible 1 -color white -isSelectable 1
setLayerPreference M12AVio -isVisible 0 -color white -isSelectable 0
setLayerPreference pinObj -isVisible 0
setLayerPreference trackObj -isVisible 0
setLayerPreference nonPrefTrackObj -isVisible 0
setLayerPreference congestObj -isVisible 0

