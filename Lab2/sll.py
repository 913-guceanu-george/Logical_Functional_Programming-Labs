class Node:
    def __init__(self, cont: int):
        self.content = cont
        self.next = None


class List:
    def __init__(self):
        self.first = Node(0)

    def add(self, head: Node, node: Node):
        if head.next is None:
            head.next = node
            return
        self.add(head.next, node)

    def display(self, head: Node):
        if head.content != 0:
            print(head.content)
        if head.next is None:
            return
        self.display(head.next)


'''
crearea unei liste din valori citite pana la 0
'''


def createList():
    lista = List()
    lista.first = createListRecursively()
    return lista


def createListRecursively():
    x = int(input("x="))
    if x == 0:
        return None
    else:
        node = Node(x)
        node.next = createListRecursively()
        return node


'''
tiparirea elementelor unei liste
'''


def tipar(lista):
    tipar_rec(lista.first)


def tipar_rec(node):
    if node != None:
        print(node.e)
        tipar_rec(node.next)


'''
program pentru test
'''


# def main():
#     lista = createList()
#     tipar(lista)


# main()
