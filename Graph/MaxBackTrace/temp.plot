load "../common.plot"
set key horiz
offset=.22
set key outside center top
set terminal postscript eps enhanced dashed "Helvetica-Bold" fontfile "../../fonts/Helvetica-Bold.pfb" 10 
##############################################################################################
PlotID=1
#set origin 0,0
set size 1,0.7
set style fill solid 0.95 border -1

set bars 1.0
set style boxplot outliers pointtype 7
set style data boxplot

outFile='MaxBackTrace_exetime.eps'
set output outFile
#set title ""
set xlabel "Max Back Trace"
set ylabel "LMS Generation Time (s)"
set xrange [0 : *]
set yrange [0 : *]
imgSep=.15
set boxwidth .15
minPoint =0

plot "Data/ExecutionTime.tsv"  using ($1-imgSep)*2:(minPoint):2:2:2 with candlesticks fill pattern 1 title "Wget" ls 21 whiskerbars, \
#	''  using ($1-imgSep)*2:2:2:2:2 with candlesticks ls 23 notitle, \
	''  using ($1+imgSep)*2:(minPoint):3:3:3 with candlesticks fill pattern 12 title "Apache2" ls 22 whiskerbars, \
#	''	using ($1+imgSep)*2:3:3:3:3 with candlesticks ls 24 notitle, \
	''  using ($1+imgSep)*2:(minPoint):4:4:4 with candlesticks fill pattern 12 title "OpenVPN" ls 25 whiskerbars, \
	''	using ($1+imgSep)*2:4:4:4:4 with candlesticks ls 24 notitle;

xOffset=.1*(GPVAL_DATA_X_MAX-GPVAL_DATA_X_MIN)
yOffset=.05*(GPVAL_DATA_Y_MAX-GPVAL_DATA_Y_MIN)
set xrange [GPVAL_DATA_X_MIN-xOffset:GPVAL_DATA_X_MAX+xOffset]
set yrange [GPVAL_DATA_Y_MIN-yOffset:GPVAL_DATA_Y_MAX+yOffset]
set output outFile
replot;
#############################################################################################
PlotID=2
#set origin 0,0
set size 1,0.7
set style fill solid 0.95 border -1
set bars 1.0
set style boxplot outliers pointtype 7
set style data boxplot

outFile='initialization.eps'
set output outFile
#set title ""
set xlabel "Service Chain configuration"
set ylabel "Flow initiation delay (ms)"
set xrange [0 : *]
set yrange [0 : *]
imgSep=.15
file1="data/flow_init_delay_amalgam.csv.candel.tsv"
file2="data/flow_init_delay_dysco.csv.candel.tsv"

plot "< cat ". file1  using ($1-imgSep)*2:3:2:6:5 with candlesticks fill pattern 1 title "Amalgam" ls 21 whiskerbars, \
	''	using ($1-imgSep)*2:4:4:4:4 with candlesticks ls 23 notitle, \
	"< cat ". file2  using ($1+imgSep)*2:3:2:6:5 with candlesticks fill pattern 12 title "Dysco" ls 22 whiskerbars, \
	''	using ($1+imgSep)*2:4:4:4:4 with candlesticks ls 24 notitle, \
	''	using ($1*2):1:xticlabels(7) with lines ls 25 lw 0 notitle;

xOffset=.1*(GPVAL_DATA_X_MAX-GPVAL_DATA_X_MIN)
yOffset=.05*(GPVAL_DATA_Y_MAX-GPVAL_DATA_Y_MIN)
set xrange [GPVAL_DATA_X_MIN-xOffset:GPVAL_DATA_X_MAX+xOffset]
set yrange [GPVAL_DATA_Y_MIN-yOffset:GPVAL_DATA_Y_MAX+yOffset]
set output outFile
replot;
#############################################################################################
#############################################################################################
PlotID="3S4"
#set origin 0,0
set size 1,0.7
set style fill solid
set bars 1.0
set style boxplot outliers pointtype 7
set style data boxplot
set boxwidth 1

