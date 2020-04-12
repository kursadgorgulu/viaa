## This script performs built-in rules and regular expressions to normalize all text files in current folder
## Remove numbers 1, 2, 3 and 4 because transcription text containts chapter sequence numbers which are not pronounced by speaker

for f in *.txt; do
    benchmarkstt-tools normalization --inputfile "$f" --outputfile "reference_$f" --lowercase --regex "[,.\?!:\"\'\´\`\-\–\−\–\—;1234]" ""
    echo "Processing $f"
done