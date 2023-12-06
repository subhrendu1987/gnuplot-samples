reset
set terminal postscript eps enhanced dashed "Helvetica-Bold" fontfile "../../fonts/Helvetica-Bold.pfb" 24 color
set print "-"
set size 2,1
set style fill solid 1 noborder
#set style fill solid 0.5 noborder
#################################################################################################	
# Multiplot parameters
rows=3
cols=4
delR=(0.95/(rows+1))
delC=(0.95/(cols-1))
set size delR,delC*1.1
MOD(p,q)=p-(floor(p/q)*q)
#################################################################################################	
#### Box plot parameters
#set key left top
num_of_categories=2
param=.4
set boxwidth .4
dx=param/num_of_categories
offset=0.2
### Line styles
set style line 1 lc rgb "#ffff00" lt 3 dt (1,6,6,6) pt 0 ps 0.9  lw 14		#Yellow Change it
set style line 2 lc rgb "#660033" lt 3 dt (1,6,6,6) pt 0 ps 0.9  lw 14		#Brown
set style line 3 lc rgb "#33cc33" lt 3 dt (1,.5,1,.5) pt 0 ps 0.9  lw 14	#Green
set style line 4 lc rgb "#660066" lt 3 dt (1,.5,1,.5) pt 0 ps 0.9  lw 14	#Violet
set style line 5 lc rgb "#000000" lt 3 dt (1,.5,1,.5) pt 0 ps 0.9  lw 14	#Black

set style line 6 lt 1 pt 1 ps 0.5 lc rgb "#660066" lw 14	#Violet
set style line 7 lt 1 pt 3 ps 0.5 lc rgb "#660033" lw 14	#Brown
set style line 8 lt 1 pt 3 ps 0.5 lc rgb "#0000FF" lw 14	#Blue
set style line 9 lt 1 pt 3 ps 0.5 lc rgb "#FF0000" lw 14	#Red
set style line 10 lt 1 pt 3 ps 0.5 lc rgb "#000000" lw 14	#Black
#################################################################################################	
#Select fill pattern as per you choice
### 0-> Transparent, 1->Medium Double Hatched, 2-> Dense Double Hatched, 3-> Solid, 
### 4 & 5-> Single Hatched, 6 & 7-> Dotted Single Hatched
#################################################################################################	
set style line 21 lt 1 pt 1 lc rgb "#ff0000" lw 1	#CandelStickRed
set style line 22 lt 1 pt 1 lc rgb "#0000ff" lw 1 	#CandelStickBlack
set style line 23 lt 1 pt 1 lc rgb "#ffff00" lw 1	#CandelStickMiddleWhite
set style line 24 lt 1 pt 1 lc rgb "#000000" lw 1	#CandelStickMiddleBlack
set style line 25 lc rgb "#ffffff" lw 0.1	        #Transparent
set style line 26 lt 1 pt 1 lc rgb "#000000" lw 1	#CandelStickMiddleBlack
set style line 27 lt 1 pt 1 lc rgb "#660066" lw 1	#CandelStickViolet
set style line 28 lt 1 pt 1 lc rgb "#110066" lw 1	#CandelStickBlue
set style line 29 lt 1 pt 1 lc rgb "#337744" lw 1	#CandelStickGreen
#################################################################################################	
set yrange [0 : 1.1]
set ylabel "CDF"
set grid
set key outside center top
bin(x, s) = s*int(x/s)
#################################################################################################	
set size 1,0.7
###################################
#### Sample Comment
if (1 == 2) {
###################################
PlotID=1
#set origin 2,0
set size 1,0.7
outFile="plotmem.eps"
set output outFile
set ylabel "Memory Utilization (MB)"
set xlabel "Choice of {/Symbol m}C"
set xrange [0 : *]
set yrange [0 : *]

#''	every 2::0 using ($1):1:xticlabels(8) with lines ls 25 lw 0 notitle;
plot "data/muChoice/mem.csv.candel.tsv"  using 1:3:2:6:5:xticlabels(7) with candlesticks notitle lc rgb "red"  whiskerbars, \
	''	using 1:4:4:4:4 with candlesticks lc rgb "black" lw 5 notitle;

xOffset=.1*(GPVAL_DATA_X_MAX-GPVAL_DATA_X_MIN)
yOffset=.05*(GPVAL_DATA_Y_MAX-GPVAL_DATA_Y_MIN)
set xrange [GPVAL_DATA_X_MIN-xOffset:GPVAL_DATA_X_MAX+xOffset]
set yrange [GPVAL_DATA_Y_MIN-yOffset:GPVAL_DATA_Y_MAX+yOffset]
set output outFile
replot;
############################################################################################
#unset multiplot
###################################
} else {
###################################
}
