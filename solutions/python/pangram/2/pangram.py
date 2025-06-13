from string import ascii_lowercase

def is_pangram(sentence):
    return len([l for l in set(sentence.upper()) if l.isalpha()]) == len(ascii_lowercase)
