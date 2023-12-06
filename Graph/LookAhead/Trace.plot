load "../common.plot"
set key horiz
offset=.22
set key outside center top
set terminal postscript eps enhanced dashed "Helvetica-Bold" fontfile "../../fonts/Helvetica-Bold.pfb" 30 
##############################################################################################
PlotID="1"
#set origin 0,0
set size 1,0.7
set style fill solid
set bars 1.0
set style boxplot outliers pointtype 7
set style data boxplot
set boxwidth 1
set xtics 5
set ytics 10
outFile='UPG_GenTime.eps'
set output outFile
#set title ""
set xlabel "Look Ahead Level"
set ylabel "Generation Time (s)"
set xrange [0 : *]
set yrange [0 : *]

file1="Data/UPG_GenTime.tsv"

plot "< cat ". file1  using ($1):($2) smooth csplines notitle "" ls 26, \
	''	using ($1):($2):(sqrt($3)) with yerrorbars title "UPG Construction Duration" ls 26 pt 6 ps 3;

xOffset=.1*(GPVAL_DATA_X_MAX-GPVAL_DATA_X_MIN)
yOffset=.05*(GPVAL_DATA_Y_MAX-GPVAL_DATA_Y_MIN)
set xrange [GPVAL_DATA_X_MIN-xOffset:GPVAL_DATA_X_MAX+xOffset]
set yrange [GPVAL_DATA_Y_MIN-yOffset:GPVAL_DATA_Y_MAX+yOffset]
set output outFile
replot;
#############################################################################################
PlotID="2"
#set origin 0,0
set size 1,0.7
set style fill solid
set bars 1.0
set style boxplot outliers pointtype 7
set style data boxplot
set boxwidth 1
set xtics 5
set ytics 10
outFile='UPG_MatchTime.eps'
set output outFile
#set title ""
set xlabel "Look Ahead Level"
set ylabel "Generation Time (s)"
set xrange [0 : *]
set yrange [0 : *]

file1="Data/UPG_GenTime.tsv"

plot "< cat ". file1  using ($1):($2) smooth csplines notitle "" ls 26, \
	''	using ($1):($2):(sqrt($3)) with yerrorbars title "UPG Construction Duration" ls 26 pt 6 ps 3;

xOffset=.1*(GPVAL_DATA_X_MAX-GPVAL_DATA_X_MIN)
yOffset=.05*(GPVAL_DATA_Y_MAX-GPVAL_DATA_Y_MIN)
set xrange [GPVAL_DATA_X_MIN-xOffset:GPVAL_DATA_X_MAX+xOffset]
set yrange [GPVAL_DATA_Y_MIN-yOffset:GPVAL_DATA_Y_MAX+yOffset]
set output outFile
replot;
#############################################################################################
PlotID=3
#set origin 0,0
set size 1,0.7
set style fill solid 0.95 border -1
set bars 1.0
set style boxplot outliers pointtype 7
set style data boxplot

outFile='lookAhead_UPG.eps'
set output outFile
#set title ""
set xlabel "Properties"
set ylabel "UPG Properties"
set xrange [0 : *]
set yrange [0 : *]
imgSep=.15
set boxwidth .15
file1="Data/params.tsv"

plot "< cat ". file1  using ($1-imgSep):(0):(0):2:2 with candlesticks fill pattern 1 title "Log Set 1" ls 27 whiskerbars, \
	'' using 1:(0):(0):3:3 with candlesticks fill pattern 3 title "Log Set 2" ls 28 whiskerbars, \
	'' using ($1+imgSep):(0):(0):4:4 with candlesticks fill pattern 12 title "Log Set 3" ls 29 whiskerbars,\
	''	using 1:1:xticlabels(5) with lines ls 25 lw 0 notitle;

xOffset=.1*(GPVAL_DATA_X_MAX-GPVAL_DATA_X_MIN)
yOffset=.05*(GPVAL_DATA_Y_MAX-GPVAL_DATA_Y_MIN)
set xrange [GPVAL_DATA_X_MIN-xOffset:GPVAL_DATA_X_MAX+xOffset]
set yrange [GPVAL_DATA_Y_MIN-yOffset:GPVAL_DATA_Y_MAX+yOffset]
set output outFile
replot;
#############################################################################################
