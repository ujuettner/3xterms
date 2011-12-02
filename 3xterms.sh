#!/bin/bash
#

BG="rgb:2D/09/22"
FG="white"

FNX=7
FNY=14
XBORDER=3
YBORDER=4
YOFF=24
TITLEHEIGHT=28

DIM=`xdpyinfo | grep dimensions: | awk '{print $2}'`
X=`echo ${DIM} | awk -Fx '{print $1}'`
Y=`echo ${DIM} | awk -Fx '{print $2}'`

(( X1=((X-(XBORDER*4)-1)*2/3)/FNX ))
(( X2=X1 ))
(( X3=((X-(XBORDER*4)-1)/3)/FNX ))
(( Y1=((Y-YOFF-(TITLEHEIGHT*2)-(YBORDER*4))/2)/FNY ))
(( Y2=Y1 ))
(( Y3=(Y-YOFF-TITLEHEIGHT-(YBORDER*2))/FNY ))

(( X1OFF=0 ))
(( X2OFF=0 ))
(( X3OFF=(X1*FNX)+(XBORDER*2) ))
(( Y1OFF=YOFF ))
(( Y2OFF=(Y1*FNY)+(YBORDER*2)+YOFF+TITLEHEIGHT ))
(( Y3OFF=YOFF ))

xterm -geometry ${X1}x${Y1}+${X1OFF}+${Y1OFF} -fn ${FNX}x${FNY} -bg ${BG} -fg ${FG} &
xterm -geometry ${X2}x${Y2}+${X2OFF}+${Y2OFF} -fn ${FNX}x${FNY} -bg ${BG} -fg ${FG} &
xterm -geometry ${X3}x${Y3}+${X3OFF}+${Y3OFF} -fn ${FNX}x${FNY} -bg ${BG} -fg ${FG} &

