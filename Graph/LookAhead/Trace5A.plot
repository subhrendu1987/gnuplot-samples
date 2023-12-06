load "../common.plot"
set key horiz
offset=.22
set key above horizontal maxrows 2
set terminal postscript eps enhanced dashed "Helvetica-Bold" fontfile "../../fonts/Helvetica-Bold.pfb" 30
#########################################################################################
PlotID=1
#set origin 0,0
set size 1,0.7
#set style fill solid 0.95 border -1
set style fill pattern
#set log y
#set log y2
set bars 1.0
#set style boxplot outliers pointtype 7
set style data histogram
set style histogram rowstacked
#set style data boxplot

outFile='phase_exetime.eps'
set output outFile
#set title ""
set xlabel "Experiments"
set ylabel "Time(s)"
set xrange [.5 : 3.5]
set yrange [0:*]
set xtics 1
set ytics .3
imgSep=.1
set boxwidth .15
minPoint =0

file1="Data/Execution_Time_ulf.tsv"
plot "< cat ". file1  \
	   using ($1):($3+$4) with boxes fill pattern 3 title "ASCL Gen"  ls 28, \
	'' using ($1):($3) with boxes fill pattern 1 title "Parsing"  ls 27,\
	'' using 1:(0):xticlabels(2) with points lw 0 notitle;
########################################################################################
PlotID=2
#set origin 0,0
set size 1,0.7
#set style fill solid 0.95 border -1
set style fill pattern
#set log y
#set log y2
set bars 1.0
#set style boxplot outliers pointtype 7
set style data histogram
set style histogram rowstacked
#set style data boxplot

outFile='phase_mem.eps'
set output outFile
#set title ""
set xlabel "Experiments"
set ylabel "Mem(Bytes)"
set xrange [.5 : 3.5]
set yrange [200:235]
#set xtics 1
set ytics 5
imgSep=.075
set boxwidth .15
minPoint =0


file1="Data/Memory_ulf.tsv"
plot "Data/Memory_ulf.tsv" \
	using ($1-imgSep):($3) with boxes fill pattern 3 title "ASCL Gen" ls 28, \
	"Data/Memory_upg.tsv" using ($1+imgSep):($3) with boxes fill pattern 12 title "UPG Gen"  ls 29, \
	''	using 1:(0):xticlabels(2) with lines ls 25 lw 0 notitle;
########################################################################################
