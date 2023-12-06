load "../common.plot"
set key horiz
offset=.22
set key outside center top
set terminal postscript eps enhanced dashed "Helvetica-Bold" fontfile "../../fonts/Helvetica-Bold.pfb" 40 
#########################################################################################
PlotID=3
#set origin 0,0
set size 1,0.7
set style fill solid 0.95 border -1
set log y 10
set bars 1.0
set style boxplot outliers pointtype 7
set style data boxplot

outFile='runtimeLog.eps'
set output outFile
set xlabel "Log Types"
set ylabel "Log Size (KB)"
set xrange [.5 : 3.5]
set yrange [0 : 5000]
#show logscale

imgSep=.15
set boxwidth .15
file1="Data/LogSize.tsv"

plot "< cat ". file1  \
	   using ($1-imgSep):(0):(0):3:3 with candlesticks fill pattern 1 title "{E_1}" ls 27 whiskerbars, \
	'' using 1:(0):(0):4:4 with candlesticks fill pattern 3 title "{E_2}" ls 28 whiskerbars, \
	'' using ($1+imgSep):(0):(0):5:5 with candlesticks fill pattern 12 title "{E_3}" ls 29 whiskerbars,\
	''	using 1:(0):xticlabels(2) with lines ls 25 lw 0 notitle;
########################################################################################
