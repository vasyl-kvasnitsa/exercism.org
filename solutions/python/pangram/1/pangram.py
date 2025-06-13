def is_pangram(sentence):
    return len([l for l in set(sentence.upper()) if l.isalpha()]) == 26