outFile='3s4_end2end_delay.eps'
set output outFile
#set title ""
set xlabel "Flow Duration (s)"
set ylabel "Avg. End-to-End Delay (ms)"
set xrange [0 : *]
set yrange [0 : *]
imgSep=.25
file1="data/3s4_avg_delay_comparison.csv"
file2=" "

plot "< cat ". file1  using ($1):($2) smooth csplines notitle "WGT" ls 26, \
	''	using ($1):($2):(sqrt($5)) with yerrorbars title "WGT" ls 26 pt 6 ps 3,\
	''  using ($1):($4) smooth csplines notitle "Amalgam" ls 21, \
	''	using ($1):($4):(sqrt($5)) with yerrorbars title "Amalgam" ls 21 pt 8 ps 3;

xOffset=.1*(GPVAL_DATA_X_MAX-GPVAL_DATA_X_MIN)
yOffset=.05*(GPVAL_DATA_Y_MAX-GPVAL_DATA_Y_MIN)
set xrange [GPVAL_DATA_X_MIN-xOffset:GPVAL_DATA_X_MAX+xOffset]
set yrange [GPVAL_DATA_Y_MIN-yOffset:GPVAL_DATA_Y_MAX+yOffset]
set output outFile
replot;
#############################################################################################
PlotID="3S5"
#set origin 0,0
set size 1,0.7
set style fill solid
set bars 1.0
set style boxplot outliers pointtype 7
set style data boxplot
set boxwidth 1

outFile='3s5_end2end_delay.eps'
set output outFile
#set title ""
set xlabel "Flow Duration (s)"
set ylabel "Avg. End-to-End Delay (ms)"
set xrange [0 : *]
set yrange [0 : *]
imgSep=1
file1="data/3s5_avg_delay_comparison.csv"
file2=" "

plot "< cat ". file1  using ($1):($2) smooth csplines notitle "WGT" ls 26, \
	''	using ($1):($2):(sqrt($5)) with yerrorbars title "WGT" ls 26 pt 6 ps 3,\
	''  using ($1):($4) smooth csplines notitle "Amalgam" ls 21, \
	''	using ($1):($4):(sqrt($5)) with yerrorbars title "Amalgam" ls 21 pt 8 ps 3;

xOffset=.1*(GPVAL_DATA_X_MAX-GPVAL_DATA_X_MIN)
yOffset=.05*(GPVAL_DATA_Y_MAX-GPVAL_DATA_Y_MIN)
set xrange [GPVAL_DATA_X_MIN-xOffset:GPVAL_DATA_X_MAX+xOffset]
set yrange [GPVAL_DATA_Y_MIN-yOffset:GPVAL_DATA_Y_MAX+yOffset]
set output outFile
replot;
#############################################################################################
PlotID="3S6"
#set origin 0,0
set size 1,0.7
set style fill solid
set bars 1.0
set style boxplot outliers pointtype 7
set style data boxplot
set boxwidth 1

outFile='3s6_end2end_delay.eps'
set output outFile
#set title ""
set xlabel "Flow Duration (s)"
set ylabel "Avg. End-to-End Delay (ms)"
set xrange [0 : *]
set yrange [0 : *]
imgSep=1
file1="data/3s6_avg_delay_comparison.csv"
file2=" "

plot "< cat ". file1  using ($1):($2) smooth csplines notitle "WGT" ls 26, \
	''	using ($1):($2):(sqrt($5)) with yerrorbars title "WGT" ls 26 pt 6 ps 3,\
	''  using ($1):($4) smooth csplines notitle "Amalgam" ls 21, \
	''	using ($1):($4):(sqrt($5)) with yerrorbars title "Amalgam" ls 21 pt 8 ps 3;

xOffset=.1*(GPVAL_DATA_X_MAX-GPVAL_DATA_X_MIN)
yOffset=.05*(GPVAL_DATA_Y_MAX-GPVAL_DATA_Y_MIN)
set xrange [GPVAL_DATA_X_MIN-xOffset:GPVAL_DATA_X_MAX+xOffset]
set yrange [GPVAL_DATA_Y_MIN-yOffset:GPVAL_DATA_Y_MAX+yOffset]
set output outFile
replot;
#################################################################################################	
