#!/bin/bash
#DRY analysis p.88

while read line
do
#download sra files and compress those files
  cmd="fasterq-dump --split-files ${line};\
  gzip ${line}*fastq"
  eval ${cmd}
done <SRR_Acc_List.txt