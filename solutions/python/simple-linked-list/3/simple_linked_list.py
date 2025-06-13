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
        [self.push(v) for v in values]
            
    def __iter__(self):
        next_node = self.entry_node

        while next_node:
            yield next_node.value()
            next_node = next_node.next()

    def __len__(self):
        length = 0
        node = self.entry_node
        
        while node:
            length += 1
            node = node.next()

        return length

    def head(self):
        if not self.entry_node: raise EmptyListException("The list is empty.")
        return self.entry_node

    def push(self, value):
        self.entry_node = Node(value, self.entry_node)

    def pop(self):
        if not self.entry_node: raise EmptyListException("The list is empty.")
        val = self.entry_node.value()
        self.entry_node = self.entry_node.next()
        return val

    def reversed(self):
        return list(self)[::-1]
