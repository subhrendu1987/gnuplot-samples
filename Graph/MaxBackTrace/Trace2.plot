load "../common.plot"
set key horiz
offset=.22
set key outside center top
set terminal postscript eps enhanced dashed "Helvetica-Bold" fontfile "../../fonts/Helvetica-Bold.pfb" 20 
#########################################################################################

PlotID=1
#set origin 0,0
set size 1.2,0.7
#set style fill solid 0.95 border -1
set style fill pattern
set log y
set bars 1.0
#set style boxplot outliers pointtype 7
set style data histogram
set style histogram rowstacked
#set style data boxplot

outFile='Bin_Size.eps'
set output outFile
#set title ""
set ylabel "Size(MB)"  font ",30"
set xrange [.5:*]
set yrange [*:30]
set xtics 1
set ytics 5
imgSep=0
set boxwidth .25
minPoint =0
set xtics rotate

file1="Data/Bin_Size.tsv"
plot "< cat ". file1  \
	   using ($1-imgSep):($3/1000) with boxes notitle lc rgb "#660066" lt 3 fs pattern 3 , \
	''	using 1:(0):xticlabels(2) with points ls 25 lw 0 notitle;
