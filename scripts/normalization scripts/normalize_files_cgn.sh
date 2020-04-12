## This script performs built-in rules and regular expression to normalize all text files in the current folder

for f in *.txt; do
    benchmarkstt-tools normalization --inputfile "$f" --outputfile "reference_$f" --lowercase --regex "[,.\?!:\"\'\´\`\-\–\−\–\—;]|(xxx)|(ggg)|(\*v)|(\*d)|(\*z)|(\*n)|(\*t)|(\*a)|(\*u)|(\*x)" ""
    echo "Processing $f"
done