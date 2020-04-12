## This script performs built-in rules and regular expressions to normalize all text files in the current folder

for f in *.txt; do
    benchmarkstt-tools normalization --inputfile "$f" --outputfile "reference_$f" --lowercase --regex "[,.\?!:\"\'\´\`\-\–\−\–\—;]" ""
    echo "Processing $f"
done