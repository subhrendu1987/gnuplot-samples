reset
set terminal postscript eps enhanced dashed "Helvetica-Bold" fontfile "../fonts/Helvetica-Bold.pfb" 24 color
set print "-"
set size 2,1
set style fill solid 1 noborder
#set style fill solid 0.5 noborder
#################################################################################################	
PlotID=1
set key inside left top
set xrange [0 : 1]
set yrange [0 : 1]  
set output 'dummy.eps'
set boxwidth 0.05
set xlabel ""
set ytics 0,1
set xtics 0,1
set size 1,0.7
N=45
set parametric
plot 0.5,0.4 notitle "Dummy" with points

watermark = "Place Holder";

set label 9999 watermark  center at screen 0.5,0.4  font "Helvetica-Bold, 40" textcolor "red"
set o 'dummy.eps'
replot
