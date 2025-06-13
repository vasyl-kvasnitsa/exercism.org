NEIGHBORS_COORDINATES = lambda r, c: [(r-1, c-1), (r-1, c), (r-1, c+1),
                                      (r,   c-1),           (r,   c+1),
                                      (r+1, c-1), (r+1, c), (r+1, c+1)]

def annotate(minefield):
    if len(set(map(len, minefield))) > 1 or not all(c in ' *' for r in minefield for c in r):
        raise ValueError('The board is invalid with current input.')


    field = minefield
    for i, row in enumerate(minefield):
        for j, cell in enumerate(row):
            if cell != '*': continue

            for r, c in NEIGHBORS_COORDINATES(i, j):
                if 0 <= r < len(minefield) and 0 <= c < len(row) and field[r][c] != '*':
                    new_value = 1 if field[r][c] == ' ' else int(field[r][c])+1
                    field[r] = field[r][:c] + str(new_value) + field[r][c+1:]

    return field
