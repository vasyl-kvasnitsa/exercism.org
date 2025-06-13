class EmptyListException(Exception):
    def __init__(self, message):
        self.message = message

class Node:
    def __init__(self, value, next):
        self._value = value
        self._next = next

    def value(self):
        return self._value

    def next(self):
        return self._next

class LinkedList:
    def __init__(self, values=[]):
        self.entry_node = None
        self.length = 0
        [self.push(v) for v in values]
            
    def __iter__(self):
        next_node = self.entry_node
        while next_node:
            yield next_node.value()
            next_node = next_node.next()

    def __len__(self):
        return self.length

    def head(self):
        if not len(self): raise EmptyListException("The list is empty.")
        return self.entry_node

    def push(self, value):
        self.entry_node = Node(value, self.entry_node)
        self.length += 1

    def pop(self):
        if not len(self): raise EmptyListException("The list is empty.")
        self.length -= 1
        val = self.entry_node.value()
        self.entry_node = self.entry_node.next()
        return val

    def reversed(self):
        return list(self)[::-1]
