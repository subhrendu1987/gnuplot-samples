load "../common.plot"
set key horiz
offset=.22
set key outside center top
set terminal postscript eps enhanced dashed "Helvetica-Bold" fontfile "../../fonts/Helvetica-Bold.pfb" 40 
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

outFile='Lookahead_exetime_1.eps'
set output outFile
#set title ""
set xlabel "Experiments"
set ylabel "Total(min)"
set xrange [.5 : 3.5]
set yrange [0:1]
set xtics 1
set ytics .5
imgSep=.1
set boxwidth .15
minPoint =0

file1="Data/Execution_Time_upg.tsv"
plot "< cat ". file1  \
	   using ($1-imgSep):($4/60) with boxes notitle lc rgbcolor "red" lt 1 fs pattern 3 ;
########################################################################################
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

outFile='Lookahead_exetime_2.eps'
set output outFile
#set title ""
set xlabel "Experiments"
set ylabel "Match(ms)"
set xrange [.5 : 3.5]
set yrange [.1 : 60]
set xtics 1
set ytics 20
imgSep=.1
set boxwidth .15
minPoint =0

file1="Data/Execution_Time_upg.tsv"
plot "< cat ". file1  \
	 using ($1-imgSep):($3*1000) with boxes notitle lc rgbcolor "black" lt 1 fs pattern 3 ;
########################################################################################
########################################################################################
########################################################################################



