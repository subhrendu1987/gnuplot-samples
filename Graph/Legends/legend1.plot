load "../common.plot"
#set terminal tikz color
#set output 'plotSysParam.eps'
#set size 6,1
set key outside center top
#set key horizontal maxrows 2
set key above vertical maxrows 2
#set key width 25 height 100
#########################################################################################
PlotID="LegendBox-1"
set size 1, 0.1
#set origin 0,0
set key font "Helvetica, Bold 6"
#set key box lt -1 lw 2
#outFile='legendbox.tex'
outFile='legendbox_3.eps
set output outFile
#set title ""
set xrange [0 : 0.1]
set yrange [0 : 0.1]

unset border
unset xtics
unset ytics
unset xlabel
unset ylabel
plot "../MaxBackTrace/Data/ExeTime_Bar.tsv" \
        using (1):(0):(0):3:3 with candlesticks fill pattern 1 title "BT=2" ls 27 whiskerbars, \
	'' using 1:(0):(0):4:4 with candlesticks fill pattern 3 title "BT=3" ls 28 whiskerbars, \
	'' using (1):(0):(0):5:5 with candlesticks fill pattern 12 title "BT=4" ls 29 whiskerbars,\
	'' using ($1):(0):(0):6:6 with candlesticks fill pattern 3 title "BT=5" ls 29 whiskerbars;
