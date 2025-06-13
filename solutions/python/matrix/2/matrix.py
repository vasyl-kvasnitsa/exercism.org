class Matrix:
    def __init__(self, text):
        self.rows = [[int(c) for c in row.split()] for row in text.split('\n')]

    def row(self, index):
        return self.rows[index-1]

    def column(self, index):
        return [cell[index-1] for cell in self.rows]
