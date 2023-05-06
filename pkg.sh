#!/bin/bash

GERBER_FILES="
SS1_ATX-B_Cu.gbr
SS1_ATX-B_Mask.gbr
SS1_ATX-B_Paste.gbr
SS1_ATX-B_SilkS.gbr
SS1_ATX-Edge_Cuts.gbr
SS1_ATX-F_Cu.gbr
SS1_ATX-F_Mask.gbr
SS1_ATX-F_Paste.gbr
SS1_ATX-F_SilkS.gbr
SS1_ATX-In1_Cu.gbr
SS1_ATX-In2_Cu.gbr"

POS_FILES="SS1_ATX-top.pos"
# SS1_ATX-bottom.pos

DRL_FILES="SS1_ATX-NPTH.drl SS1_ATX-PTH.drl SS1_ATX-PTH-drl_map.ps SS1_ATX-NPTH-drl_map.ps"

FILES="${GERBER_FILES} ${POS_FILES} ${DRL_FILES} top.pdf SS1_ATX.d356 SS1_ATX.csv"
# bottom.pdf

echo $FILES

KICAD_PCB=SS1_ATX.kicad_pcb

ABORT=no
for F in $FILES; do 
    if test \! -f $F || test $KICAD_PCB -nt $F; then
	echo "Regenerate file $F"
	ABORT=yes
    fi
done

if test $ABORT == "yes"; then
    exit -1;
fi

zip SS1_ATX.zip $FILES top.jpg bottom.jpg
