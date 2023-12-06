load "../common.plot"
#set terminal tikz color
#set output 'plotSysParam.eps'
#set size 6,1
set key outside center top
#set key horizontal maxrows 2
set key above vertical maxrows 2
#set key width 25 height 100
#########################################################################################
PlotID="LegendBox-1"
set size 1, 0.1
#set origin 0,0
set key font "Helvetica, Bold 6"
#set key box lt -1 lw 2
#outFile='legendbox.tex'
outFile='legendbox_1.eps
set output outFile
#set title ""
set xrange [0 : 0.1]
set yrange [0 : 0.1]

unset border
unset xtics
unset ytics
unset xlabel
unset ylabel
plot "../MaxBackTrace/Data/ExecutionTime.tsv" \
        using ($1):($4):($37) with yerrorbars title "Wget" ls 21 pt 8 ps 3,\
        ''  using ($1):($9):($38) with yerrorbars title "Apache2" ls 22 pt 4 ps 3,\
        ''  using ($1):($14):($39) with yerrorbars title "OpenVPN" ls 24 pt 13 ps 3, \
        ''  using ($1):($19):($40) with yerrorbars title "MySql" ls 28 pt 9 ps 3;
        #''  using ($1):($24):($41) with yerrorbars title "DynamoDB" ls 26 pt 3 ps 3,\
        #''  using ($1):($29):($42) with yerrorbars title "Magick" ls 27 pt 14 ps 3, \
        #''  using ($1):($34):($43) with yerrorbars title "PHP-FPM" ls 29 pt 3 ps 3;
#########################################################################################
PlotID="LegendBox-2"
set size 1, 0.1
#set origin 0,0
set key font "Helvetica, Bold 6"
#set key box lt -1 lw 2
#outFile='legendbox.tex'
outFile='legendbox_2.eps
set output outFile
#set title ""
set xrange [0 : 0.1]
set yrange [0 : 0.1]

unset border
unset xtics
unset ytics
unset xlabel
unset ylabel
plot "../MaxBackTrace/Data/ExecutionTime.tsv" \
          using ($1):($24):($41) with yerrorbars title "DynamoDB" ls 26 pt 3 ps 3,\
        ''  using ($1):($29):($42) with yerrorbars title "Magick" ls 27 pt 14 ps 3, \
        ''  using ($1):($34):($43) with yerrorbars title "PHP-FPM" ls 29 pt 3 ps 3;
