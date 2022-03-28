# every step: input a five char word and a five char result, output list of rest words, choose one fot next step.
# in result: y/x/n represent correct/wrong location/incorrect
# input "quit" to quit the game when input word

allWords = []
restWords = []
currentWord = ""
currentResult = ""

def wordInList(target, list):
    for word in list:
        if word == target:
            return True
    return False

# input "quit" to quit the process
def inputAWord():
    global currentWord
    currentWord = input("Input a new word: ")
    if currentWord == "quit":
        exit()
    if not wordInList(currentWord, restWords):
        print("Input word is not in the list of rest words, please re-input:")
        inputAWord()

def validResult(result):
    for ch in result:
        if ch != 'y' and ch != 'x' and ch != 'n':
            return False
    return len(result) == 5

def inputCurrentResult():
    global currentWord, currentResult
    currentResult = input(f"Input result of {currentWord}: ")
    if not validResult(currentResult):
        print("Input result is invalid, please re-input:")
        inputCurrentResult()

def readAllWords():
    global allWords
    with open("TargetWords.txt", "rt") as f:
        allWords = f.readlines()
    for i in range(0, len(allWords)-1):
        allWords[i] = allWords[i].strip()

def printWords(words):
    print(f"Current rest words ({len(words)}):")
    index = 1
    for word in words:
        ending = ""
        if index % 10 != 0:
            ending = ","
        else :
            ending = "\n"
        print(f"{index:5d} : {word}", end = ending)
        index += 1
    print()

# all filters
def charInString(targetCh, string):
    for ch in string:
        if ch == targetCh:
            return True
    return False

# n
def filterNotHaveChar(ch):
    global restWords
    newRestWords = []
    for word in restWords:
        if not charInString(ch, word):
            newRestWords.append(word)
    restWords = newRestWords

# y
def filterIsChar(ch, index):
    global restWords
    newRestWords = []
    for word in restWords:
        if word[index] == ch:
            newRestWords.append(word)
    restWords = newRestWords

# x
def filterHasCharButNotThisLocation(ch, index):
    global restWords
    newRestWords = []
    for word in restWords:
        if charInString(ch, word) and word[index] != ch:
            newRestWords.append(word)
    restWords = newRestWords


def filterAccordingCurrentResult():
    global currentWord, currentResult
    index = 0
    for ch in currentResult:
        if ch == 'n':
            filterNotHaveChar(currentWord[index])
        elif ch == 'y':
            filterIsChar(currentWord[index], index)
        elif ch == 'x':
            filterHasCharButNotThisLocation(currentWord[index], index)
        index += 1

if __name__ == "__main__":
    readAllWords()
    restWords = allWords
    while True:
        printWords(restWords)
        inputAWord()
        inputCurrentResult()
        filterAccordingCurrentResult()