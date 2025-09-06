#!/bin/bash

Query="$1"
Subject="$2"
Outfile="$3"

makeblastdb -in "$Subject" -dbtype nucl -out dbfile
tblastn -query "$Query" -db dbfile -outfmt "6 qseqid sseqid pident length qlen" > qn4blast.tsv
awk '$3 > 30 && $4 / $5 > 0.9' qn4blast.tsv > "$Outfile"
wc -l < "$Outfile"
