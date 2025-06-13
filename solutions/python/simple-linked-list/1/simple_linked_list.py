class EmptyListException(Exception):
    def __init__(self, message):
        self.message = message

class Node:
    def __init__(self, value, next_node):
        self.data = value
        self.next_node = next_node

    def value(self):
        return self.data

    def next(self):
        return self.next_node

    def update_next_node(self, new_node):
        self.next_node = new_node

class LinkedList:
    def __init__(self, values=[]):
        self.index = 0
        self.nodes = []

        for i, v in enumerate(values):
            next_node = self.nodes[0] if i > 0 else None
            self.nodes.insert(0, Node(v, next_node))

    def __iter__(self):
        return map(lambda node: node.value(), self.nodes)

    def __next__(self):
        if self.index+1 == len(self): raise StopIteration
        self.index = self.index + 1
        return self.nodes[self.index]

    def __len__(self):
        return len(self.nodes)

    def head(self):
        if len(self) == 0: raise EmptyListException("The list is empty.")
        return self.nodes[0]

    def push(self, value):
        next_node = self.nodes[0] if len(self) >= 1 else None
        self.nodes.insert(0, Node(value, next_node))

    def pop(self):
        if len(self) == 0: raise EmptyListException("The list is empty.")
        if len(self) > 1: self.nodes[1].update_next_node(None)
        return self.nodes.pop(0).value()

    def reversed(self):
        return list(self)[::-1]
