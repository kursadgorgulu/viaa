## This script normalizes and splits the single file exported from Limecraft into multiple files, one for each clip. 
## Change filename to your filename (without extension) before running this script. This is the file exported from Limecraft. 

filename="vocapia_export_cgn"

## Change extensions of .csv to .txt

for f in *.csv; do 
    mv -- "$f" "${f%.csv}.txt"
done

## Perform built-in rules and regular expressions to normalize all text files in the current folder

for f in *.txt; do
    benchmarkstt-tools normalization --inputfile "$f" --outputfile "normalized_$f" --lowercase --regex "[,.\?!:\"\'\´\`\-\–\−\–\—;]|(Transcription Subclip)|(transcription subclip)" ""
    echo "Processing $f"
done

## Split the large file into smaller chunks for every clip

csplit --digits=2  --quiet -b "%04d.txt" --prefix=outfile "normalized_$filename.txt" "/wav/" "{*}"

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
