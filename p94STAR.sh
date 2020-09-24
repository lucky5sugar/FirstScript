#!/bin/bash
#DRY analysis p.94

module load STAR

for sample in `ls ~/DRYanalysisKYOHON/expression/seq/*.fastq | \
xargs basename -a | cut -f1 -d"_" | uniq`

do
echo mapping:${sample}
STAR --runMode alignReads --genomeDir ~/DRYanalysisKYOHON/expression/ref/STAR_reference \
--readFilesIn ~/DRYanalysisKYOHON/expression/seq/${sample}_1.fastq \
~/DRYanalysisKYOHON/expression/seq/${sample}_2.fastq --outSAMtype BAM SortedByCoordinate \
--runThreadN 12 --quantMode TranscriptomeSAM --outFileNamePrefix ${sample}
done

echo finished