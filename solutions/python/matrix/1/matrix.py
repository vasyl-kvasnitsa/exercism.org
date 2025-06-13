class Matrix:
    def __init__(self, matrix_string):
        self.rows = list(map(lambda x: x.split(), matrix_string.split("\n")))
        self.columns = [int(row[i]) for i in range(len(self.rows[0])) for row in self.rows]

    def row(self, index):
        return list(map(int, self.rows[index-1]))

    def column(self, index):
        return [self.columns[i:i+len(self.rows)] for i in range(0, len(self.columns), len(self.rows))][index-1]
