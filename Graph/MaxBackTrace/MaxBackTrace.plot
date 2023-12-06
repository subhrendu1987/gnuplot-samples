load "../common.plot"
#set terminal postscript eps enhanced dashed 40 color
#set output 'plotSysParam.eps'
#set size 6,1
set key outside center top
set key horiz
##############################################################################################
PlotID="1"
#set origin 0,0
set size 1,0.7
set style fill solid
set bars 1.0
set style boxplot outliers pointtype 7
set style data boxplot
set boxwidth 1

outFile='mb_Execution_Time.eps'
set output outFile
#set title ""
set xlabel "Max Back Trace"
set ylabel "Execution Time(s)"
set xrange [0 : *]
set yrange [0 : *]
imgSep=.25
file1="Data/mb_ExecutionTime.tsv"
file2=" "

plot "< cat ". file1  using ($1):($2) smooth csplines notitle "WGET" ls 26, \
	''	using ($1):($2):(sqrt($5)) with yerrorbars title "WGET" ls 26 pt 6 ps 3,\
	''  using ($1):($4) smooth csplines notitle "APACHE",\
	''	using ($1):($4):(sqrt($5)) with yerrorbars title "APACHE" ls 21 pt 8 ps 3;
	''  using ($1):($4) smooth csplines notitle "APACHE",\
	''	using ($1):($4):(sqrt($5)) with yerrorbars title "APACHE" ls 21 pt 8 ps 3;

xOffset=.1*(GPVAL_DATA_X_MAX-GPVAL_DATA_X_MIN)
yOffset=.05*(GPVAL_DATA_Y_MAX-GPVAL_DATA_Y_MIN)
set xrange [GPVAL_DATA_X_MIN-xOffset:GPVAL_DATA_X_MAX+xOffset]
set yrange [GPVAL_DATA_Y_MIN-yOffset:GPVAL_DATA_Y_MAX+yOffset]
set output outFile
replot;

