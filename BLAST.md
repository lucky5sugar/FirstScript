ログイン  
`ssh masa@192.168.1.130`

## 下準備
フォルダを作っておく  
例  
`mkdir DUX`

## 1. 配列データダウンロード
`module load sratoolkit`  
fastqファイルダウンロード(sraも同時にダウンロードされる)  
`fasterq-dump <accession>`  
`fasterq-dump SRR10539959`  

（圧縮ファイルであるsraファイルをダウンロードしてもいい）  
`prefetch SRR10539959`  
sraからfastqファイルを展開  
`fastq-dump -O <output先> <input_accession>`

## 2. fastqをfastaへ
`module load seqkit`  
fastq --> fasta  
`seqkit fq2fa SRR10539959.fastq > SRR10539959.fa`  

## 3. Blast
`module load ncbi-blast`  
Subjectのdatabaseを作る  
`makeblastdb -in <input_file_name> -dbtype nucl -out <output_DataBase_name> -parse_seqids`  
例  
`makeblastdb -in SRR10539959.fa -dbtype nucl -out SRR10539959DB -parse_seqids`  

Blast本番  
`blastn -db SRR10539959DB -query DUX.fa -out SRR10539959.txt`  

※初めのコマンドと，ハイフンのついたパラメーターは固定で，それ以外は自分で名前をつけて下さい．

### 参考文献
seqkit  
http://kazumaxneo.hatenablog.com/entry/2017/08/08/235042  
blast  
https://bi.biopapyrus.jp/seq/blast/
