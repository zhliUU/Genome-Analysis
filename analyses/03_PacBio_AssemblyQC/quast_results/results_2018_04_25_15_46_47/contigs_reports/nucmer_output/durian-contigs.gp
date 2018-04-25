set terminal canvas jsdir ""
set output "/pica/h1/zhiwei94/Genome-Analysis/analyses/03_PacBio_AssemblyQC/quast_results/results_2018_04_25_15_46_47/contigs_reports/nucmer_output/durian-contigs.html"
set ytics ( \
 "0" 0, \
 "4000000" 4000000, \
 "8000000" 8000000, \
 "12000000" 12000000, \
 "16000000" 16000000, \
 "20000000" 20000000, \
 "24000000" 24000000, \
 "28000000" 28000000, \
 "" 31329483 \
)
set size 1,1
set grid
set key outside bottom right
set border 0
set tics scale 0
set xlabel "Reference" noenhanced
set ylabel "Assembly" noenhanced
set format "%.0f"
set xrange [1:*]
set yrange [1:31329483]
set linestyle 1  lt 1 lc rgb "red" lw 3 pt 7 ps 0.5
set linestyle 2  lt 3 lc rgb "blue" lw 3 pt 7 ps 0.5
set linestyle 3  lt 2 lc rgb "yellow" lw 3 pt 7 ps 0.5
plot \
 "/pica/h1/zhiwei94/Genome-Analysis/analyses/03_PacBio_AssemblyQC/quast_results/results_2018_04_25_15_46_47/contigs_reports/nucmer_output/durian-contigs.fplot" title "FWD" w lp ls 1, \
 "/pica/h1/zhiwei94/Genome-Analysis/analyses/03_PacBio_AssemblyQC/quast_results/results_2018_04_25_15_46_47/contigs_reports/nucmer_output/durian-contigs.rplot" title "REV" w lp ls 2
