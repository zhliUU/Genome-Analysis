sed 's/[^.]*$/\/&/' <<<"test.test2.jpg"
sed -i '/@SRR6040095/ s_$_/1_' FILEREAD1
cat output_forward_paired.fq | sed 's/\./\//g' > reformat_forward_paired.fq
cat output_reverse_paired.fq | sed 's/\./\//g' > reformat_reverse_paired.fq

#\.1(?!.*\.1)
#these can select the .1 and .2 in test, but not working
cat output_forward_paired.fq | sed 's/\.1(?!.*\.1)/\/1/g' > reformat_forward_paired.fq
cat output_reverse_paired.fq | sed 's/\.2(?!.*\.2)/\/2/g' > reformat_reverse_paired.fq

sed 's/.*\./&\//'
#error when having ./1 name formatting
cat output_forward_paired.fq | sed 's/.*\./&\//' > reformat2_forward_paired.fq
cat output_reverse_paired.fq | sed 's/.*\./&\//' > reformat2_reverse_paired.fq
