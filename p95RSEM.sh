#!/bin/bash
#DRY analysis-2 p.95

for sample in `ls ~/DRYanalysisKYOHON/expression/seq/*.fastq | \
xargs basename -a | cut -f1 -d"_" | uniq`

do
~/programs/RSEM-1.3.1/rsem-calculate-expression --num-threads 12 \
--paired-end --bam ${sample}Aligned.toTranscriptome.out.bam \
~/DRYanalysisKYOHON/expression/ref/RSEM_reference/RSEM_reference ${sample}
done