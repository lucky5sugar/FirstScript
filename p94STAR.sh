#!/bin/bash
#DRY analysis p.94

module load STAR

for sample in `ls ../seq/*fastq.gz | xargs basename | cut -f1 -d"_" | uniq`
do
echo mapping:${sample}
STAR --runMode alignReads --genomeDir ../ref/STAR_reference \
--readFilesCommand gunzip -c --readFilesIn ../seq/${sample}_1.fastq.gz \
../seq/${sample}_2.fastq.gz --outSAMtype BAM SortedByCoordinate --runThreadN 12 \
--quantMode TranscriptomeSAM --outFileNamePrefix ${sample}
done

echo finished

