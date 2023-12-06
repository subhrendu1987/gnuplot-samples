load "../common.plot"
set key horiz
offset=.22
set key outside center top
set terminal postscript eps enhanced dashed "Helvetica-Bold" fontfile "../../fonts/Helvetica-Bold.pfb" 20 
#########################################################################################
PlotID=3
#set origin 0,0
set size 1.2,0.7
set style fill solid 0.95 border -1
set log y
set bars 1.0
set style boxplot outliers pointtype 7
set style data boxplot
#set key font "Helvetica, Bold 6"
outFile='LMS_BT.eps'
set output outFile
#set xlabel "Applications"
set ylabel "LMS(#)" font ",30"
set xrange [.5 : 7.5]
set yrange [0 : 2600]
#set ytic 750
set xtics rotate
#show logscale

imgSep=.075
set boxwidth .15
file1="Data/LMS_Bar.tsv"

plot "< cat ". file1  \
	   using ($1-(imgSep*3)):(0):(0):3:3 with candlesticks fill pattern 1 notitle "BT_{th}=2" ls 27 whiskerbars, \
	'' using ($1-(imgSep)):(0):(0):4:4 with candlesticks fill pattern 3 notitle "BT_{th}=3" ls 28 whiskerbars, \
	'' using ($1+imgSep):(0):(0):5:5 with candlesticks fill pattern 12 notitle "BT_{th}=4" ls 29 whiskerbars,\
	'' using ($1+(imgSep*3)):(0):(0):6:6 with candlesticks fill pattern 3 notitle "BT_{th}=5" ls 29 whiskerbars,\
	''	using 1:(0):xticlabels(2) with lines ls 25 lw 0 notitle;
########################################################################################
