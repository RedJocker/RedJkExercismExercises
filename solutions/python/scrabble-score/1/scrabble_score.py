
def score_char(ch):
    chu = ch.upper()
    if chu in "AEIOULNRST":
        return 1
    elif chu in "DG":
        return 2
    elif chu in "BCMP":
        return 3
    elif chu in "FHVWY":
        return 4
    elif chu in "K":
        return 5
    elif chu in "JX":
        return 8
    elif chu in "QZ":
        return 10
    else:
        return 0

def score(word):
    return sum(map(score, list(word)))
