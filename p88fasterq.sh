#!/bin/bash
#DRY analysis p.88

cat SRR_Acc_List.txt

while read line
do
  cmd="fasterq-dump --split-files ${line}
  gzip ${line}*fastq"
  eval ${cmd}
done
