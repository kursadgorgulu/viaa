import io
import os
from os.path import join
from praatio import tgio

def resaveFile(inputFn, outputFn, inputEncoding, outputEncoding):
    assert(inputFn != outputFn)

    with io.open(inputFn, mode="r", encoding=inputEncoding) as fd:
        data = fd.read()

    with io.open(outputFn, mode="w", encoding=outputEncoding) as fd:
        fd.write(data)


def extractTranscriptContents(fn, outputFn, tiersToNotInclude=None):
    assert(fn != outputFn)

    tg = tgio.openTextgrid(fn)
    tierNameList = tg.tierNameList
    if tiersToNotInclude != None:
        tierNameList = list(filter(lambda tierName: tierName not in tiersToNotInclude, tierNameList))

    outputList = []
    for tierName in tierNameList:
        tier = tg.tierDict[tierName]
        for entry in tier.entryList:
            outputList.append([fn, tierName,] + [val for val in entry])

    outputList = sorted(outputList, key=lambda row: row[2]) # Sort by the third column
    outputList = [row[-1] for row in outputList]

    outputTxt = "\n".join(outputList)
    with io.open(outputFn, mode="w", encoding="utf-8") as fd:
        fd.write(outputTxt)


def mkdir(newFolder):
    if not os.path.exists(newFolder):
        os.mkdir(newFolder)


def processCorpus(corpusRoot, cleanedTextgridFolder, outputTxtFolder):
    mkdir(cleanedTextgridFolder)
    mkdir(outputTxtFolder)

    tiersToNotInclude = ["COMMENT"]

    for fn in os.listdir(corpusRoot):
        if ".ort" not in fn:
            continue

        name = os.path.splitext(fn)[0]

        resaveFile(join(corpusRoot, fn), join(cleanedTextgridFolder, fn), "cp1252", "utf-16")
        extractTranscriptContents(join(cleanedTextgridFolder, fn), join(outputTxtFolder, name + ".txt"), tiersToNotInclude)


if __name__ == "__main__":
    corpusRoot = "/Users/Gebruiker/Documents/Corpus_extracting/input/"
    cleanedTextgridFolder = "/Users/Gebruiker/Documents/Corpus_extracting/cleaned"
    outputTxtFolder = "/Users/Gebruiker/Documents/Corpus_extracting/extracted_texts"

    processCorpus(corpusRoot, cleanedTextgridFolder, outputTxtFolder)

