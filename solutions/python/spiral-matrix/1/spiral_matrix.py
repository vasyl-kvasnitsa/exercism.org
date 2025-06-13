def spiral_matrix(size):
    matrix = [[1] * size for _ in range(size)]
    top = left = 0
    bottom = right = size

    counter = iter(range(1, size*size+1))
    while top <= bottom and left <= right:
        for i in range(left, right):
            matrix[top][i] = next(counter)

        top += 1
        for i in range(top, bottom):
            matrix[i][right-1] = next(counter)

        right -= 1
        for i in range(right-1, left-1, -1):
            matrix[bottom-1][i] = next(counter)

        bottom -= 1
        for i in range(bottom-1, top-1, -1):
            matrix[i][left] = next(counter)

        left += 1
    return matrix
