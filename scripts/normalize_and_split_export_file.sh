## This script normalizes and splits the single file exported from Limecraft into multiple files, one for each clip. 
## Before running this script, change variables filename and extension to your filename and extension ("wav" or "mp3") correspondingly. This should match the file that was exported from Limecraft. 

filename="vocapia_export_cgn"
extension="wav"

## Change extensions of .csv to .txt

for f in *.csv; do 
    mv -- "$f" "${f%.csv}.txt"
done

## Perform built-in rules and regular expressions to normalize all text files in the current folder

for f in *.txt; do
    benchmarkstt-tools normalization --inputfile "$f" --outputfile "normalized_$f" --lowercase --regex "[,.\?!:\"\'\´\`\-\–\−\–\—;*‘’()]|(Transcription Subclip)|(transcription subclip)" ""
    echo "Processing $f"
done

## Split the large file into smaller chunks for every clip

csplit --digits=2  --quiet -b "%04d.txt" --prefix=outfile "normalized_$filename.txt" "/$extension/" "{*}"

## Rename the file to match the clip

for f in *.txt; do
    v=$(head -1 "$f")
    mv "$f" "hypothese_${v::(-3)}.txt"
    echo "Processing $f"
done

## Delete the first line of every text file 

for f in *.txt; do
    tail -n +2 "$f" > "${f}".tmp && mv "${f}".tmp "$f"
    echo "Processing $f"
done

## Delete unnecessary files

rm "hypothese_﻿Name;Transcr.txt"
rm hypothese_﻿nametranscr.txt
