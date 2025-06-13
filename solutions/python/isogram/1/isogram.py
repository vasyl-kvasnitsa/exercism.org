def is_isogram(string):
    letters = [s for s in list(string.lower()) if s.isalpha()]
    
    return len(letters) == len(set(letters))
