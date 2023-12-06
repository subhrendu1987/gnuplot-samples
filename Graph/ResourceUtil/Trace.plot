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
set xtics 50
set ytics 25
outFile='LMSGen_CPU.eps'
set output outFile
#set title ""
set ylabel "CPU Utilization(%)"
set xlabel "Time(s)"
set xrange [0 : *]
set yrange [0 : *]

file1="Data/CPUUtil.tsv"

plot "< cat ". file1  using 1:3 smooth csplines title "Wget" ls 10, \
	''	using 1:2 smooth csplines title "Apache2" ls 9, \
	''	using 1:4 smooth csplines title "OpenVpn" ls 8;

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
set xtics 50
set ytics 1
outFile='LMSGen_Mem.eps'
set output outFile
#set title ""
set ylabel "Memory Utilization(%)"
set xlabel "Time(s)"
set xrange [0 : *]
set yrange [0 : *]

file1="Data/MemUtil.tsv"

plot "< cat ". file1  using 1:3 smooth csplines title "Wget" ls 10, \
	''	using 1:2 smooth csplines title "Apache2" ls 9, \
	''	using 1:4 smooth csplines title "OpenVpn" ls 8;


xOffset=.1*(GPVAL_DATA_X_MAX-GPVAL_DATA_X_MIN)
yOffset=.05*(GPVAL_DATA_Y_MAX-GPVAL_DATA_Y_MIN)
set xrange [GPVAL_DATA_X_MIN-xOffset:GPVAL_DATA_X_MAX+xOffset]
set yrange [GPVAL_DATA_Y_MIN-yOffset:GPVAL_DATA_Y_MAX+yOffset]
set output outFile
replot;
#############################################################################################
