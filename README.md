
# GOANA Data Jupyter Notebook
This Jupyter Notebook shows the calculations involved in the analysis of Cas9 and Cas12a data using GOANA. Processing was done on the GOANA outputs for the Cas9 and Cas12a alignment files. GOANA  (command line) was run using default parameters except -mc flag set to 0.

To generate the supplementary figures, the data and scripts in the Comparisons folder were used. See the workflow.sh file for more information.

# Usage with Binder

click [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/BauerLab/GOANA_Data/master?filepath=ReplicateData.ipynb) 

# Overview of analysis

## Alignment

FASTQ reads were downloaded form [NCBI SRA](https://www.ncbi.nlm.nih.gov/sra)

Reads were then aligned to the hg38 reference genome using BWA (v0.7.15). An example command line is shown below.

```
bwa mem /bwa_index/hg38 fastq/SRR1593733_1.fastq fastq/SRR1593733_2.fastq > SRR1593733.sam
```

Alignments were then converted to bam format, sorted and index using samtools (v1.1). Example commands are provided below

```
samtools view -bSo SRR1593733.bam SRR1593733.sam
samtools sort -o SRR1593733.sorted.bam SRR1593733.bam
samtools index SRR1593733.sorted.bam
```

Alignments are provided in **alignments**.

## Analysis with GOANA

Alignment files were then analysed with GOANA. An example command line is provided below:

```
```

GOANA output is stored in **GOANA_output**.

## Anlaysis with CRISPRessoWGS

Alignments were analyzed with CRSIPRessoWGS, from the [CRISPResso2](https://www.nature.com/articles/s41587-019-0032-3).

Example commands are provided below:

```
CRISPRessoWGS -b treated.sorted.bam -f target_sites/sgRNA_targets.hg38.txt -r genomes/hg38.fa --name treated --exclude_bp_from_left 0 --exclude_bp_from_right 0 --ignore_substitutions > CRSIRPessoOUTPUT.txt
CRISPRessoWGS -b control.sorted.bam -f target_sites/sgRNA_targets.hg38.txt -r genomes/hg38.fa --name control --exclude_bp_from_left 0 --exclude_bp_from_right 0 --ignore_substitutions > CRSIRPessoOUTPUT_control.txt
```

The treated and control CRISPRessoWGS outputs were then compared using CRISPRessoPooledWGSCompare.

An example command line is provided below:

```
CRISPRessoPooledWGSCompare treated/ control/ -n1 treated -n2 control -n treated_vs_control
```

The output of these analyses are provided in **CRSIPRessoWGS_output**.

