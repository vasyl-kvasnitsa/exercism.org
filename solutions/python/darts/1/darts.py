import math

def score(x, y):
    radius = math.sqrt(x**2 + y**2)

    if 0 <= radius <= 1:
        return 10
    if 1 < radius <= 5:
        return 5
    if 5 < radius <= 10:
        return 1
    return 0
