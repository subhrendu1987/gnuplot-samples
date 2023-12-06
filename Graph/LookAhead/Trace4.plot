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
set bars 1.0
#set style boxplot outliers pointtype 7
set style data histogram
set style histogram rowstacked
#set style data boxplot

outFile='ULF_mem.eps'
set output outFile
#set title ""
set xlabel "Experiments"
set ylabel "Memory(MB)"
set xrange [.5 : 3.5]
set yrange [0:250]
set xtics 1
set ytics 50
imgSep=.1
set boxwidth .15
minPoint =0

file1="Data/Memory_ulf.tsv"
plot "< cat ". file1  \
	   using ($1-imgSep):($3) with boxes axes x1y1 notitle lc rgbcolor "red" lt 1 fs pattern 3 , \
	''	using 1:(0):xticlabels(2) with lines ls 25 lw 0 notitle;
########################################################################################
########################################################################################
########################################################################################
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
set bars 1.0
#set style boxplot outliers pointtype 7
set style data histogram
set style histogram rowstacked
#set style data boxplot

outFile='UPG_mem.eps'
set output outFile
#set title ""
set xlabel "Experiments"
set ylabel "Memory(MB)"
set xrange [.5 : 3.5]
set yrange [0:250]
set xtics 1
set ytics 50
imgSep=.1
set boxwidth .15
minPoint =0

file1="Data/Memory_upg.tsv"
plot "< cat ". file1  \
	   using ($1-imgSep):($3) with boxes axes x1y1 notitle lc rgbcolor "red" lt 1 fs pattern 3 , \
	''	using 1:(0):xticlabels(2) with lines ls 25 lw 0 notitle;
########################################################################################
########################################################################################
########################################################################################
