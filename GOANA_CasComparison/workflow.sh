
perl code/extractFlanking.pl data/SRR7352859_cas9.txt 1 results/Cas9_targets.cutFlanks.txt
perl code/extractFlanking.pl data/SRR6058551_cas12a.txt 2 results/Cas12a_taregets.cutFlanks.txt

python3 code/calculateFlankingHammingDistance.py --input results/Cas9_targets.cutFlanks.txt --output results/Cas9_targets.cutFlanks.hammingDistance.txt
python3 code/calculateFlankinghammingDistance.py --input results/Cas12a_targets.cutFlanks.txt --output results/Cas12a_targets.cutFlanks.hammingDistance.txt

perl code/convertToBed.pl results/Cas9_targets.cutFlanks.hammingDistance.txt results/Cas9_targets.cutFlanks.hammingDistance.bed
perl code/convertToBed.pl results/Cas12a_targets.cutFlanks.hammingDistance.txt results/Cas12a_targets.cutFlanks.hammingDistance.bed