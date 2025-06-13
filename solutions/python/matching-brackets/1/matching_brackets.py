SIGNS = { ']': '[', '}': '{', ')': '(' }

def is_paired(input_string):
    stack = []

    for char in input_string:
        if char in SIGNS.values(): stack.append(char)

        if char in SIGNS.keys():
            if not stack or stack.pop() != SIGNS[char]: return False

    return len(stack) == 0
    
