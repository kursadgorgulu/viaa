## This script performs built-in rules and regular expression to normalize all text files in the current folder. 
## For each collection in the Limecraft directory a different regular expression will be needed for normalization. 
## Modify variable regexppr accordingly before running this script. 

regexppr="[,.\?!:\"\'\´\`\-\–\−\–\—;]|(xxx)|(ggg)|(\*v)|(\*d)|(\*z)|(\*n)|(\*t)|(\*a)|(\*u)|(\*x)"
   
for f in *.txt; do
    benchmarkstt-tools normalization --inputfile "$f" --outputfile "reference_$f" --lowercase --regex "$regexppr" ""
    echo "Processing $f"
done