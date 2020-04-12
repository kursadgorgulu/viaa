# viaa
This repository contains normalization scripts and scripts used to export text from corpora

# Stappenplan 
## Transcripties uit cgn exporteren
In de download van CGN vind je onder \data\annot\text\ort de ortografische transcripties. Het script extract_text_from_corpus.py vormt deze files om tot leesbare teksten die kunnen gebruikt worden in het experiment. 

Voor het uitvoeren van dit script moeten drie folders aangemaakt worden: 
- cleaned
- extracted_texts
- input

De ortografische transcripties gevonden in de download moeten gekopieerd worden naar input. Na uitvoer van extract_text_from_corpus_py komt het resultaat in extracted_texts terecht. 

## CGN normaliseren
Na het bekomen van de leesbare teksten kan normalize_files_cgn.sh gebruikt worden om de cgn te normaliseren. Deze voert reguliere expressies uit om hoofdletters om te vormen naar kleine letters, en om punctuaties en niet-woorden te verwijderen. Het resultaat is bruikbare referentiebestanden. 

## Daisies en Citybooks normaliseren
Daisies: 
normalize_files_daisy.sh werd gebruikt om de daisies te normaliseren. 

Citybooks: 
normalize_files_sheffield.sh werd gebruikt om de citybook te normaliseren.  

## Exports uit Limecraft normaliseren
Na het bekomen van de transcripties van de engines (Google - Vocapia - Speechmatics) uit Limecraft moeten nog enkele stappen ondernomen worden eer deze bruikbaar zijn voor de test. 
1) Voer delete_first_line_of_files.sh uit. De exports uit Limecraft bevatten steeds een eerste lijn met titel 'Transcript'. Het uitvoeren van dit script verwijdert deze eerste lijn in elke file. 
2) Voer change_extensions.sh uit. De exports van Limecraft zijn in csv-formaat. Om de benchmarking te kunnnen uitvoeren moeten deze omgevormd worden tot tekstbestanden. Deze script vormt alle csv-files in de folder om tot txt-files. 
3) Vervolgens kunnen de transcripties genormaliseerd worden. Voer normalize_files_hypotheses uit om de normalisatie te doen. 
