import math

def score(x, y):
    hypotenuse = math.sqrt(x**2 + y**2)

    if 0 <= hypotenuse <= 1:
        return 10
    if 1 < hypotenuse <= 5:
        return 5
    if 5 < hypotenuse <= 10:
        return 1
    return 0
