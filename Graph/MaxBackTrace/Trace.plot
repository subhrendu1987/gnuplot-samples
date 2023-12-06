load "../common.plot"
set key horiz
offset=.22
set key outside center top
set terminal postscript eps enhanced dashed "Helvetica-Bold" fontfile "../../fonts/Helvetica-Bold.pfb" 40
##############################################################################################
PlotID=1
#set origin 0,0
set size 1,0.7
set style fill solid 0.95 border -1

set bars 1.0
set style boxplot outliers pointtype 7
set style data boxplot
outFile='MaxBackTrace_exetime.eps'
set output outFile
#set title ""
set xlabel "BT_{th}"
set ylabel "Time(s)"
set xrange [0 : *]
set yrange [20 : 1000]
set xtics 1
set ytics 300
imgSep=.15
set boxwidth .15
minPoint =0


plot "Data/ExecutionTime.tsv" \
		using ($1):($4):($37) with yerrorbars notitle "Wget" ls 21 pt 8 ps 3,\
        ''      using ($1):($4) with linespoints notitle "Wget" ls 21,\
        ''      using ($1):($9):($38) with yerrorbars notitle "Apache2" ls 22 pt 4 ps 3,\
        ''      using ($1):($9) with linespoints notitle "Apache2" ls 22,\
        ''      using ($1):($14):($39) with yerrorbars notitle "OpenVPN" ls 24 pt 13 ps 3, \
        ''      using ($1):($14) with linespoints notitle "OpenVPN" ls 24,\
        ''	using ($1):($19):($40) with yerrorbars notitle "MySql" ls 28 pt 9 ps 3,\
        ''      using ($1):($19) with linespoints notitle "MySql" ls 28,\
        ''      using ($1):($24):($41) with yerrorbars notitle "DynamoDB" ls 26 pt 3 ps 3,\
        ''      using ($1):($24) with linespoints notitle "DynamoDB" ls 26,\
        ''      using ($1):($29):($42) with yerrorbars notitle "Magick" ls 27 pt 14 ps 3, \
        ''      using ($1):($29) with linespoints notitle "Magick" ls 27,\
        ''      using ($1):($34):($43) with yerrorbars notitle "PHP-FPM" ls 29 pt 3 ps 3, \
        ''      using ($1):($34) with linespoints notitle "PHP-FPM" ls 29;



xOffset=.1*(GPVAL_DATA_X_MAX-GPVAL_DATA_X_MIN)
yOffset=.1*(GPVAL_DATA_Y_MAX-GPVAL_DATA_Y_MIN)
set xrange [GPVAL_DATA_X_MIN-xOffset:GPVAL_DATA_X_MAX+xOffset]
set yrange [GPVAL_DATA_Y_MIN-yOffset:GPVAL_DATA_Y_MAX+yOffset]
set output outFile
replot;
#############################################################################################
PlotID=2
#set origin 0,0
set size 1,0.7
set style fill solid 0.95 border -1

set bars 1.0
set style boxplot outliers pointtype 7
set style data boxplot

outFile='MaxBackTrace_memory.eps'
set output outFile
#set title ""
set xlabel "BT_{th}"
set ylabel "Mem(MB)"
set xrange [0 : *]
set yrange [0 : 2000]
set xtics 1
set ytics 500

imgSep=.15
set boxwidth .15
minPoint =0

plot "Data/Memory.tsv" \
		using ($1):($4):($37) with yerrorbars notitle "Wget" ls 21 pt 8 ps 3,\
        ''      using ($1):($4) with linespoints notitle "Wget" ls 21,\
        ''      using ($1):($9):($38) with yerrorbars notitle "Apache2" ls 22 pt 4 ps 3,\
        ''      using ($1):($9) with linespoints notitle "Apache2" ls 22,\
        ''      using ($1):($14):($39) with yerrorbars notitle "OpenVPN" ls 24 pt 13 ps 3, \
        ''      using ($1):($14) with linespoints notitle "OpenVPN" ls 24,\
        ''	using ($1):($19):($40) with yerrorbars notitle "MySql" ls 28 pt 9 ps 3,\
        ''      using ($1):($19) with linespoints notitle "MySql" ls 28,\
        ''      using ($1):($24):($41) with yerrorbars notitle "DynamoDB" ls 26 pt 3 ps 3,\
        ''      using ($1):($24) with linespoints notitle "DynamoDB" ls 26,\
        ''      using ($1):($29):($42) with yerrorbars notitle "Magick" ls 27 pt 14 ps 3, \
        ''      using ($1):($29) with linespoints notitle "Magick" ls 27,\
        ''      using ($1):($34):($43) with yerrorbars notitle "PHP-FPM" ls 29 pt 3 ps 3, \
        ''      using ($1):($34) with linespoints notitle "PHP-FPM" ls 29;

xOffset=.1*(GPVAL_DATA_X_MAX-GPVAL_DATA_X_MIN)
yOffset=.1*(GPVAL_DATA_Y_MAX-GPVAL_DATA_Y_MIN)
set xrange [GPVAL_DATA_X_MIN-xOffset:GPVAL_DATA_X_MAX+xOffset]
set yrange [GPVAL_DATA_Y_MIN-yOffset:GPVAL_DATA_Y_MAX+yOffset]
set output outFile
replot;
#############################################################################################
PlotID=3
#set origin 0,0
set size 1,0.7
set style fill solid 0.95 border -1

set bars 1.0
#set style boxplot outliers pointtype 7
set style data histogram
set style histogram cluster

outFile='MaxBackTrace_LMS.eps'
set output outFile
#set title ""
set xlabel "BT_{th}"
set ylabel "LMS (#)"
set xrange [0 : *]
set yrange [0 : 3000]
set xtics 1
set ytics 1000

imgSep=.15
set boxwidth .15
minPoint =0

plot "Data/connectedComponent.tsv" \
                using ($1):($2) with linespoints notitle "Wget" ls 21 pt 8 ps 3,\
        ''      using ($1):($3) with linespoints notitle "Apache2" ls 22 pt 4 ps 3,\
        ''      using ($1):($4) with linespoints notitle "OpenVPN" ls 24 pt 13 ps 3,\
        ''      using ($1):($5) with linespoints notitle "MySql" ls 28 pt 9 ps 3,\
        ''      using ($1):($6) with linespoints notitle "DynamoDB" ls 26 pt 3 ps 3,\
        ''      using ($1):($7) with linespoints notitle "Magick" ls 27 pt 14 ps 3,\
        ''      using ($1):($8) with linespoints notitle "PHP-FPM" ls 29 pt 3 ps 3;
        

xOffset=.1*(GPVAL_DATA_X_MAX-GPVAL_DATA_X_MIN)
yOffset=.05*(GPVAL_DATA_Y_MAX-GPVAL_DATA_Y_MIN)
set xrange [GPVAL_DATA_X_MIN-xOffset:GPVAL_DATA_X_MAX+xOffset]
set yrange [GPVAL_DATA_Y_MIN-yOffset:GPVAL_DATA_Y_MAX+yOffset]
set output outFile
replot;
#############################################################################################
